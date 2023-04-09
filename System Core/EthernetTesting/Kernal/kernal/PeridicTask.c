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
stPeridicTaskInf astTasksArr[TasksNumber] = {0};
uint32_t SysTicksNumber = 0;
Static_Queue_Handle AvailableIds = NULL;
Queue_Data CurrentId;
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
void SquadRTOS_vMakeTimer(void** pvTask ,void (*taskCallback)(void*),void* pvArgs)
{
    if(AvailableIds == NULL)
        {
            AvailableIds = pvCreateStaticQueue(sizeof(uint8_t));
            uint8_t i = 0;
            for(i = 0 ; i < TasksNumber ; i++)
                vQueueStaticPush(AvailableIds, ((void*)&i));
        }

        if(!bQueueIsEmpty(AvailableIds))
        {
                 CurrentId = pvQueueStaticDeque(AvailableIds);
                 astTasksArr[*((uint8_t*)CurrentId)].u32TaskSpecifier = *((uint8_t*)CurrentId);
                 astTasksArr[*((uint8_t*)CurrentId)].bIsBusy          =  true;
                 astTasksArr[*((uint8_t*)CurrentId)].pfnCallBack      =  taskCallback;
                 astTasksArr[*((uint8_t*)CurrentId)].pvArgs           =  pvArgs;
                 astTasksArr[*((uint8_t*)CurrentId)].bIsWorking       =  false;
                 astTasksArr[*((uint8_t*)CurrentId)].u32Periodicity   =  1;
                 astTasksArr[*((uint8_t*)CurrentId)].u32Counter       =  0;
                 (*pvTask)  = (void*)&astTasksArr[*((uint8_t*)CurrentId)];
        }


}

void SquadRTOS_vDeleteTimer(void** ppvHnd)
{
    if(ppvHnd!=NULL)
    {
        ((stPeridicTaskInf*)(*ppvHnd))->bIsBusy   = false ;
        ((stPeridicTaskInf*)(*ppvHnd))->bIsWorking= false ;
        vQueueStaticPush(AvailableIds, (void*)&(((stPeridicTaskInf*)(*ppvHnd))->u32TaskSpecifier));
        (*ppvHnd) = NULL;

    }

}

void SquadRTOS_vStart(void* pvHnd)
{
    if (pvHnd !=NULL)
    {
        ((stPeridicTaskInf*)(pvHnd))->bIsWorking = true;

    }
}

void SquadRTOS_vEnd(void* pvHnd)
{
    if(pvHnd != NULL)
    {
        ((stPeridicTaskInf*)(pvHnd))->bIsWorking = false;
    }
}

void SquadRTOS_ChangePeriod(void* pvHnd,uint32_t u32Second)
{
    if(pvHnd !=NULL)
    {
        ((stPeridicTaskInf*)(pvHnd))->u32Periodicity = u32Second;
    }
}

void SquadRTOS_CheckPerTasks(void)
{
    for(int i = 0; i < TasksNumber; i++)
        {

            ++(astTasksArr[i].u32Counter);
            if(astTasksArr[i].bIsBusy &&
               (astTasksArr[i].u32Counter == astTasksArr[i].u32Periodicity) &&
               (astTasksArr[i].bIsWorking))
            {
                if(astTasksArr[i].pfnCallBack != NULL)
                {

                    (astTasksArr[i].pfnCallBack)(astTasksArr[i].pvArgs);
                }
            }
            astTasksArr[i].u32Counter %= astTasksArr[i].u32Periodicity;
        }
}
/******************************************************************************/
