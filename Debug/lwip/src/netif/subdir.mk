################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/src/netif/bridgeif.c \
../lwip/src/netif/bridgeif_fdb.c \
../lwip/src/netif/ethernet.c \
../lwip/src/netif/lowpan6.c \
../lwip/src/netif/lowpan6_ble.c \
../lwip/src/netif/lowpan6_common.c \
../lwip/src/netif/slipif.c \
../lwip/src/netif/zepif.c 

C_DEPS += \
./lwip/src/netif/bridgeif.d \
./lwip/src/netif/bridgeif_fdb.d \
./lwip/src/netif/ethernet.d \
./lwip/src/netif/lowpan6.d \
./lwip/src/netif/lowpan6_ble.d \
./lwip/src/netif/lowpan6_common.d \
./lwip/src/netif/slipif.d \
./lwip/src/netif/zepif.d 

OBJS += \
./lwip/src/netif/bridgeif.o \
./lwip/src/netif/bridgeif_fdb.o \
./lwip/src/netif/ethernet.o \
./lwip/src/netif/lowpan6.o \
./lwip/src/netif/lowpan6_ble.o \
./lwip/src/netif/lowpan6_common.o \
./lwip/src/netif/slipif.o \
./lwip/src/netif/zepif.o 


# Each subdirectory must supply rules for building sources it contributes
lwip/src/netif/%.o: ../lwip/src/netif/%.c lwip/src/netif/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DCPU_RW612ETA2I -DCPU_RW612ETA2I_cm33_nodsp -DMCUXPRESSO_SDK -DLWIP_TIMEVAL_PRIVATE=0 -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DLWIP_NETIF_API=1 -DHTTPSRV_CFG_WEBSOCKET_ENABLED=1 -DHTTPSRV_CFG_DEFAULT_SES_CNT=8 -DSDK_DEBUGCONSOLE_UART -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DRW612_SERIES -DOSA_USED -DBOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -DWIFI_BOARD_FRDM_RW61X -DMFLASH_FILE_BASEADDR=7340032 -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 -DSDK_OS_FREE_RTOS -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"C:\Repositories\FRDM-RW612_Sandbox\flash_config" -I"C:\Repositories\FRDM-RW612_Sandbox\drivers" -I"C:\Repositories\FRDM-RW612_Sandbox\CMSIS" -I"C:\Repositories\FRDM-RW612_Sandbox\CMSIS\m-profile" -I"C:\Repositories\FRDM-RW612_Sandbox\device" -I"C:\Repositories\FRDM-RW612_Sandbox\device\periph" -I"C:\Repositories\FRDM-RW612_Sandbox\drivers\freertos" -I"C:\Repositories\FRDM-RW612_Sandbox\utilities" -I"C:\Repositories\FRDM-RW612_Sandbox\component\lists" -I"C:\Repositories\FRDM-RW612_Sandbox\utilities\str" -I"C:\Repositories\FRDM-RW612_Sandbox\utilities\debug_console" -I"C:\Repositories\FRDM-RW612_Sandbox\component\serial_manager" -I"C:\Repositories\FRDM-RW612_Sandbox\component\uart" -I"C:\Repositories\FRDM-RW612_Sandbox\component\imu_adapter" -I"C:\Repositories\FRDM-RW612_Sandbox\component\osa" -I"C:\Repositories\FRDM-RW612_Sandbox\edgefast_wifi\include" -I"C:\Repositories\FRDM-RW612_Sandbox\component\wifi_bt_module\AzureWave\tx_pwr_limits" -I"C:\Repositories\FRDM-RW612_Sandbox\component\wifi_bt_module\Murata\tx_pwr_limits" -I"C:\Repositories\FRDM-RW612_Sandbox\component\wifi_bt_module\u-blox\tx_pwr_limits" -I"C:\Repositories\FRDM-RW612_Sandbox\component\wifi_bt_module\incl" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClBuffer\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClBuffer\inc\internal" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClCore\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClEls\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClEls\inc\internal" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClMemory\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClMemory\inc\internal" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslMemory\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslMemory\inc\internal" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslCPreProcessor\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslDataIntegrity\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslFlowProtection\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslParamIntegrity\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslSecureCounter\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\compiler" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\platforms\rw61x" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\platforms\rw61x\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\includes\platform\rw61x" -I"C:\Repositories\FRDM-RW612_Sandbox\flash\mflash" -I"C:\Repositories\FRDM-RW612_Sandbox\flash\mflash\frdmrw612" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\include" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\fw_bin" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\fw_bin\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\fw_bin\rw61x" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\fw_bin\script" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\port\osa" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\port\osa" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\port" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\wifidriver" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifi_bt_firmware" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifidriver" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifidriver\incl" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\wlcmgr" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifidriver\wpa_supp_if" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifidriver\wpa_supp_if\incl" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\certs" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\port\net" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\port\net" -I"C:\Repositories\FRDM-RW612_Sandbox\lwip\port" -I"C:\Repositories\FRDM-RW612_Sandbox\lwip\src\include" -I"C:\Repositories\FRDM-RW612_Sandbox\lwip\port\sys_arch\dynamic" -I"C:\Repositories\FRDM-RW612_Sandbox\freertos\freertos-kernel\include" -I"C:\Repositories\FRDM-RW612_Sandbox\freertos\freertos-kernel\portable\GCC\ARM_CM33_NTZ\non_secure" -I"C:\Repositories\FRDM-RW612_Sandbox\freertos\freertos-kernel\template" -I"C:\Repositories\FRDM-RW612_Sandbox\freertos\freertos-kernel\template\ARM_CM33_3_priority_bits" -I"C:\Repositories\FRDM-RW612_Sandbox\source" -I"C:\Repositories\FRDM-RW612_Sandbox\component" -I"C:\Repositories\FRDM-RW612_Sandbox\component\silicon_id" -I"C:\Repositories\FRDM-RW612_Sandbox\board" -I"C:\Repositories\FRDM-RW612_Sandbox\source\mqtt\include" -I"C:\Repositories\FRDM-RW612_Sandbox\source\SoftAP\include" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -mcpu=cortex-m33+nodsp -imacros "C:\Repositories\FRDM-RW612_Sandbox\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33+nodsp -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-lwip-2f-src-2f-netif

clean-lwip-2f-src-2f-netif:
	-$(RM) ./lwip/src/netif/bridgeif.d ./lwip/src/netif/bridgeif.o ./lwip/src/netif/bridgeif_fdb.d ./lwip/src/netif/bridgeif_fdb.o ./lwip/src/netif/ethernet.d ./lwip/src/netif/ethernet.o ./lwip/src/netif/lowpan6.d ./lwip/src/netif/lowpan6.o ./lwip/src/netif/lowpan6_ble.d ./lwip/src/netif/lowpan6_ble.o ./lwip/src/netif/lowpan6_common.d ./lwip/src/netif/lowpan6_common.o ./lwip/src/netif/slipif.d ./lwip/src/netif/slipif.o ./lwip/src/netif/zepif.d ./lwip/src/netif/zepif.o

.PHONY: clean-lwip-2f-src-2f-netif

