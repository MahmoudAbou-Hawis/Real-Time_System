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
#ifndef LIST_H
#define LIST_H
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
#include <ti/devices/msp432e4/driverlib/driverlib.h>
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

struct Node
{
   uint32_t u32ActivisionTime; /**< This Value used if thread is delayed*/
   uint32_t u32TimeOut;        /**< This is used to determine time for the task */
   uint32_t u32Counter;
   struct Node * pstNext;     /**< Pointer to next Node in the List */
   struct Node * pstPrev;     /**< Pointer to previous Node in the List */
   void * pvThraed;           /**< Pointer to thread which is this node belong to */
   void * pvList;             /**< Pointer to list which this thread in.for example waiting list or Ready list  */
};
typedef struct Node SquadRTOS_Node;

struct Dummy
{
    uint32_t u32ActivisionTime;
    uint32_t u32TimeOut;
    uint32_t u32Counter;
    SquadRTOS_Node * pstNext;     /**< Pointer to the next list item */
    SquadRTOS_Node * pstPrev;     /**< Pointer to the previous list item */
};
typedef struct Dummy SquadRTOS_DummyNode;

struct List
{
    uint32_t u32ElmentsNum;           /**< Refer to number of elements in this list*/
    SquadRTOS_Node * pstCurrentItem;  /**< Pointer to Current Node in the list */
    SquadRTOS_DummyNode stDummy;      /**< End of list */
};
typedef struct List SquadRTOS_tstList;
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
void SquadRTOS_vListInit(SquadRTOS_tstList * pstList);
void SquadRTOS_vListInsertEnd(SquadRTOS_tstList * pstList, SquadRTOS_Node * pstNewNode);
void SquadRTOS_vListRemove(SquadRTOS_Node * pstRemovedNode);
void SquadRTOS_vListInsert(SquadRTOS_tstList * pstList,SquadRTOS_Node * pstNewNode);
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
#endif /* List_H */
/******************************************************************************/
