################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
lwip/src/api/api_lib.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/api/api_lib.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/api/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/api/api_msg.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/api/api_msg.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/api/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/api/err.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/api/err.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/api/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/api/netbuf.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/api/netbuf.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/api/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/api/netdb.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/api/netdb.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/api/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/api/netifapi.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/api/netifapi.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/api/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/api/sockets.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/api/sockets.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/api/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/api/tcpip.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/api/tcpip.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/api/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


