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
 * <author-name>
 *
 */
/******************************************************************************/

/******************************************************************************/
/* INCLUDES */
/******************************************************************************/
#include "inc/SquadRTOS.h"
#include <stddef.h>
#include "inc/thread.h"
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
static SquadRTOS_tstList astReadyList[THREADS_PRIORITY_LEVELS] = {0};

static SquadRTOS_tstList astWaitingList;

static SquadRTOS_tstList astSuspended;

static uint32_t u32theBestPriority =  THREADS_PRIORITY_LEVELS -1;

static SquadRTOS_tstThread * pstRunningThread;

static uint32_t u32numOfThreads = 0;

static uint32_t runningThreadID = 0;

static uint32_t u32NumberOfSysTicks = 0;


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

/******************************************************************************/

/******************************************************************************/
/* PRIVATE FUNCTION DEFINITIONS */
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/* PUBLIC FUNCTION DEFINITIONS */
/******************************************************************************/
void SquadRTOS_vThreadAddToReadyList(SquadRTOS_tstThread * pstThread)
{

    SquadRTOS_vListInsertEnd(&astReadyList[pstThread->u32Priority], &pstThread->genericListItem);

    if(pstThread->u32Priority < u32theBestPriority)
    {
        u32theBestPriority = pstThread->u32Priority;
    }

    if((NULL != pstRunningThread)
        && (pstThread->u32Priority < pstRunningThread->u32Priority))
    {

      SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
    }
    else
    {

    }
}

void SquadRTOS_vThreadCreate(SquadRTOS_tstThread * pstThread, SquadRTOS_tstStack * pstStack,
    uint32_t u32Priority, void * pFunction)
{
    ASSERT(pstThread != NULL &  pstStack != NULL & pFunction != NULL)
    pstThread->u32Priority     = u32Priority;
    pstThread->u32StackPointer = ((uint32_t)pstStack + THREADS_PRIORITY_LEVELS * 8 - 18 * 4 );
    MEM32_ADDRESS(pstThread->u32StackPointer) = 0xFFFFFFFDUL;
    MEM32_ADDRESS(pstThread->u32StackPointer + (1 << 2))  = 0x3;
    MEM32_ADDRESS(pstThread->u32StackPointer + (17 << 2)) = 0x01000000;
    MEM32_ADDRESS((pstThread->u32StackPointer + (16 << 2))) = (uint32_t) pFunction;

    pstThread->genericListItem.pvList = NULL;
    pstThread->eventListItem.pvList = NULL;

    pstThread->genericListItem.pvThraed = (void*)pstThread;
    pstThread->eventListItem.pvThraed = (void*)pstThread;

    pstThread->genericListItem.u32ActivisionTime = 0;
    pstThread->eventListItem.u32ActivisionTime = u32Priority;


    pstThread->genericListItem.u32TimeOut = 0;
    pstThread->genericListItem.u32Counter = 0;

    pstThread->u32ThreadId = ++u32numOfThreads;
    SquadRTOS_vThreadAddToReadyList(pstThread);

}

SquadRTOS_tstThread * SquadRTOS_ThreadGetRunning()
{
    return pstRunningThread;
}

void SquadRTOS_vthreadSwitchRunning(void)
{

    while(0 == astReadyList[u32theBestPriority].u32ElmentsNum)
    {

      ASSERT(THREADS_PRIORITY_LEVELS > u32theBestPriority);

      u32theBestPriority++;
    }


    SquadRTOS_tstList * pReadyList = &astReadyList[u32theBestPriority];
    pReadyList->pstCurrentItem = pReadyList->pstCurrentItem->pstNext;


    if(pReadyList->pstCurrentItem == (SquadRTOS_Node *) &pReadyList->stDummy)
    {
      pReadyList->pstCurrentItem = pReadyList->pstCurrentItem->pstNext;
    }
    else
    {

    }

    pstRunningThread = (SquadRTOS_tstThread *) pReadyList->pstCurrentItem->pvThraed;

    runningThreadID = pstRunningThread->u32ThreadId;
}

