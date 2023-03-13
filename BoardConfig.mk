#
# Copyright (C) 2023 The BlissRoms Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/asus/AI2202

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    odm \
    product \
    recovery \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor_boot \
    vendor_dlkm \
    vendor

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := taro
TARGET_NO_BOOTLOADER := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := taro

# Inherit the proprietary files
include vendor/asus/AI2202/BoardConfigVendor.mk
