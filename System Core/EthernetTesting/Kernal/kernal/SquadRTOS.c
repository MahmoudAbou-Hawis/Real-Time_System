/******************************************************************************/
/**
 * @file <file-name>.c
 * @brief <file-short-description>
 *
 * @par Project Name
 * <project-name>
 *
 * @par Code Language
 * C
 *
 * @par Description
 * <file-long-description>
 *
 * @par Author
 * Mahmoud Abou-Hawis
 *
 */
/******************************************************************************/

/******************************************************************************/
/* INCLUDES */
/******************************************************************************/
#include "inc/SquadRTOS.h"


/******************************************************************************/

/******************************************************************************/
/* PRIVATE DEFINES */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PRIVATE MACROS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PRIVATE ENUMS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PRIVATE TYPES */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PRIVATE CONSTANT DEFINITIONS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PRIVATE VARIABLE DEFINITIONS */
/******************************************************************************/
uint32_t svcEXEReturn;
static SquadRTOS_tstThread idleThread;
static SquadRTOS_tstStack idleThreadStack;
static uint32_t NumberOfTicksForExternalInt[INTERRUPTS_NUMBERS];
static bool bScedular = false;
/******************************************************************************/

/******************************************************************************/
/* PUBLIC CONSTANT DEFINITIONS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PUBLIC VARIABLE DEFINITIONS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PRIVATE FUNCTION PROTOTYPES */
/******************************************************************************/
void vCheckPendingInt(void)
{
    for(int i = 0 ; i < INTERRUPTS_NUMBERS ; i++)
    {
        if(NVIC_GetPendingIRQ(i))
        {

            NumberOfTicksForExternalInt[i]++;
        }
        else
        {
            NumberOfTicksForExternalInt[i] = 0;
        }
        if(NumberOfTicksForExternalInt[i] > 3)
        {
            NVIC_DisableIRQ(i);
        }
    }
}

/******************************************************************************/

/******************************************************************************/
/* PRIVATE FUNCTION DEFINITIONS */
/******************************************************************************/
static void vIdleThreadFunction(void)
{
  while(1)
  {

  }
}
/******************************************************************************/

/******************************************************************************/
/* PUBLIC FUNCTION DEFINITIONS */
/******************************************************************************/
void SquadRTOS_vinit(void)
{
    __disable_irq();
    SCB->CCR = SCB_CCR_STKALIGN_Msk;
    uint32_t g_ui32SysClock = MAP_SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ |
                                                 SYSCTL_OSC_MAIN |
                                                 SYSCTL_USE_PLL |
                                                 SYSCTL_CFG_VCO_480), 120000000);
    MAP_SysTickPeriodSet(g_ui32SysClock/100);
    MAP_SysTickIntEnable();
    MAP_SysTickEnable();
    NVIC_SetPriorityGrouping(3);
    NVIC_SetPriority(SVCall_IRQn, 0);
    NVIC_SetPriority(SysTick_IRQn, 1);
    for(int i = 0 ; i < INTERRUPTS_NUMBERS ; i++)
    {
        NVIC_SetPriority(i,i+2);
        NumberOfTicksForExternalInt[i] = 0;
    }
    NVIC_SetPriority(PendSV_IRQn, 0xFF);
    NVIC_EnableIRQ(PendSV_IRQn);
    NVIC_EnableIRQ(SVCall_IRQn);
  //  __set_BASEPRI(2);
    MAP_IntPrioritySet(56, 0xC0);

    SquadRTOS_vthreadInitLists();
    __enable_irq();
}

void SquadRTOS_vschedulerStart(void)
{
    bScedular = true;
    SquadRTOS_vThreadCreate(
        &idleThread,
        &idleThreadStack,
        (THREADS_PRIORITY_LEVELS - 1),
        vIdleThreadFunction
        );

    SquadRTOS_tstThread * pRunningThread;

    SquadRTOS_vthreadSwitchRunning();

    pRunningThread = SquadRTOS_ThreadGetRunning();

    svcEXEReturn = MEM32_ADDRESS(pRunningThread->u32StackPointer);

    __set_PSP((uint32_t)(pRunningThread->u32StackPointer +( 10 << 2 )));

    __set_CONTROL(MEM32_ADDRESS((pRunningThread->u32StackPointer + (1 << 2))));

    __ISB();


    __set_BASEPRI(0);
}

