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
#include "inc/List.h"
#include "inc/thread.h"
#include <stddef.h>

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

void SquadRTOS_vListInit(SquadRTOS_tstList * pstList)
{
    ASSERT(NULL != pstList);        /**< Check if pstList argument is Not equal NULL*/
    pstList->u32ElmentsNum             = 0;  /**< Initially number of elements in the list equal to zero*/
    /* List is empty so that Current Node equal to dummy Node*/
    pstList->pstCurrentItem            = ((SquadRTOS_Node*) &pstList->stDummy);
    /* List is empty, so the end pointing to itself */
    pstList->stDummy.pstNext           = ((SquadRTOS_Node*) &pstList->stDummy);
    pstList->stDummy.pstPrev           = ((SquadRTOS_Node*) &pstList->stDummy);
    pstList->stDummy.u32ActivisionTime = ((uint32_t) 0xFFFFFFFFu);
}

void SquadRTOS_vListInsertEnd(SquadRTOS_tstList * pstList, SquadRTOS_Node * pstNewNode)
{
    /*Check if pstList and pstNewNode is not equal NULL if it equal to NULL it will make system stopped  */
    ASSERT(NULL != pstList) ;
    ASSERT((NULL != pstNewNode) );
    pstNewNode->pstNext                         =  pstList->pstCurrentItem->pstNext;
    pstNewNode->pstPrev                         =  pstList->pstCurrentItem;
    pstList->pstCurrentItem->pstNext->pstPrev   = pstNewNode;
    pstList->pstCurrentItem->pstNext            = pstNewNode;
    pstList->pstCurrentItem                     = pstNewNode;
    pstList->pstCurrentItem->pvList             = (void*)pstList;
    pstList->u32ElmentsNum++;

}

void SquadRTOS_vListRemove(SquadRTOS_Node * pstRemovedNode)
{
    ASSERT(NULL != pstRemovedNode);
    pstRemovedNode->pstPrev->pstNext              = pstRemovedNode->pstNext;
    pstRemovedNode->pstNext->pstPrev              = pstRemovedNode->pstPrev;
    SquadRTOS_tstList * pList;

    pList = (SquadRTOS_tstList *) pstRemovedNode->pvList;
    if(pstRemovedNode == pList->pstCurrentItem)
    {
      pList->pstCurrentItem = pstRemovedNode->pstPrev;
    }

    pstRemovedNode->pvList = NULL;

    pList->u32ElmentsNum--;
}

void SquadRTOS_vListInsert(SquadRTOS_tstList * pstList,SquadRTOS_Node * pstNewNode)
{
    ASSERT((pstList != NULL) && (pstNewNode !=NULL));
    SquadRTOS_Node * pstCurrentNode = (SquadRTOS_Node *)&pstList->stDummy ;
    while((pstCurrentNode->pstNext != (SquadRTOS_Node *)&pstList->stDummy)
           && pstCurrentNode->pstNext->u32ActivisionTime <= pstNewNode->u32ActivisionTime )

    {
        pstCurrentNode = pstCurrentNode->pstNext;
    }
    pstNewNode->pstNext              = pstCurrentNode->pstNext;
    pstNewNode->pstPrev              = pstCurrentNode;
    pstCurrentNode->pstNext->pstPrev = pstNewNode;
    pstCurrentNode->pstNext          = pstNewNode;
    pstNewNode->pvList               = (void*)pstList;
    pstList->u32ElmentsNum++;
}
/******************************************************************************/
