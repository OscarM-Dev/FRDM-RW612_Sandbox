################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../wifi/wifidriver/mlan_11ac.c \
../wifi/wifidriver/mlan_11ax.c \
../wifi/wifidriver/mlan_11d.c \
../wifi/wifidriver/mlan_11h.c \
../wifi/wifidriver/mlan_11k.c \
../wifi/wifidriver/mlan_11n.c \
../wifi/wifidriver/mlan_11n_aggr.c \
../wifi/wifidriver/mlan_11n_rxreorder.c \
../wifi/wifidriver/mlan_11v.c \
../wifi/wifidriver/mlan_action.c \
../wifi/wifidriver/mlan_api.c \
../wifi/wifidriver/mlan_cfp.c \
../wifi/wifidriver/mlan_cmdevt.c \
../wifi/wifidriver/mlan_glue.c \
../wifi/wifidriver/mlan_init.c \
../wifi/wifidriver/mlan_join.c \
../wifi/wifidriver/mlan_mbo.c \
../wifi/wifidriver/mlan_misc.c \
../wifi/wifidriver/mlan_scan.c \
../wifi/wifidriver/mlan_shim.c \
../wifi/wifidriver/mlan_sta_cmd.c \
../wifi/wifidriver/mlan_sta_cmdresp.c \
../wifi/wifidriver/mlan_sta_event.c \
../wifi/wifidriver/mlan_sta_ioctl.c \
../wifi/wifidriver/mlan_sta_rx.c \
../wifi/wifidriver/mlan_txrx.c \
../wifi/wifidriver/mlan_uap_cmdevent.c \
../wifi/wifidriver/mlan_uap_ioctl.c \
../wifi/wifidriver/mlan_wmm.c \
../wifi/wifidriver/wifi-debug.c \
../wifi/wifidriver/wifi-imu.c \
../wifi/wifidriver/wifi-mem.c \
../wifi/wifidriver/wifi-uap.c \
../wifi/wifidriver/wifi-wps.c \
../wifi/wifidriver/wifi.c \
../wifi/wifidriver/wifi_pwrmgr.c 

C_DEPS += \
./wifi/wifidriver/mlan_11ac.d \
./wifi/wifidriver/mlan_11ax.d \
./wifi/wifidriver/mlan_11d.d \
./wifi/wifidriver/mlan_11h.d \
./wifi/wifidriver/mlan_11k.d \
./wifi/wifidriver/mlan_11n.d \
./wifi/wifidriver/mlan_11n_aggr.d \
./wifi/wifidriver/mlan_11n_rxreorder.d \
./wifi/wifidriver/mlan_11v.d \
./wifi/wifidriver/mlan_action.d \
./wifi/wifidriver/mlan_api.d \
./wifi/wifidriver/mlan_cfp.d \
./wifi/wifidriver/mlan_cmdevt.d \
./wifi/wifidriver/mlan_glue.d \
./wifi/wifidriver/mlan_init.d \
./wifi/wifidriver/mlan_join.d \
./wifi/wifidriver/mlan_mbo.d \
./wifi/wifidriver/mlan_misc.d \
./wifi/wifidriver/mlan_scan.d \
./wifi/wifidriver/mlan_shim.d \
./wifi/wifidriver/mlan_sta_cmd.d \
./wifi/wifidriver/mlan_sta_cmdresp.d \
./wifi/wifidriver/mlan_sta_event.d \
./wifi/wifidriver/mlan_sta_ioctl.d \
./wifi/wifidriver/mlan_sta_rx.d \
./wifi/wifidriver/mlan_txrx.d \
./wifi/wifidriver/mlan_uap_cmdevent.d \
./wifi/wifidriver/mlan_uap_ioctl.d \
./wifi/wifidriver/mlan_wmm.d \
./wifi/wifidriver/wifi-debug.d \
./wifi/wifidriver/wifi-imu.d \
./wifi/wifidriver/wifi-mem.d \
./wifi/wifidriver/wifi-uap.d \
./wifi/wifidriver/wifi-wps.d \
./wifi/wifidriver/wifi.d \
./wifi/wifidriver/wifi_pwrmgr.d 

