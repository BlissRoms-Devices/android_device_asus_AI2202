#
# Copyright (C) 2023 The BlissRoms Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Adreno
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions//android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# ATrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service \
    android.hardware.authsecret@1.0.vendor

# Dirac
PRODUCT_PACKAGES += \
    ASUSDiracGef

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.3-impl \
    audioadsprpcd \
    audio.primary.taro \
    audio.r_submix.default \
    audio.usb.default \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndcardparser \
    libtinycompress\
    vendor.qti.hardware.AGMIPC@1.0-service \
    vendor.qti.hardware.pal@1.0-impl \
    vendor.qti.hardware.pal@1.0.vendor

AUDIO_HAL_DIR := hardware/qcom-caf/sm8450/audio/primary-hal
AUDIO_PAL_DIR := hardware/qcom-caf/sm8450/audio/pal

PRODUCT_COPY_FILES += \
    $(AUDIO_HAL_DIR)/configs/taro/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/audio_effects.conf \
    $(AUDIO_HAL_DIR)/configs/taro/card-defs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/card-defs.xml \
    $(AUDIO_HAL_DIR)/configs/taro/microphone_characteristics.xml:$(TARGET_COPY_OUT_VENDOR)/etc/microphone_characteristics.xml \
    $(AUDIO_HAL_DIR)/configs/taro/mixer_paths_waipio_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths_waipio_qrd.xml \
    $(AUDIO_HAL_DIR)/configs/taro/mixer_paths_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths_waipio_mtp.xml \
    $(AUDIO_HAL_DIR)/configs/taro/mixer_paths_waipio_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths_waipio_cdp.xml \
    $(AUDIO_PAL_DIR)/configs/taro/resourcemanager_waipio_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_waipio_qrd.xml \
    $(AUDIO_PAL_DIR)/configs/taro/resourcemanager_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_waipio_mtp.xml \
    $(AUDIO_PAL_DIR)/configs/taro/resourcemanager_waipio_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_waipio_cdp.xml \
    $(AUDIO_PAL_DIR)/configs/taro/resourcemanager_upd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_upd.xml \
    $(AUDIO_PAL_DIR)/configs/taro/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml \
    $(AUDIO_HAL_DIR)/configs/common/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(AUDIO_HAL_DIR)/configs/common/codec2/media_codecs_c2_audio.xml:vendor/etc/media_codecs_c2_audio.xml \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/DAVINCI/mixer_paths_DAVINCI.xml \
    $(LOCAL_PATH)/audio/resourcemanager_davinci.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/DAVINCI/resourcemanager_davinci.xml \
    $(LOCAL_PATH)/audio/usecaseKvManager_davinci.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/DAVINCI/usecaseKvManager_davinci.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \

# Bluetooth
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml

PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    com.dsi.ant@1.0.vendor \
    android.hardware.bluetooth.audio-impl \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.0-impl \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

ifneq (,$(wildcard vendor/qcom/opensource/commonsys/system/bt))
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.bluetooth.library_name=libbluetooth_qti.so
endif

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7.vendor \
    camera.device@1.0-impl \
    libcamera2ndk_vendor \
    vendor.qti.hardware.camera.aon@1.0.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Data
