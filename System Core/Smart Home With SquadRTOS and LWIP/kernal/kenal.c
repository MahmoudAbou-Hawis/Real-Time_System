//#include "Tasks.h"
//#include "kernal_RTE.h"
//#include <stddef.h>
//#include <SOSConf.h>
//#include <Frame.h>
//#include <ti/devices/msp432e4/driverlib/driverlib.h>
//
//TCB * pstTasksArr = NULL;
//Static_Queue_Handle pReadyToSendQueue = NULL ;
//
//
//Static_Queue_Handle pRecevedFramesSuccessfully = NULL ;
//
//TasksMassageMapping* pTasksMapping = NULL;
//
//Queue_Data CurrantFrame;
//
//static void CheckMailBox()
//{
//    if(pRecevedFramesSuccessfully == NULL)
//    {
//        pRecevedFramesSuccessfully = ReadRecevedFrames();
//    }
//    if(pTasksMapping == NULL)
//    {
//        pTasksMapping = ReadMassageMapping();
//    }
//    while(pRecevedFramesSuccessfully != NULL &&!bQueueIsEmpty(pRecevedFramesSuccessfully))
//    {
//
//        CurrantFrame = pvQueueStaticDeque(pRecevedFramesSuccessfully);
//
//        if(pTasksMapping[((Frame*)CurrantFrame)->data[0]].TaskQueueHandle != (void*)0)
//         {
//            vQueueStaticPush(pTasksMapping[((Frame*)CurrantFrame)->data[0]].TaskQueueHandle,CurrantFrame);
//         }
//    }
//
//}
//
//
//static void SendFrames()
//{
//    if(pReadyToSendQueue == NULL)
//    {
//        pReadyToSendQueue = ReadReadyFramesToSend();
//    }
//    while(!bQueueIsEmpty(pReadyToSendQueue))
//    {
//        CurrantFrame = pvQueueStaticDeque(pReadyToSendQueue);
//        MAP_UARTCharPutNonBlocking(UART0_BASE,((Frame*)CurrantFrame)->startDelimiter);
//        MAP_UARTCharPutNonBlocking(UART0_BASE,((Frame*)CurrantFrame)->command);
//        MAP_UARTCharPutNonBlocking(UART0_BASE,((Frame*)CurrantFrame)->dataLength );
//        MAP_UARTCharPutNonBlocking(UART0_BASE,((Frame*)CurrantFrame)->separatorDelimiter);
//        int i = 0;
//        for(i = 0 ; i <((Frame*)CurrantFrame)->dataLength ;i++)
//        {
//            MAP_UARTCharPutNonBlocking(UART0_BASE,((Frame*)CurrantFrame)->data[i]);
//        }
//        MAP_UARTCharPutNonBlocking(UART0_BASE,(((Frame*)CurrantFrame))->checkSum);
//        MAP_UARTCharPutNonBlocking(UART0_BASE,((Frame*)CurrantFrame)->endDelimiter);
//    }
//}
//
//static void LookingForTasksInTimeLine(void* Args)
//{
//    //Upgrade With Using Number theory and hash tables
//    if(pstTasksArr == NULL)
//        pstTasksArr = Read();
//    int i;
//    for( i = 0; i < TasksNumber; i++)
//    {
//
//        ++(pstTasksArr[i].u32Counter);
//        if(pstTasksArr[i].bIsBusy &&
//           (pstTasksArr[i].u32Counter == pstTasksArr[i].u32Periodicity) &&
//           (pstTasksArr[i].bIsWorking))
//        {
//            if(pstTasksArr[i].pfnCallBack != NULL)
//            {
//                (pstTasksArr[i].pfnCallBack)(pstTasksArr[i].pvArgs);
//
//            }
//        }
//        pstTasksArr[i].u32Counter %= pstTasksArr[i].u32Periodicity;
//    }
//
//}
//
//
//
