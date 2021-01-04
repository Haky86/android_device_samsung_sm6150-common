#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := hardware/samsung/aidl/power-libperfmgr

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power-service.sm6150-libperfmgr
LOCAL_MODULE_STEM := android.hardware.power-service.samsung-libperfmgr
LOCAL_MODULE_TAGS  := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SRC_FILES := \
    service.cpp \
    Power.cpp \
    PowerExt.cpp \
    InteractionHandler.cpp \
    LineagePower.cpp

LOCAL_REQUIRED_MODULES := \
    android.hardware.power-service.samsung-libperfmgr.rc \
    android.hardware.power-service.samsung.xml

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libcutils \
    liblog \
    libhidltransport \
    libutils \
    libbinder_ndk \
    libperfmgr \
    pixel-power-ext-ndk_platform \
    android.hardware.power-ndk_platform \
    vendor.lineage.power-ndk_platform

LOCAL_CFLAGS += -Wall -Werror

LOCAL_POST_INSTALL_CMD := mkdir -p $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/lib64
LOCAL_POST_INSTALL_CMD += ; touch $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/lib64/libperfmgr.so
LOCAL_POST_INSTALL_CMD += ; touch $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/lib64/pixel-power-ext-V1-ndk_platform.so
LOCAL_POST_INSTALL_CMD += ; touch $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/lib64/android.hardware.power-V1-ndk_platform.so
LOCAL_POST_INSTALL_CMD += ; touch $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/lib64/vendor.lineage.power-V1-ndk_platform.so

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power-service.samsung-libperfmgr.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/init
LOCAL_MODULE_STEM := power-default-sec.rc

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power-service.samsung.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/vintf/manifest
LOCAL_MODULE_STEM := power-samsung.xml

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)