OBJS += \
./wifi/wifidriver/mlan_11ac.o \
./wifi/wifidriver/mlan_11ax.o \
./wifi/wifidriver/mlan_11d.o \
./wifi/wifidriver/mlan_11h.o \
./wifi/wifidriver/mlan_11k.o \
./wifi/wifidriver/mlan_11n.o \
./wifi/wifidriver/mlan_11n_aggr.o \
./wifi/wifidriver/mlan_11n_rxreorder.o \
./wifi/wifidriver/mlan_11v.o \
./wifi/wifidriver/mlan_action.o \
./wifi/wifidriver/mlan_api.o \
./wifi/wifidriver/mlan_cfp.o \
./wifi/wifidriver/mlan_cmdevt.o \
./wifi/wifidriver/mlan_glue.o \
./wifi/wifidriver/mlan_init.o \
./wifi/wifidriver/mlan_join.o \
./wifi/wifidriver/mlan_mbo.o \
./wifi/wifidriver/mlan_misc.o \
./wifi/wifidriver/mlan_scan.o \
./wifi/wifidriver/mlan_shim.o \
./wifi/wifidriver/mlan_sta_cmd.o \
./wifi/wifidriver/mlan_sta_cmdresp.o \
./wifi/wifidriver/mlan_sta_event.o \
./wifi/wifidriver/mlan_sta_ioctl.o \
./wifi/wifidriver/mlan_sta_rx.o \
./wifi/wifidriver/mlan_txrx.o \
./wifi/wifidriver/mlan_uap_cmdevent.o \
./wifi/wifidriver/mlan_uap_ioctl.o \
./wifi/wifidriver/mlan_wmm.o \
./wifi/wifidriver/wifi-debug.o \
./wifi/wifidriver/wifi-imu.o \
./wifi/wifidriver/wifi-mem.o \
./wifi/wifidriver/wifi-uap.o \
./wifi/wifidriver/wifi-wps.o \
./wifi/wifidriver/wifi.o \
./wifi/wifidriver/wifi_pwrmgr.o 


# Each subdirectory must supply rules for building sources it contributes
wifi/wifidriver/%.o: ../wifi/wifidriver/%.c wifi/wifidriver/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DCPU_RW612ETA2I -DCPU_RW612ETA2I_cm33_nodsp -DMCUXPRESSO_SDK -DLWIP_TIMEVAL_PRIVATE=0 -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DLWIP_NETIF_API=1 -DHTTPSRV_CFG_WEBSOCKET_ENABLED=1 -DHTTPSRV_CFG_DEFAULT_SES_CNT=8 -DSDK_DEBUGCONSOLE_UART -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DRW612_SERIES -DOSA_USED -DBOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -DWIFI_BOARD_FRDM_RW61X -DMFLASH_FILE_BASEADDR=7340032 -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 -DSDK_OS_FREE_RTOS -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"C:\Repositories\FRDM-RW612_Sandbox\flash_config" -I"C:\Repositories\FRDM-RW612_Sandbox\drivers" -I"C:\Repositories\FRDM-RW612_Sandbox\CMSIS" -I"C:\Repositories\FRDM-RW612_Sandbox\CMSIS\m-profile" -I"C:\Repositories\FRDM-RW612_Sandbox\device" -I"C:\Repositories\FRDM-RW612_Sandbox\device\periph" -I"C:\Repositories\FRDM-RW612_Sandbox\drivers\freertos" -I"C:\Repositories\FRDM-RW612_Sandbox\utilities" -I"C:\Repositories\FRDM-RW612_Sandbox\component\lists" -I"C:\Repositories\FRDM-RW612_Sandbox\utilities\str" -I"C:\Repositories\FRDM-RW612_Sandbox\utilities\debug_console" -I"C:\Repositories\FRDM-RW612_Sandbox\component\serial_manager" -I"C:\Repositories\FRDM-RW612_Sandbox\component\uart" -I"C:\Repositories\FRDM-RW612_Sandbox\component\imu_adapter" -I"C:\Repositories\FRDM-RW612_Sandbox\component\osa" -I"C:\Repositories\FRDM-RW612_Sandbox\edgefast_wifi\include" -I"C:\Repositories\FRDM-RW612_Sandbox\component\wifi_bt_module\AzureWave\tx_pwr_limits" -I"C:\Repositories\FRDM-RW612_Sandbox\component\wifi_bt_module\Murata\tx_pwr_limits" -I"C:\Repositories\FRDM-RW612_Sandbox\component\wifi_bt_module\u-blox\tx_pwr_limits" -I"C:\Repositories\FRDM-RW612_Sandbox\component\wifi_bt_module\incl" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClBuffer\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClBuffer\inc\internal" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClCore\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClEls\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClEls\inc\internal" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClMemory\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxClMemory\inc\internal" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslMemory\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslMemory\inc\internal" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslCPreProcessor\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslDataIntegrity\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslFlowProtection\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslParamIntegrity\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\comps\mcuxCsslSecureCounter\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\compiler" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\platforms\rw61x" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\src\platforms\rw61x\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\els_pkc\includes\platform\rw61x" -I"C:\Repositories\FRDM-RW612_Sandbox\flash\mflash" -I"C:\Repositories\FRDM-RW612_Sandbox\flash\mflash\frdmrw612" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\include" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\fw_bin" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\fw_bin\inc" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\fw_bin\rw61x" -I"C:\Repositories\FRDM-RW612_Sandbox\component\conn_fwloader\fw_bin\script" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\port\osa" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\port\osa" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\port" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\wifidriver" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifi_bt_firmware" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifidriver" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifidriver\incl" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\wlcmgr" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifidriver\wpa_supp_if" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\wifidriver\wpa_supp_if\incl" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\certs" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\incl\port\net" -I"C:\Repositories\FRDM-RW612_Sandbox\wifi\port\net" -I"C:\Repositories\FRDM-RW612_Sandbox\lwip\port" -I"C:\Repositories\FRDM-RW612_Sandbox\lwip\src\include" -I"C:\Repositories\FRDM-RW612_Sandbox\lwip\port\sys_arch\dynamic" -I"C:\Repositories\FRDM-RW612_Sandbox\freertos\freertos-kernel\include" -I"C:\Repositories\FRDM-RW612_Sandbox\freertos\freertos-kernel\portable\GCC\ARM_CM33_NTZ\non_secure" -I"C:\Repositories\FRDM-RW612_Sandbox\freertos\freertos-kernel\template" -I"C:\Repositories\FRDM-RW612_Sandbox\freertos\freertos-kernel\template\ARM_CM33_3_priority_bits" -I"C:\Repositories\FRDM-RW612_Sandbox\source" -I"C:\Repositories\FRDM-RW612_Sandbox\component" -I"C:\Repositories\FRDM-RW612_Sandbox\component\silicon_id" -I"C:\Repositories\FRDM-RW612_Sandbox\board" -I"C:\Repositories\FRDM-RW612_Sandbox\source\mqtt\include" -I"C:\Repositories\FRDM-RW612_Sandbox\source\SoftAP\include" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -mcpu=cortex-m33+nodsp -imacros "C:\Repositories\FRDM-RW612_Sandbox\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33+nodsp -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-wifi-2f-wifidriver

