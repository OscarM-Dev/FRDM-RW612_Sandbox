################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/src/core/altcp.c \
../lwip/src/core/altcp_alloc.c \
../lwip/src/core/altcp_tcp.c \
../lwip/src/core/def.c \
../lwip/src/core/dns.c \
../lwip/src/core/inet_chksum.c \
../lwip/src/core/init.c \
../lwip/src/core/ip.c \
../lwip/src/core/mem.c \
../lwip/src/core/memp.c \
../lwip/src/core/netif.c \
../lwip/src/core/pbuf.c \
../lwip/src/core/raw.c \
../lwip/src/core/stats.c \
../lwip/src/core/sys.c \
../lwip/src/core/tcp.c \
../lwip/src/core/tcp_in.c \
../lwip/src/core/tcp_out.c \
../lwip/src/core/timeouts.c \
../lwip/src/core/udp.c 

C_DEPS += \
./lwip/src/core/altcp.d \
./lwip/src/core/altcp_alloc.d \
./lwip/src/core/altcp_tcp.d \
./lwip/src/core/def.d \
./lwip/src/core/dns.d \
./lwip/src/core/inet_chksum.d \
./lwip/src/core/init.d \
./lwip/src/core/ip.d \
./lwip/src/core/mem.d \
./lwip/src/core/memp.d \
./lwip/src/core/netif.d \
./lwip/src/core/pbuf.d \
./lwip/src/core/raw.d \
./lwip/src/core/stats.d \
./lwip/src/core/sys.d \
./lwip/src/core/tcp.d \
./lwip/src/core/tcp_in.d \
./lwip/src/core/tcp_out.d \
./lwip/src/core/timeouts.d \
./lwip/src/core/udp.d 

OBJS += \
./lwip/src/core/altcp.o \
./lwip/src/core/altcp_alloc.o \
./lwip/src/core/altcp_tcp.o \
./lwip/src/core/def.o \
./lwip/src/core/dns.o \
./lwip/src/core/inet_chksum.o \
./lwip/src/core/init.o \
./lwip/src/core/ip.o \
./lwip/src/core/mem.o \
./lwip/src/core/memp.o \
./lwip/src/core/netif.o \
./lwip/src/core/pbuf.o \
./lwip/src/core/raw.o \
./lwip/src/core/stats.o \
./lwip/src/core/sys.o \
./lwip/src/core/tcp.o \
./lwip/src/core/tcp_in.o \
./lwip/src/core/tcp_out.o \
./lwip/src/core/timeouts.o \
./lwip/src/core/udp.o 


# Each subdirectory must supply rules for building sources it contributes
lwip/src/core/%.o: ../lwip/src/core/%.c lwip/src/core/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DMCUXPRESSO_SDK -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 -DUSB_STACK_FREERTOS -DFSL_FEATURE_PHYKSZ8081_USE_RMII50M_MODE -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCPU_RW612ETA2I -DOSA_USED -DBOOT_HEADER_ENABLE=1 -DUSE_RTOS=1 -DSDK_OS_FREE_RTOS -DCPU_RW612ETA2I_cm33_nodsp -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\source" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\flash_config" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\drivers" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\CMSIS" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\CMSIS\m-profile" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\device" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\device\periph" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\utilities" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\lists" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\utilities\str" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\utilities\debug_console_lite" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\uart" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\osa\config" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\osa" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\phy" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\silicon_id" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClBuffer\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClBuffer\inc\internal" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClCore\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClEls\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClEls\inc\internal" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClMemory\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClMemory\inc\internal" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslMemory\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslMemory\inc\internal" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslCPreProcessor\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslDataIntegrity\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslFlowProtection\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslParamIntegrity\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslSecureCounter\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\compiler" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\platforms\rw61x" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\platforms\rw61x\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\includes\platform\rw61x" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\gpio" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\lwip\port" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\lwip\src\include" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\lwip\port\sys_arch\dynamic" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\usb\include" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\usb\host" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\usb\host\class" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\freertos\freertos-kernel\include" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\freertos\freertos-kernel\portable\GCC\ARM_CM33_NTZ\non_secure" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\board" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\source\config\host\ehci" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\freertos\freertos-kernel\template" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\freertos\freertos-kernel\template\ARM_CM33_3_priority_bits" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -mcpu=cortex-m33+nodsp -imacros "C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33+nodsp -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-lwip-2f-src-2f-core

clean-lwip-2f-src-2f-core:
	-$(RM) ./lwip/src/core/altcp.d ./lwip/src/core/altcp.o ./lwip/src/core/altcp_alloc.d ./lwip/src/core/altcp_alloc.o ./lwip/src/core/altcp_tcp.d ./lwip/src/core/altcp_tcp.o ./lwip/src/core/def.d ./lwip/src/core/def.o ./lwip/src/core/dns.d ./lwip/src/core/dns.o ./lwip/src/core/inet_chksum.d ./lwip/src/core/inet_chksum.o ./lwip/src/core/init.d ./lwip/src/core/init.o ./lwip/src/core/ip.d ./lwip/src/core/ip.o ./lwip/src/core/mem.d ./lwip/src/core/mem.o ./lwip/src/core/memp.d ./lwip/src/core/memp.o ./lwip/src/core/netif.d ./lwip/src/core/netif.o ./lwip/src/core/pbuf.d ./lwip/src/core/pbuf.o ./lwip/src/core/raw.d ./lwip/src/core/raw.o ./lwip/src/core/stats.d ./lwip/src/core/stats.o ./lwip/src/core/sys.d ./lwip/src/core/sys.o ./lwip/src/core/tcp.d ./lwip/src/core/tcp.o ./lwip/src/core/tcp_in.d ./lwip/src/core/tcp_in.o ./lwip/src/core/tcp_out.d ./lwip/src/core/tcp_out.o ./lwip/src/core/timeouts.d ./lwip/src/core/timeouts.o ./lwip/src/core/udp.d ./lwip/src/core/udp.o

.PHONY: clean-lwip-2f-src-2f-core

