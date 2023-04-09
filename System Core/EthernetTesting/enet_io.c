#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include "ti/devices/msp432e4/inc/msp.h"
#include "ti/devices/msp432e4/driverlib/driverlib.h"
#include "uartstdio.h"
#include "ustdlib.h"
#include "pinout.h"
#include "utils/locator.h"
#include "utils/lwiplib.h"
#include "lwip/apps/httpd.h"
#include "lwip/opt.h"
#include "lwip/arch.h"
#include "lwip/api.h"
#include "lwip/err.h"
#include "lwip/inet.h"
#include "lwip/netif.h"
#include "lwip/tcp.h"
#include "lwip/udp.h"
#include "io.h"
#include "cgifuncs.h"
#include "Kernal/kernal/inc/SquadRTOS.h"




#define SYSTICKHZ               100
#define SYSTICKMS               (1000 / SYSTICKHZ)


#define SYSTICK_INT_PRIORITY    0x80
#define ETHERNET_INT_PRIORITY   0xC0


struct netif netif;
ip_addr_t ipaddr, netmask, gw;





#define FLAG_TICK            0
static volatile unsigned long g_ulFlags;

extern void httpd_init(void);

static SquadRTOS_tstThread thread1;
static SquadRTOS_tstStack thread1stack;


static SquadRTOS_tstThread thread2;
static SquadRTOS_tstStack thread2stack;


static SquadRTOS_tstThread thread3;
static SquadRTOS_tstStack thread3stack;

static SquadRTOS_tstMutex mutex1;

int flag = 0;
//*****************************************************************************
//
// The file sent back to the browser in cases where a parameter error is
// detected by one of the CGI handlers.  This should only happen if someone
// tries to access the CGI directly via the broswer command line and doesn't
// enter all the required parameters alongside the URI.
//
//*****************************************************************************
#define PARAM_ERROR_RESPONSE    "/perror.htm"

#define JAVASCRIPT_HEADER                                                     \
    "<script type='text/javascript' language='JavaScript'><!--\n"
#define JAVASCRIPT_FOOTER                                                     \
    "//--></script>\n"

//*****************************************************************************
//
// Timeout for DHCP address request (in seconds).
//
//*****************************************************************************
#ifndef DHCP_EXPIRE_TIMER_SECS
#define DHCP_EXPIRE_TIMER_SECS  45
#endif

//*****************************************************************************
//
// The current IP address.
//
//*****************************************************************************
uint32_t g_ui32IPAddress;

//*****************************************************************************
//
// The system clock frequency.  Used by the SD card driver.
//
//*****************************************************************************
uint32_t g_ui32SysClock;

//*****************************************************************************
//
// The error routine that is called if the driver library encounters an error.
//
//*****************************************************************************
#ifdef DEBUG
void
__error__(char *pcFilename, uint32_t ui32Line)
{
}
#endif

//void
//SysTick_Handler(void)
//{
//    //
//    // Call the lwIP timer handler.
//    //
//    lwIPTimer(SYSTICKMS);
//}


void
TIMER2A_IRQHandler(void)
{
    //
    // Clear the timer interrupt.
    //
    MAP_TimerIntClear(TIMER2_BASE, TIMER_TIMA_TIMEOUT);

    //
    // Indicate that a timer interrupt has occurred.
    //
    HWREGBITW(&g_ulFlags, FLAG_TICK) = 1;
}

//*****************************************************************************
//
// Display an lwIP type IP Address.
//
//*****************************************************************************
void
DisplayIPAddress(uint32_t ui32Addr)
{
    char pcBuf[16];

    //
    // Convert the IP Address into a string.
    //
    usprintf(pcBuf, "%d.%d.%d.%d", ui32Addr & 0xff, (ui32Addr >> 8) & 0xff,
            (ui32Addr >> 16) & 0xff, (ui32Addr >> 24) & 0xff);

    //
    // Display the string.
    //
    UARTprintf(pcBuf);
}

//*****************************************************************************
//
// Required by lwIP library to support any host-related timer functions.
//
//*****************************************************************************
void
lwIPHostTimerHandler(void)
{
    uint32_t ui32NewIPAddress;

    //
    // Get the current IP address.
    //
    ui32NewIPAddress = lwIPLocalIPAddrGet();

    //
    // See if the IP address has changed.
    //
    if(ui32NewIPAddress != g_ui32IPAddress)
    {
        //
        // See if there is an IP address assigned.
        //
        if(ui32NewIPAddress == 0xffffffff)
        {
            //
            // Indicate that there is no link.
            //
            UARTprintf("Waiting for link.\n");
        }
        else if(ui32NewIPAddress == 0)
        {
            //
            // There is no IP address, so indicate that the DHCP process is
            // running.
            //
            UARTprintf("Waiting for IP address.\n");
        }
        else
        {
            //
            // Display the new IP address.
            //
            UARTprintf("IP Address: ");
            DisplayIPAddress(ui32NewIPAddress);
            UARTprintf("\n");
            UARTprintf("Open a browser and enter the IP address.\n");
        }

        //
        // Save the new IP address.
        //
        g_ui32IPAddress = ui32NewIPAddress;
    }

    //
    // If there is not an IP address.
    //
    if((ui32NewIPAddress == 0) || (ui32NewIPAddress == 0xffffffff))
    {
        //
        // Do nothing and keep waiting.
        //
    }
}
    void thread1function()
    {
        while(1)
        {
            //
            // Wait for a new tick to occur.
            //
            while(!g_ulFlags)
            {
                //
                // Do nothing.
                //
            }

            //
            // Clear the flag now that we have seen it.
            //
            HWREGBITW(&g_ulFlags, FLAG_TICK) = 0;

            //
            // Toggle the GPIO
            //
            MAP_GPIOPinWrite(GPIO_PORTN_BASE, GPIO_PIN_1,
                    (MAP_GPIOPinRead(GPIO_PORTN_BASE, GPIO_PIN_1) ^
                     GPIO_PIN_1));

        }
    }


