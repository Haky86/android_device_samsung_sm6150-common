#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/samsung/sm6150-common

PRODUCT_TARGET_VNDK_VERSION := 29

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Proprietary blobs
$(call inherit-product-if-exists, vendor/samsung/sm6150-common/sm6150-common-vendor.mk)

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS += *

# Audio 
PRODUCT_PACKAGES += \
    audio.a2dp.default
    
# Display
PRODUCT_PACKAGES += \
    libvulkan \
    vendor.display.config@1.0

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc
    
# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# OTA Updater
AB_OTA_UPDATER := false

# Recovery
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/init.recovery.qcom.rc:root/init.recovery.qcom.rc

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext
