.syntax unified
.cpu cortex-m4
.thumb

.global SquadRTOS_SVC_vthreadCreate
.global SquadRTOS_SVC_vSchedulerStart
.global SquadRTOS_SVC_vDelay
.global SquadRTOS_SVC_vTaskTimeOut
.global SquadRTOS_SVC_vRecieve
.global SquadRTOS_SVC_vChangePriority
.global SquadRTOS_SVC_vthreadDestroy
.global SquadRTOS_SVC_vTaskResume
.global SquadRTOS_SVC_vMakeTimer
.global SquadRTOS_SVC_vDeleteTimer
.global SquadRTOS_SVC_vStart
.global SquadRTOS_SVC_vEnd
.global SquadRTOS_SVC_ChangePeriod
.global SquadRTOS_SVC_vCreateMutex
.global SquadRTOS_SVC_vTakeMutex
.global SquadRTOS_SVC_vReleaseMutex
.global SquadRTOS_SVC_u32MailboxRead
.global SquadRTOS_SVC_u32MailboxWrite
.global SquadRTOS_SVC_vMailboxCreate

.text

.type SquadRTOS_SVC_vthreadCreate, %function

SquadRTOS_SVC_vthreadCreate:
	svc 1
	bx lr

.type SquadRTOS_SVC_vSchedulerStart, %function

SquadRTOS_SVC_vSchedulerStart:
    svc 0
    bx lr

.type SquadRTOS_SVC_vDelay,%function

SquadRTOS_SVC_vDelay:
	svc 2
	bx lr


.type SquadRTOS_SVC_vTaskTimeOut, %function

SquadRTOS_SVC_vTaskTimeOut:
	svc 3
	bx lr

.type SquadRTOS_SVC_vRecieve,%function
SquadRTOS_SVC_vRecieve:
	svc 4
	bx lr

.type SquadRTOS_SVC_vChangePriority,%function
SquadRTOS_SVC_vChangePriority:
	svc 5
	bx lr

.type SquadRTOS_SVC_vthreadDestroy,%function
SquadRTOS_SVC_vthreadDestroy:
	svc 6
	bx lr


.type SquadRTOS_SVC_vTaskResume,%function
SquadRTOS_SVC_vTaskResume:
	svc 7
	bx lr


.type SquadRTOS_SVC_vMakeTimer,%function
SquadRTOS_SVC_vMakeTimer:
	svc 8
	bx lr

.type SquadRTOS_SVC_vDeleteTimer,%function
SquadRTOS_SVC_vDeleteTimer:
	svc 9
	bx lr

.type SquadRTOS_SVC_vStart,%function
SquadRTOS_SVC_vStart:
	svc 10
	bx lr

.type SquadRTOS_SVC_vEnd,%function
SquadRTOS_SVC_vEnd:
	svc 11
	bx lr

.type SquadRTOS_SVC_ChangePeriod,%function
SquadRTOS_SVC_ChangePeriod:
	svc 12
	bx lr

.type SquadRTOS_SVC_vCreateMutex,%function
SquadRTOS_SVC_vCreateMutex:
	svc 13
	bx lr

.type SquadRTOS_SVC_vTakeMutex,%function
SquadRTOS_SVC_vTakeMutex:
	svc 14
	bx lr

.type SquadRTOS_SVC_vReleaseMutex,%function
SquadRTOS_SVC_vReleaseMutex:
	svc 15
	bx lr

.type SquadRTOS_SVC_vMailboxCreate,%function
SquadRTOS_SVC_vMailboxCreate:
	svc 16
	bx lr

.type SquadRTOS_SVC_u32MailboxRead,%function
SquadRTOS_SVC_u32MailboxRead:
	svc 17
	bx lr

.type SquadRTOS_SVC_u32MailboxWrite,%function
SquadRTOS_SVC_u32MailboxWrite:
	svc 18
	bx lr