void SquadRTOS_SVC_vHandler_main(uint32_t * svc_args)
{
    ASSERT(NULL != svc_args);

    uint8_t svc_number = ((char *) svc_args[6])[-2];

    if(svc_number == (uint8_t)0)
    {
        SquadRTOS_vschedulerStart();
    }
    else if(svc_number == (uint8_t)1)
    {
        SquadRTOS_vThreadCreate(
            (SquadRTOS_tstThread *) svc_args[0],
            (SquadRTOS_tstStack *) svc_args[1],
            (uint32_t) svc_args[2],
            (void *) svc_args[3]);
    }
    else if(svc_number == (uint8_t)2)
    {
        vTaskDelay((uint32_t)svc_args[0]);
    }
    else if(svc_number == (uint8_t)3)
    {
        SquadRTOS_vTaskTimeOut((uint32_t)svc_args[0]);
    }
    else if(svc_number == (uint8_t)4)
    {
        SquadRTOS_vRecieve();
    }
    else if(svc_number == (uint8_t)5)
    {
        SquadRTOS_vChangePriority((uint8_t)svc_args[0]);
    }
    else if(svc_number == (uint8_t)6)
    {
        SquadRTOS_vthreadDestroy((SquadRTOS_tstThread *)svc_args[0]);
    }
    else if(svc_number == (uint8_t)7)
    {
        SquadRTOS_vTaskResume((SquadRTOS_tstThread *)svc_args[0]);
    }
    else if(svc_number == (uint8_t)8)
    {
        SquadRTOS_vMakeTimer((void**)svc_args[0],(void*)svc_args[1],(void*)svc_args[2]);
    }
    else if(svc_number == (uint8_t)9)
    {
        SquadRTOS_vDeleteTimer((void**)svc_args[0]);
    }
    else if(svc_number == (uint8_t)10)
    {
        SquadRTOS_vStart((void*)svc_args[0]);
    }
    else if(svc_number == (uint8_t)11)
    {
        SquadRTOS_vEnd((void*)svc_args[0]);
    }
    else if(svc_number == (uint8_t)12)
    {
        SquadRTOS_ChangePeriod((void*)svc_args[0],(uint32_t)svc_args[1]);
    }
    else if(svc_number == (uint8_t)13)
    {
        SquadRTOS_vCreateMutex((SquadRTOS_tstMutex*)svc_args[0] ,(uint32_t)svc_args[1]);
    }
    else if(svc_number == (uint8_t)14)
    {
       uint32_t returnValue = SquadRTOS_vTakeMutex((SquadRTOS_tstMutex*)svc_args[0] , (uint32_t)svc_args[1]);
       if(returnValue == 2)
       {
           svc_args[6] = svc_args[6] - 4;
       }
       else
       {
           svc_args[0] = returnValue;
       }

    }
    else if(svc_number == (uint8_t)15)
    {
        SquadRTOS_vReleaseMutex((SquadRTOS_tstMutex*)svc_args[0]);
    }
    else if(svc_number == (uint8_t)16)
    {
        SquadRTOS_vMailboxCreate((SquadRTOS_tstMailbox *) svc_args[0], (void*)svc_args[1],
                                 (uint32_t)svc_args[2], (uint32_t)svc_args[3]);
    }
    else if(svc_number == (uint8_t)17)
    {
        uint32_t returnStatus = SquadRTOS_u32MailboxRead((SquadRTOS_tstMailbox *) svc_args[0],
                                 (int32_t) svc_args[1], (void * const) svc_args[2]);
        if(returnStatus == 2)
        {
            svc_args[6] = svc_args[6] - 2;
        }
        else
        {
            svc_args[0] = returnStatus;
        }
    }
    else if(svc_number == (uint8_t)18)
    {
      uint32_t returnStatus = SquadRTOS_u32MailboxWrite((SquadRTOS_tstMailbox *) svc_args[0],
              (int32_t) svc_args[1], (const void * const) svc_args[2]);
      if(returnStatus == 2)
       {
           svc_args[6] = svc_args[6] - 2;
       }
       else
       {
           svc_args[0] = returnStatus;
       }
    }
    else
    {

    }

}



void SquadRTOS_SysTick_Handler(void)
{
    lwIPTimer(10);
    if(bScedular)
    {
    SquadRTOS_vCheckWaitingList();
    SquadRTOS_vCheckTimeOut();
    SquadRTOS_CheckPerTasks();
    //vCheckPendingInt();
    SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
    }
}

/******************************************************************************/
