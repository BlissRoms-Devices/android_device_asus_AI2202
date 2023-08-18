#
# Copyright (C) 2023 The BlissRoms Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Bliss stuff.
$(call inherit-product, vendor/bliss/config/common_full_phone.mk)

# Inherit from AI2202 device
$(call inherit-product, device/asus/AI2202/device.mk)

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_DEVICE := AI2202
PRODUCT_NAME := bliss_AI2202
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_AI2202
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="WW_AI2202-user 13 TKQ1.220807.001 33.0804.2060.142 release-keys"

BUILD_FINGERPRINT := asus/WW_AI2202/ASUS_AI2202:13/TKQ1.220807.001/33.0804.2060.142:user/release-keys
