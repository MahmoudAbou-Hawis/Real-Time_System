
#ifndef QUEUE_H
#define QUEUE_H
#include <stdlib.h>
#include "string.h"
#include <stdio.h>
#include "SOSConf.h"
#include <stdbool.h>
typedef void * Queue_Data;
#if(DynamicAllocation)
typedef struct queue * Queue_Handle;
struct queue;
Queue_Handle pvCreateQueue(int size ,int BytesNumber);
void vQueuePush(Queue_Handle handle,void * data);
Queue_Data pvQueueDeque(Queue_Handle handle);
void vQueueDelete(Queue_Handle *pvQueue);
bool bQueueIsEmpty(Queue_Handle queue);
bool bQueueIsFull(Queue_Handle queue);
void vQueueReset(Queue_Handle queue);
#else
typedef struct staticQueue* Static_Queue_Handle;
Static_Queue_Handle pvCreateStaticQueue(int BytesNumber);
void vQueueStaticPush(Static_Queue_Handle handle,void * data);
Queue_Data pvQueueStaticDeque(Static_Queue_Handle handle);
void vQueueDelete(Static_Queue_Handle *pvQueue);
bool bQueueIsEmpty(Static_Queue_Handle queue);
bool bQueueIsFull(Static_Queue_Handle queue);
void vQueueReset(Static_Queue_Handle queue);
#endif

#endif

