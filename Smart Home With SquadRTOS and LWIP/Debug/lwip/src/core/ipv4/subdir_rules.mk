################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
lwip/src/core/ipv4/autoip.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv4/autoip.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/Mahmoud Sofar/Desktop/CSSWorkspace/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv4/autoip.d_raw" -MT"lwip/src/core/ipv4/autoip.o" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv4/dhcp.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv4/dhcp.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/Mahmoud Sofar/Desktop/CSSWorkspace/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv4/dhcp.d_raw" -MT"lwip/src/core/ipv4/dhcp.o" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv4/etharp.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv4/etharp.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/Mahmoud Sofar/Desktop/CSSWorkspace/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv4/etharp.d_raw" -MT"lwip/src/core/ipv4/etharp.o" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv4/icmp.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv4/icmp.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/Mahmoud Sofar/Desktop/CSSWorkspace/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv4/icmp.d_raw" -MT"lwip/src/core/ipv4/icmp.o" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv4/igmp.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv4/igmp.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/Mahmoud Sofar/Desktop/CSSWorkspace/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv4/igmp.d_raw" -MT"lwip/src/core/ipv4/igmp.o" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv4/ip4.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv4/ip4.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/Mahmoud Sofar/Desktop/CSSWorkspace/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv4/ip4.d_raw" -MT"lwip/src/core/ipv4/ip4.o" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv4/ip4_addr.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv4/ip4_addr.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/Mahmoud Sofar/Desktop/CSSWorkspace/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv4/ip4_addr.d_raw" -MT"lwip/src/core/ipv4/ip4_addr.o" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv4/ip4_frag.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv4/ip4_frag.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/Mahmoud Sofar/Desktop/CSSWorkspace/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv4/ip4_frag.d_raw" -MT"lwip/src/core/ipv4/ip4_frag.o" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


