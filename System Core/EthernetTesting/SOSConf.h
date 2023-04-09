
#define DynamicAllocation             0

#if(DynamicAllocation == 0)
#define QueueSize                     10
#endif


#if(DynamicAllocation)
#define reSizeQueueBy                 1
#endif

#define FrameDataSize                 10
#define TasksCommunicateExternaly     4
#define TasksNumber                   10

#define SYSTEM_CORE_CLOCK_HZ               ((uint32_t) 120000000u)

#define SYS_TICK_RATE_HZ                     ((uint32_t) 10000u)
#define THREAD_STACK_SIZE                 ((uint32_t) 1024u)

#define THREADS_PRIORITY_LEVELS           ((uint32_t) 16u)

#define INTERRUPTS_NUMBERS            111

//#define ASSERT(x) if((x) == 0) {__disable_irq(); while(1); }
