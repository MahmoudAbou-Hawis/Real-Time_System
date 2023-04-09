#include "inc/queue.h"
#include <inttypes.h>


#if(DynamicAllocation)
typedef struct queue
{
    int front;
    int rear;
    void ** arr;
    int size ;
    int NumberOfBytes;
    void * returnedData;
}xQueue;


Queue_Handle pvCreateQueue(int Capacity, int BytesNumber)
{
    Queue_Handle NewQueue = (xQueue *) malloc(1*sizeof (xQueue)) ;
    NewQueue->arr = (void*) malloc(Capacity  * sizeof(void*));
    NewQueue->size = Capacity;
    NewQueue->front = 0;
    NewQueue->rear = 0;
    NewQueue->NumberOfBytes = BytesNumber;
    NewQueue->returnedData = malloc(BytesNumber);
    return NewQueue;
}


void vQueuePush(Queue_Handle handle,void * data)
{
    if(handle ==NULL) return ;
    if(bQueueIsEmpty(handle))
    {
        vQueueReset(handle);
    }
    if(handle->rear == handle->size) {
        handle->arr = realloc(handle->arr , handle->NumberOfBytes * (reSizeQueueBy + handle->size));
        handle->size+=reSizeQueueBy;
    }
    void * dataTemp =(void*) malloc(handle->NumberOfBytes);
    memcpy(dataTemp,data,handle->NumberOfBytes);
    handle->arr[handle->rear++] = dataTemp;
}

Queue_Data pvQueueDeque(Queue_Handle handle)
{
    if(handle ==NULL) return NULL;
    if(bQueueIsEmpty(handle))
    {
        vQueueReset(handle);
        return NULL;
    }
        memcpy(handle->returnedData, (handle->arr[handle->front++]),
               handle->NumberOfBytes);
        free((handle->arr[handle->front-1]));
    return handle->returnedData;
}

void vQueueDelete(Queue_Handle *pvQueue)
{
    free(*pvQueue);
    *pvQueue = NULL;
}
bool bQueueIsEmpty(Queue_Handle queue)
{
    return (queue->front == queue->rear);
}
bool bQueueIsFull(Queue_Handle queue)
{
    return (queue->size == queue->rear);
}
void vQueueReset(Queue_Handle queue)
{
    queue->front = queue->rear =0;
}
#endif


#if(DynamicAllocation == 0)
typedef struct staticQueue
{
    int front ;
    int rear ;
    void **arr[QueueSize];
    int NumberOfBytes;
    void * returnedData;
} StaticQueue;

Static_Queue_Handle pvCreateStaticQueue(int BytesNumber)
{
    StaticQueue *NewQueue = (StaticQueue*) malloc(1 * sizeof(StaticQueue));
    NewQueue->front = 0;
    NewQueue->rear = 0;
    NewQueue->NumberOfBytes = BytesNumber;
    NewQueue->returnedData = malloc(BytesNumber);
    return NewQueue;
}

void vQueueStaticPush(Static_Queue_Handle handle,void * data)
{
    if(handle == NULL)return;
    if(bQueueIsEmpty(handle))
    {
        vQueueReset(handle);
    }
    if( handle->rear == QueueSize) {

        return;
    }
    void * dataTemp =(void*) malloc(handle->NumberOfBytes);
    memcpy(dataTemp,data,handle->NumberOfBytes);
    handle->arr[handle->rear++] = dataTemp;
}
Queue_Data pvQueueStaticDeque(Static_Queue_Handle handle)
{
    if(handle ==NULL) return NULL;
    if(bQueueIsEmpty(handle))
    {
        vQueueReset(handle);
        return NULL;
    }
    memcpy(handle->returnedData,(handle->arr[handle->front++]),
           handle->NumberOfBytes);
    free((handle->arr[handle->front-1]));
    return handle->returnedData;
}
void vQueueDelete(Static_Queue_Handle* pvQueue)
{
    free(*pvQueue);
    *pvQueue = NULL;
}
bool bQueueIsEmpty(Static_Queue_Handle queue)
{
    if(queue == NULL)return true;
    return (queue->rear == queue->front);
}
bool bQueueIsFull(Static_Queue_Handle queue)
{
    return (QueueSize == queue->rear);
}
void vQueueReset(Static_Queue_Handle queue)
{
    queue->front = queue->rear = 0;
}
#endif


