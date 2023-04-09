################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
lwip/src/core/ipv6/dhcp6.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/dhcp6.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv6/ethip6.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/ethip6.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv6/icmp6.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/icmp6.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv6/inet6.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/inet6.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv6/ip6.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/ip6.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv6/ip6_addr.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/ip6_addr.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv6/ip6_frag.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/ip6_frag.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv6/mld6.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/mld6.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

lwip/src/core/ipv6/nd6.o: C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/core/ipv6/nd6.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: GNU Compiler'
	"C:/ti/gcc_arm_none_eabi_9_2_1/bin/arm-none-eabi-gcc-9.2.1.exe" -c -mcpu=cortex-m4 -march=armv7e-m -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DDeviceFamily_MSP432E4 -D__MSP432E401Y__ -I"C:/Users/mahmo/Desktop/CcsWorkspace/25_Test/ethernet-based_io_control_MSP_EXP432E401Y_nortos_gcc" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/ports/msp432e4/include/utils" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/lwip/src/include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/third_party/CMSIS/Include" -I"C:/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/net/bsd" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include/newlib-nano" -I"C:/ti/gcc_arm_none_eabi_9_2_1/arm-none-eabi/include" -ffunction-sections -fdata-sections -g -gdwarf-3 -gstrict-dwarf -Wall -MMD -MP -MF"lwip/src/core/ipv6/$(basename $(<F)).d_raw" -MT"$(@)" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


