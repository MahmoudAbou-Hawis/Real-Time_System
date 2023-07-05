#include <stdint.h>
#include <stddef.h>

typedef struct
{
  int8_t * pStart;                /**< Start location */
  int8_t * pEnd;                  /**< Last location */
  int8_t * pReadIndex;            /**< Read location */
  int8_t * pWriteIndex;           /**< Write location */
  uint32_t bufferLength;          /**< Length of the mailbox buffer */
  uint32_t messageSize;           /**< Mailbox message size in bytes */
  uint32_t messagesNum;           /**< Current number of messages inside the buffer */
  SquadRTOS_tstList waitingList;  /**< Waiting list */
} SquadRTOS_tstMailbox;


void SquadRTOS_vMailboxCreate(SquadRTOS_tstMailbox * pstMailbox, void * pvBuffer,
    uint32_t u32BufferLength, uint32_t u32MessageSize);
void SquadRTOS_SVC_vMailboxCreate(SquadRTOS_tstMailbox * pstMailbox, void * pvBuffer,
                            uint32_t u32BufferLength, uint32_t u32MessageSize);

uint32_t SquadRTOS_u32MailboxWrite(SquadRTOS_tstMailbox * pstMailbox, int32_t u32WaitTime,
                                    const void * const pMessage);
uint32_t SquadRTOS_SVC_u32MailboxWrite(SquadRTOS_tstMailbox * pstMailbox, int32_t u32WaitTime,
                                    const void * const pMessage);

uint32_t SquadRTOS_u32MailboxRead(SquadRTOS_tstMailbox * pMailbox, int32_t u32WaitTime,
                                   void * const pMessage);
uint32_t SquadRTOS_SVC_u32MailboxRead(SquadRTOS_tstMailbox * pMailbox, int32_t u32WaitTime,
                                   void * const pMessage);
