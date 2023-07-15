#include "inc/SquadRTOS.h"


static void checkWaitingThreads(SquadRTOS_tstMailbox * pMailbox)
{

  ASSERT(NULL != pMailbox);
  SquadRTOS_tstThread * pThread;

  if(0 < pMailbox->waitingList.u32ElmentsNum)
  {
    pThread = pMailbox->waitingList.stDummy.pstNext->pvThraed;

    ASSERT(NULL != pThread);

    SquadRTOS_vListRemove(&pThread->eventListItem);

    if(NULL != pThread->genericListItem.pvList)
    {

      SquadRTOS_vListRemove(&pThread->genericListItem);
    }

    SquadRTOS_vThreadAddToReadyList(pThread);
  }

}

void SquadRTOS_vMailboxCreate(SquadRTOS_tstMailbox * pstMailbox, void * pvBuffer,
    uint32_t u32BufferLength, uint32_t u32MessageSize)
{
    ASSERT(pstMailbox != NULL);
    ASSERT(pvBuffer != NULL);
    ASSERT(u32MessageSize == 1 || u32MessageSize == 2 || u32MessageSize == 3);
    ASSERT(0 != u32BufferLength);

    pstMailbox->pStart = (int8_t*) pvBuffer;
    pstMailbox->pEnd   = (pstMailbox->pStart + u32MessageSize *u32BufferLength );

    pstMailbox->messagesNum  = 0;
    pstMailbox->bufferLength = u32BufferLength;
    pstMailbox->messageSize  = u32MessageSize;
    pstMailbox->pReadIndex   = pstMailbox->pStart;
    pstMailbox->pWriteIndex   = pstMailbox->pStart;

    SquadRTOS_vListInit(&pstMailbox->waitingList);

}

uint32_t SquadRTOS_u32MailboxWrite(SquadRTOS_tstMailbox * pstMailbox, int32_t u32WaitTime,
                                    const void * const pMessage)
{
    ASSERT(pstMailbox != NULL);
    ASSERT((u32WaitTime == 1) || (u32WaitTime == 0));
    ASSERT(pMessage != NULL);
    uint32_t u32ReturnStatus = 0;
    if(pstMailbox->messagesNum < pstMailbox->bufferLength)
    {
        memcpy((void*)pstMailbox->pWriteIndex ,pMessage,pstMailbox->messageSize);
        pstMailbox->pWriteIndex += pstMailbox->messageSize;
        if(pstMailbox->pWriteIndex >= pstMailbox->pEnd)
        {
          pstMailbox->pWriteIndex = pstMailbox->pStart;
        }
        pstMailbox->messagesNum++;
        checkWaitingThreads(pstMailbox);

        u32ReturnStatus = 1;
    }
    if((1 == u32WaitTime) && ( 0 == u32ReturnStatus))
    {
        SquadRTOS_tstThread * pstRunningThread  = SquadRTOS_ThreadGetRunning();
        SquadRTOS_vListRemove(&pstRunningThread->genericListItem);
        SquadRTOS_vListInsert(&pstMailbox->waitingList,&pstRunningThread->genericListItem );
        SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
        u32ReturnStatus = 2;
    }
    return u32ReturnStatus;
}


uint32_t SquadRTOS_u32MailboxRead(SquadRTOS_tstMailbox * pstMailbox, int32_t u32WaitTime,
                                   void * const pMessage)
{
       ASSERT(pstMailbox != NULL);
       ASSERT((u32WaitTime == 1) || (u32WaitTime == 0));
       ASSERT(pMessage != NULL);
       uint32_t u32ReturnStatus = 0;
       if(pstMailbox->messagesNum > 0)
       {
           memcpy(pMessage,pstMailbox->pReadIndex,pstMailbox->messageSize);
           pstMailbox->pReadIndex += pstMailbox->messageSize;
           if(pstMailbox->pReadIndex >= pstMailbox->pEnd)
           {
               pstMailbox->pReadIndex = pstMailbox->pStart;
           }
           pstMailbox->messagesNum--;
           checkWaitingThreads(pstMailbox);
           u32ReturnStatus = 1;
       }
       if((1 == u32WaitTime) && ( 0 == u32ReturnStatus))
       {
           SquadRTOS_tstThread * pstRunningThread  = SquadRTOS_ThreadGetRunning();
           SquadRTOS_vListRemove(&pstRunningThread->genericListItem);
           SquadRTOS_vListInsert(&pstMailbox->waitingList,&pstRunningThread->genericListItem );
           SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
           u32ReturnStatus = 2;
       }

       return u32ReturnStatus;
}