void SquadRTOS_vthreadInitLists(void)
{
    for(int i = 0 ; i < THREADS_PRIORITY_LEVELS ; i++)
    {
        SquadRTOS_vListInit(&astReadyList[i]);
    }
    SquadRTOS_vListInit(&astWaitingList);
    SquadRTOS_vListInit(&astSuspended);
}

void vTaskDelay(uint32_t u32NumberOfTicks)
{
    ASSERT(0 != u32NumberOfTicks);

      uint32_t wakeUpTick = 0;

      wakeUpTick = u32NumberOfSysTicks + u32NumberOfTicks;


      if(u32NumberOfSysTicks > wakeUpTick)
      {

          ASSERT(0);
      }


      pstRunningThread->genericListItem.u32ActivisionTime = wakeUpTick;

      SquadRTOS_vListRemove(&pstRunningThread->genericListItem);

      SquadRTOS_vListInsert(&astWaitingList, &pstRunningThread->genericListItem);

      SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}

void SquadRTOS_vCheckWaitingList()
{
    u32NumberOfSysTicks++;
    SquadRTOS_tstThread * pThread;


      if(0 < astWaitingList.u32ElmentsNum)
      {
        while(u32NumberOfSysTicks >= astWaitingList.stDummy.pstNext->u32ActivisionTime)
        {

          pThread = astWaitingList.stDummy.pstNext->pvThraed;

          ASSERT(NULL != pThread);

          SquadRTOS_vListRemove(&pThread->genericListItem);

          if(NULL != pThread->eventListItem.pvList)
          {
            SquadRTOS_vListRemove(&pThread->eventListItem);
          }

          SquadRTOS_vThreadAddToReadyList(pThread);
        }
      }

}

void SquadRTOS_vTaskTimeOut(uint32_t u32TimeOut)
{
    pstRunningThread->genericListItem.u32TimeOut = u32TimeOut;
    pstRunningThread->genericListItem.u32Counter = 0;
}

void SquadRTOS_vCheckTimeOut()
{

    if(pstRunningThread->genericListItem.u32TimeOut != 0)
    {
        pstRunningThread->genericListItem.u32Counter++;
        if(pstRunningThread->genericListItem.u32TimeOut <= pstRunningThread->genericListItem.u32Counter)
        {
            SquadRTOS_vListRemove(&pstRunningThread->genericListItem);
            pstRunningThread->genericListItem.u32Counter = 0;
        }
    }

}

void SquadRTOS_vthreadDestroy(SquadRTOS_tstThread * pstThread)
{
    if(pstThread == NULL)
    {
        ASSERT(0);
    }
    SquadRTOS_vListRemove(&pstThread->genericListItem);
    SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;

}

void SquadRTOS_vTaskResume(SquadRTOS_tstThread *  pstThread)
{
    if(pstThread->genericListItem.pvList != NULL)
    {
        SquadRTOS_vListRemove(&pstThread->genericListItem);
    }
    SquadRTOS_vThreadAddToReadyList(pstThread);
    SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}

void SquadRTOS_vChangePriority(uint32_t u32NewPriority)
{
    ASSERT((u32NewPriority < THREADS_PRIORITY_LEVELS) & u32NewPriority > 0);
    pstRunningThread->u32Priority = u32NewPriority;
    SquadRTOS_vListRemove(&pstRunningThread->genericListItem);
    SquadRTOS_vThreadAddToReadyList(pstRunningThread);
    SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}

void SquadRTOS_vRecieve(void)
{
    SquadRTOS_vListRemove(&pstRunningThread->genericListItem);
    SquadRTOS_vListInsert(&astSuspended,&pstRunningThread->genericListItem);
    SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}
/******************************************************************************/