PRODUCT_PACKAGES += \
    IPACM_cfg.xml \
    ipacm \
    IPACM_Filter_cfg.xml \
    librmnetctl

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.common-V1-ndk_platform.vendor \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    init.qti.display_boot.sh \
    init.qti.display_boot.rc \
    libdisplayconfig \
    libdisplayconfig.qti \
    libdisplayconfig.vendor \
    libdisplayconfig.qti.vendor \
    libfilefinder \
    libgralloc.qti \
    libion \
    libqdutils \
    libqdMetaData \
    libqdMetaData.system \
    libqdutils \
    libqservice \
    libsdmcore \
    libsdmutils \
    libtinyxml2 \
    vendor.display.config@1.11.vendor \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.config.vendor \
    vendor.qti.hardware.display.config-V1-ndk.vendor \
    vendor.qti.hardware.display.config-V2-ndk.vendor \
    vendor.qti.hardware.display.config-V3-ndk.vendor \
    vendor.qti.hardware.display.config-V4-ndk.vendor \
    vendor.qti.hardware.display.config-V5-ndk.vendor \
    vendor.qti.hardware.display.config-V6-ndk.vendor \
    vendor.qti.hardware.display.config-V1-ndk_platform.vendor \
    vendor.qti.hardware.display.config-V2-ndk_platform.vendor \
    vendor.qti.hardware.display.config-V3-ndk_platform.vendor \
    vendor.qti.hardware.display.config-V4-ndk_platform.vendor \
    vendor.qti.hardware.display.config-V5-ndk_platform.vendor \
    vendor.qti.hardware.display.config-V6-ndk_platform.vendor \
    vendor.qti.hardware.display.demura-service \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/goodixfp.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodixfp.kl \

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
$(call inherit-product, $(LOCAL_PATH)/gps/gps_vendor_product.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport.vendor \
    libhwbinder.vendor

# Hotword Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Identity
PRODUCT_PACKAGES += \
    android.hardware.identity-V3-ndk_platform.vendor

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.asus.rc \
    init.target.rc \
    init.recovery.qcom.rc \
    init.qcom.rc \
    init.qti.ufs.rc \
    init.qti.kernel.rc \
    ssgqmigd.rc \
    ueventd.asus.rc \
    ueventd.qcom.rc

PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.crda.sh \
    init.kernel.post_boot.sh \
    init.kernel.post_boot-cape.sh \
    init.kernel.post_boot-diwali.sh \
    init.kernel.post_boot-taro.sh \
    init.mdm.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sh \
    init.qti.kernel.sh \
    vendor_modprobe.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# Kernel
TARGET_KERNEL_VERSION := 5.10
TARGET_KERNEL_DIR ?= device/asus/AI2202-kernel
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Keymaster
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform.vendor \
    libkeymaster_messages.vendor

# Lights
PRODUCT_PACKAGES += \
    vendor.qti.hardware.lights.service \
    libtinyxml \
    lights.qcom

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxCore \
    libavservices_minijail.vendor \
    libcodec2_hidl@1.0.vendor \
    libcodec2_vndk.vendor \
    libgui_vendor \
    libmm-omxcore \
    libplatformconfig \
    libstagefright_softomx.vendor \
    libstagefrighthw \

# Networking
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks-V1-ndk_platform.vendor

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    android.hardware.nfc@1.2-service \
    android.hardware.secure_element@1.1-service \
    libchrome.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_eSE/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_eSE/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    ApertureOverlayAI2202 \
    CarrierConfigResZenfone9 \
    FrameworksResTarget_Vendor \
    FrameworksResCommon_Sys \
    TelephonyResCommon_Sys \
    WifiResTarget_cape \
    WifiResTarget_spf \
    Zenfone9Frameworks \
    Zenfone9SettingsProvider \
    Zenfone9SystemUI \
    SettingsResZenfone9

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti \
    android.hardware.power@1.2.vendor

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/power/config/taro/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# QMI
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti.vendor \
    libvndfwk_detect_jni.qti_vendor \
    libqti_vndfwk_detect_vendor

# Ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.multihal \
    libsensorndkbridge

# Shipping API level
BOARD_API_LEVEL := 31
BOARD_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_PACKAGES += \
    android.hardware.radio@1.6.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.secure_element@1.2.vendor

PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    telephony-ext \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti-v2

# TrustedUI
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor \
    vendor.qti.hardware.systemhelper@1.0.vendor

# USB
TARGET_HAS_DIAG_ROUTER := true
$(call inherit-product, vendor/qcom/opensource/usb/vendor_product.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    android.hardware.wifi.hostapd@1.0.vendor \
    vendor.qti.hardware.wifi.hostapd@1.0.vendor \
    vendor.qti.hardware.wifi.hostapd@1.1.vendor \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.0.vendor \
    vendor.qti.hardware.wifi.supplicant@2.1.vendor \
    vendor.qti.hardware.wifi.supplicant@2.2.vendor \
    hostapd \
    libwifi-hal-qcom \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6490/WCNSS_qcom_cfg.ini

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

# Inherit the proprietary files
$(call inherit-product, vendor/asus/AI2202/AI2202-vendor.mk)
