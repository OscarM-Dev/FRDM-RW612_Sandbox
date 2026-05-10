################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/app.c \
../source/database_task.c \
../source/hardware_init.c \
../source/host_keyboard.c \
../source/pin_mux.c \
../source/semihost_hardfault.c \
../source/servo_task.c \
../source/tcpipserver_task.c 

C_DEPS += \
./source/app.d \
./source/database_task.d \
./source/hardware_init.d \
./source/host_keyboard.d \
./source/pin_mux.d \
./source/semihost_hardfault.d \
./source/servo_task.d \
./source/tcpipserver_task.d 

OBJS += \
./source/app.o \
./source/database_task.o \
./source/hardware_init.o \
./source/host_keyboard.o \
./source/pin_mux.o \
./source/semihost_hardfault.o \
./source/servo_task.o \
./source/tcpipserver_task.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DMCUXPRESSO_SDK -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 -DUSB_STACK_FREERTOS -DFSL_FEATURE_PHYKSZ8081_USE_RMII50M_MODE -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCPU_RW612ETA2I -DOSA_USED -DBOOT_HEADER_ENABLE=1 -DUSE_RTOS=1 -DSDK_OS_FREE_RTOS -DCPU_RW612ETA2I_cm33_nodsp -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\source" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\flash_config" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\drivers" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\CMSIS" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\CMSIS\m-profile" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\device" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\device\periph" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\utilities" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\lists" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\utilities\str" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\utilities\debug_console_lite" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\uart" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\osa\config" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\osa" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\phy" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\silicon_id" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClBuffer\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClBuffer\inc\internal" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClCore\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClEls\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClEls\inc\internal" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClMemory\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClMemory\inc\internal" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslMemory\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslMemory\inc\internal" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslCPreProcessor\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslDataIntegrity\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslFlowProtection\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslParamIntegrity\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslSecureCounter\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\compiler" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\platforms\rw61x" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\src\platforms\rw61x\inc" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\els_pkc\includes\platform\rw61x" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\component\gpio" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\lwip\port" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\lwip\src\include" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\lwip\port\sys_arch\dynamic" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\usb\include" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\usb\host" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\usb\host\class" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\freertos\freertos-kernel\include" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\freertos\freertos-kernel\portable\GCC\ARM_CM33_NTZ\non_secure" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\board" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\source\config\host\ehci" -I"C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\freertos\freertos-kernel\template" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -mcpu=cortex-m33+nodsp -imacros "C:\Users\Familia\Documents\Especialidad_ITESO\Semestre_1\Redes_comunicacion\RW612_Practices\FRDM-RW612_Sandbox\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33+nodsp -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/app.d ./source/app.o ./source/database_task.d ./source/database_task.o ./source/hardware_init.d ./source/hardware_init.o ./source/host_keyboard.d ./source/host_keyboard.o ./source/pin_mux.d ./source/pin_mux.o ./source/semihost_hardfault.d ./source/semihost_hardfault.o ./source/servo_task.d ./source/servo_task.o ./source/tcpipserver_task.d ./source/tcpipserver_task.o

.PHONY: clean-source

