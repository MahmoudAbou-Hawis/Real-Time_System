################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
lwip/src/core/def.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/def.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/dns.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/dns.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/inet_chksum.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/inet_chksum.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/init.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/init.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ip.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ip.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/mem.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/mem.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/memp.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/memp.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/netif.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/netif.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/pbuf.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/pbuf.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/raw.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/raw.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/stats.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/stats.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/sys.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/sys.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/tcp.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/tcp.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/tcp_in.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/tcp_in.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/tcp_out.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/tcp_out.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/timeouts.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/timeouts.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/udp.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/udp.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


