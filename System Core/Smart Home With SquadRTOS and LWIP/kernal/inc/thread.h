/******************************************************************************/
/**
 * @file  List.h
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
/* MULTIPLE INCLUSION GUARD */
/******************************************************************************/
#ifndef THREAD_H
#define THREAD_H
/******************************************************************************/

/******************************************************************************/
/* C++ Style GUARD */
/******************************************************************************/
#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */
/******************************************************************************/

/******************************************************************************/
/* INCLUDES */
/******************************************************************************/
#include <stdint.h>
#include "List.h"
#include "SOSConf.h"
/******************************************************************************/

/******************************************************************************/
/* PUBLIC DEFINES */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PUBLIC MACROS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PUBLIC ENUMS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PUBLIC TYPES */
/******************************************************************************/
typedef struct
{
    uint32_t u32StackPointer; /**< Pointer to the Stack of thread which Contain TCB too */
    uint32_t u32Priority;     /**< the priority of the thread. the lowest priority value is the highest priority  */
    uint32_t u32ThreadId;     /**< this is contain Thread id*/
    SquadRTOS_Node genericListItem; /**< Generic list item of this thread */
    SquadRTOS_Node eventListItem;
} SquadRTOS_tstThread;

typedef struct
{
   uint64_t u64Stack[THREAD_STACK_SIZE];
} SquadRTOS_tstStack;
/******************************************************************************/

/******************************************************************************/
/* PUBLIC CONSTANT DECLARATIONS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PUBLIC VARIABLE DECLARATIONS */
/******************************************************************************/

/******************************************************************************/

/******************************************************************************/
/* PUBLIC FUNCTION PROTOTYPES */
/******************************************************************************/
void SquadRTOS_vThreadCreate(SquadRTOS_tstThread * pstThread, SquadRTOS_tstStack * pstStack,
    uint32_t u32Priority, void * pFunction);
void SquadRTOS_SVC_vthreadCreate(SquadRTOS_tstThread * pstThread, SquadRTOS_tstStack * pstStack,
    uint32_t u32Priority, void * pFunction);
void SquadRTOS_vthreadInitLists(void);

void SquadRTOS_vthreadSwitchRunning(void);
void SquadRTOS_vThreadAddToReadyList(SquadRTOS_tstThread * pThread);
SquadRTOS_tstThread * SquadRTOS_ThreadGetRunning();
void SquadRTOS_SVC_vDelay(uint32_t u32SysTick);
void vTaskDelay(uint32_t u32NumberOfTicks);
void SquadRTOS_vCheckWaitingList();

void SquadRTOS_SVC_vthreadDestroy(SquadRTOS_tstThread * pstThread);
void SquadRTOS_vthreadDestroy(SquadRTOS_tstThread * pstThread);

void SquadRTOS_SVC_vTaskResume(SquadRTOS_tstThread *  pstThread);
void SquadRTOS_vTaskResume(SquadRTOS_tstThread *  pstThread);

void SquadRTOS_SVC_vTaskTimeOut(uint32_t u32TimeOut);
void SquadRTOS_vTaskTimeOut(uint32_t u32TimeOut);

void SquadRTOS_SVC_vRecieve(void);
void SquadRTOS_vRecieve(void);

void SquadRTOS_SVC_vChangePriority(uint32_t u32NewPeriority);
void SquadRTOS_vChangePriority(uint32_t u32NewPeriority);

void SquadRTOS_vCheckTimeOut(void);

/******************************************************************************/

/******************************************************************************/
/* C++ Style GUARD */
/******************************************************************************/
#ifdef __cplusplus
}
#endif /* __cplusplus */
/******************************************************************************/

/******************************************************************************/
/* MULTIPLE INCLUSION GUARD */
/******************************************************************************/
#endif /* FILE_NAME_H */
/******************************************************************************/
