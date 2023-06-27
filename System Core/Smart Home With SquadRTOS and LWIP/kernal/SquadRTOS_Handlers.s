/*
 * SquadRTOS_Handlers.s
 *
 *  Created on: Mar 3, 2023
 *      Author: mahmoud abou-Hawis
 */
.syntax unified
.cpu cortex-m4
.thumb

.global SquadRTOS_SVC_Handler
.global SquadRTOS_PendSV_Handler

.text

.type SquadRTOS_SVC_Handler %function

SquadRTOS_SVC_Handler:
    tst lr, #4
    ite eq
    mrseq r0, msp
    mrsne r0, psp
    ldr r1,=svcEXEReturn
    str lr,[r1]
    bl SquadRTOS_SVC_vHandler_main
    ldr r1,=svcEXEReturn
    ldr lr,[r1]
    bx lr




.type SquadRTOS_PendSV_Handler, %function
SquadRTOS_PendSV_Handler:
    /* ******************** */
    /* Save current context */
    /* ******************** */
    mrs r1, psp
    tst lr, #0x10
    it eq
    vstmdbeq r1!, {s16-s31}
    mov r2, lr
    mrs r3, control
    stmdb r1!,{r2-r11}
    bl SquadRTOS_ThreadGetRunning
    str r1,[r0]
    /* ******************** */
    /* Load next context    */
    /* ******************** */
    mov r0, #1
    msr basepri, r0
    bl SquadRTOS_vthreadSwitchRunning
    mov r0, #0
    msr basepri, r0
    bl SquadRTOS_ThreadGetRunning
    ldr r1,[r0]
    ldmia r1!,{r2-r11}
    mov lr, r2
    msr control, r3
    isb
    tst lr, #0x10
    it eq
    vldmiaeq r1!, {s16-s31}
    msr psp, r1
    bx lr