void thread2function()
{
    while(1)
    {
            SquadRTOS_SVC_vTakeMutex(&mutex1,1);
            UARTprintf("1\n");
            SquadRTOS_SVC_vDelay(90);
            SquadRTOS_SVC_vReleaseMutex(&mutex1);
    }
}

void thread3function()
{
    while(1)
    {
            SquadRTOS_SVC_vTakeMutex(&mutex1,1);
            SquadRTOS_SVC_vDelay(90);
            UARTprintf("2\n");
            SquadRTOS_SVC_vDelay(90);
            SquadRTOS_SVC_vReleaseMutex(&mutex1);

    }
}


int main(void)
{
    uint32_t ui32User0, ui32User1;
    uint8_t pui8MACArray[8];

    //
    // Make sure the main oscillator is enabled because this is required by
    // the PHY.  The system must have a 25MHz crystal attached to the OSC
    // pins.  The SYSCTL_MOSC_HIGHFREQ parameter is used when the crystal
    // frequency is 10MHz or higher.
    //
    SysCtlMOSCConfigSet(SYSCTL_MOSC_HIGHFREQ);

    //
    // Run from the PLL at 120 MHz.
    //
    g_ui32SysClock = MAP_SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ |
                                             SYSCTL_OSC_MAIN |
                                             SYSCTL_USE_PLL |
                                             SYSCTL_CFG_VCO_480), 120000000);

    //
    // Configure the device pins.
    //
    PinoutSet(true, false);

    //
    // Configure debug port for internal use.
    //
    UARTStdioConfig(0, 115200, g_ui32SysClock);

    //
    // Clear the terminal and print a banner.
    //
    UARTprintf("\033[2J\033[H");
    UARTprintf("Ethernet IO Example\n\n");

    //
    // Configure SysTick for a periodic interrupt.
    //

    SquadRTOS_vinit();

    //
    // Configure the hardware MAC address for Ethernet Controller filtering of
    // incoming packets.  The MAC address will be stored in the non-volatile
    // USER0 and USER1 registers.
    //
    MAP_FlashUserGet(&ui32User0, &ui32User1);
    if((ui32User0 == 0xffffffff) || (ui32User1 == 0xffffffff))
    {
        //
        // Let the user know there is no MAC address
        //
        UARTprintf("No MAC programmed!\n");

        while(1)
        {
        }
    }

    //
    // Tell the user what we are doing just now.
    //
    UARTprintf("Waiting for IP.\n");

    //
    // Convert the 24/24 split MAC address from NV ram into a 32/16 split
    // MAC address needed to program the hardware registers, then program
    // the MAC address into the Ethernet Controller registers.
    //
    pui8MACArray[0] = ((ui32User0 >>  0) & 0xff);
    pui8MACArray[1] = ((ui32User0 >>  8) & 0xff);
    pui8MACArray[2] = ((ui32User0 >> 16) & 0xff);
    pui8MACArray[3] = ((ui32User1 >>  0) & 0xff);
    pui8MACArray[4] = ((ui32User1 >>  8) & 0xff);
    pui8MACArray[5] = ((ui32User1 >> 16) & 0xff);

    //
    // Initialze the lwIP library, using DHCP.
    //
    lwIPInit(g_ui32SysClock, pui8MACArray, 0, 0, 0, IPADDR_USE_DHCP);

    //
    // Setup the device locator service.
    //
    LocatorInit();
    LocatorMACAddrSet(pui8MACArray);
    LocatorAppTitleSet("MSP432E4 enet_io");

    //
    // Initialize a sample httpd server.
    //
    httpd_init();

    //
    // Set the interrupt priorities.  We set the SysTick interrupt to a higher
    // priority than the Ethernet interrupt to ensure that the file system
    // tick is processed if SysTick occurs while the Ethernet handler is being
    // processed.  This is very likely since all the TCP/IP and HTTP work is
    // done in the context of the Ethernet interrupt.
    //
 //   MAP_IntPrioritySet(INT_EMAC0, ETHERNET_INT_PRIORITY);

    //
    // Pass our tag information to the HTTP server.
    //


    //
    // Pass our CGI handlers to the HTTP server.
    //

    //
    // Initialize IO controls
    //
    io_init();

    //
    // Loop forever, processing the on-screen animation.  All other work is
    // done in the interrupt handlers.
    //
    SquadRTOS_SVC_vCreateMutex(&mutex1 , 1);
    SquadRTOS_SVC_vthreadCreate(&thread1, &thread1stack, 1, thread1function);
    SquadRTOS_SVC_vthreadCreate(&thread2, &thread2stack, 1, thread2function);
    SquadRTOS_SVC_vthreadCreate(&thread3, &thread3stack, 1, thread3function);

    SquadRTOS_SVC_vSchedulerStart();

}