clean-wifi-2f-wifidriver:
	-$(RM) ./wifi/wifidriver/mlan_11ac.d ./wifi/wifidriver/mlan_11ac.o ./wifi/wifidriver/mlan_11ax.d ./wifi/wifidriver/mlan_11ax.o ./wifi/wifidriver/mlan_11d.d ./wifi/wifidriver/mlan_11d.o ./wifi/wifidriver/mlan_11h.d ./wifi/wifidriver/mlan_11h.o ./wifi/wifidriver/mlan_11k.d ./wifi/wifidriver/mlan_11k.o ./wifi/wifidriver/mlan_11n.d ./wifi/wifidriver/mlan_11n.o ./wifi/wifidriver/mlan_11n_aggr.d ./wifi/wifidriver/mlan_11n_aggr.o ./wifi/wifidriver/mlan_11n_rxreorder.d ./wifi/wifidriver/mlan_11n_rxreorder.o ./wifi/wifidriver/mlan_11v.d ./wifi/wifidriver/mlan_11v.o ./wifi/wifidriver/mlan_action.d ./wifi/wifidriver/mlan_action.o ./wifi/wifidriver/mlan_api.d ./wifi/wifidriver/mlan_api.o ./wifi/wifidriver/mlan_cfp.d ./wifi/wifidriver/mlan_cfp.o ./wifi/wifidriver/mlan_cmdevt.d ./wifi/wifidriver/mlan_cmdevt.o ./wifi/wifidriver/mlan_glue.d ./wifi/wifidriver/mlan_glue.o ./wifi/wifidriver/mlan_init.d ./wifi/wifidriver/mlan_init.o ./wifi/wifidriver/mlan_join.d ./wifi/wifidriver/mlan_join.o ./wifi/wifidriver/mlan_mbo.d ./wifi/wifidriver/mlan_mbo.o ./wifi/wifidriver/mlan_misc.d ./wifi/wifidriver/mlan_misc.o ./wifi/wifidriver/mlan_scan.d ./wifi/wifidriver/mlan_scan.o ./wifi/wifidriver/mlan_shim.d ./wifi/wifidriver/mlan_shim.o ./wifi/wifidriver/mlan_sta_cmd.d ./wifi/wifidriver/mlan_sta_cmd.o ./wifi/wifidriver/mlan_sta_cmdresp.d ./wifi/wifidriver/mlan_sta_cmdresp.o ./wifi/wifidriver/mlan_sta_event.d ./wifi/wifidriver/mlan_sta_event.o ./wifi/wifidriver/mlan_sta_ioctl.d ./wifi/wifidriver/mlan_sta_ioctl.o ./wifi/wifidriver/mlan_sta_rx.d ./wifi/wifidriver/mlan_sta_rx.o ./wifi/wifidriver/mlan_txrx.d ./wifi/wifidriver/mlan_txrx.o ./wifi/wifidriver/mlan_uap_cmdevent.d ./wifi/wifidriver/mlan_uap_cmdevent.o ./wifi/wifidriver/mlan_uap_ioctl.d ./wifi/wifidriver/mlan_uap_ioctl.o ./wifi/wifidriver/mlan_wmm.d ./wifi/wifidriver/mlan_wmm.o ./wifi/wifidriver/wifi-debug.d ./wifi/wifidriver/wifi-debug.o ./wifi/wifidriver/wifi-imu.d ./wifi/wifidriver/wifi-imu.o ./wifi/wifidriver/wifi-mem.d ./wifi/wifidriver/wifi-mem.o ./wifi/wifidriver/wifi-uap.d ./wifi/wifidriver/wifi-uap.o ./wifi/wifidriver/wifi-wps.d ./wifi/wifidriver/wifi-wps.o ./wifi/wifidriver/wifi.d ./wifi/wifidriver/wifi.o ./wifi/wifidriver/wifi_pwrmgr.d ./wifi/wifidriver/wifi_pwrmgr.o

.PHONY: clean-wifi-2f-wifidriver

