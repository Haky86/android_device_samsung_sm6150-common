#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020 The LineageOS Project

LOCAL_PATH := hardware/samsung/hidl/sensors/2.1

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.sensors@2.1-service.sm6150-multihal
LOCAL_MODULE_STEM := android.hardware.sensors@2.1-service.samsung-multihal
LOCAL_MODULE_TAGS  := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SRC_FILES := \
    service.cpp \
    HalProxy.cpp \
    HalProxyCallback.cpp

LOCAL_REQUIRED_MODULES := \
    android.hardware.sensors@2.1-service.samsung-multihal.rc \
    android.hardware.sensors@2.1-samsung-multihal.xml

LOCAL_HEADER_LIBRARIES := \
    android.hardware.sensors@2.X-shared-utils

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libcutils \
    libfmq \
    libhidlbase \
    liblog \
    libpower \
    libutils \
    libhidltransport \
    android.hardware.sensors@2.0 \
    android.hardware.sensors@2.0-ScopedWakelock \
    android.hardware.sensors@2.1

LOCAL_STATIC_LIBRARIES := \
    android.hardware.sensors@1.0-convert \
    android.hardware.sensors@2.X-multihal

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.sensors@2.1-service.samsung-multihal.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/init
LOCAL_MODULE_STEM := android.hardware.sensors@2.0-service-multihal.rc

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.sensors@2.1-samsung-multihal.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/vintf/manifest

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)
