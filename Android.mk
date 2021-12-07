LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
include $(SDK_DIR)/Android.def

LOCAL_MODULE    := libnerc_ntp_diff
LOCAL_MODULE_TAGS := optional

ifeq (1,$(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= 26 ))" )))
LOCAL_PROPRIETARY_MODULE := true
endif

#LOCAL_C_INCLUDES := $(UNF_DIR) \
#                    $(DRV_DIR)/include

LOCAL_CFLAGS := $(CFG_HI_CFLAGS) $(CFG_HI_BOARD_CONFIGS)
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-unused-variable \
                -Wno-format-extra-args -Wno-writable-strings -Wno-unused-function \
                 -fshort-enums

LOCAL_CFLAGS += -DANDROID_NDK

LOCAL_SRC_FILES := nerc_ntp_diff.c

LOCAL_SHARED_LIBRARIES := liblog libcutils 

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/export_headers

LOCAL_PRELINK_MODULE := false
include $(BUILD_STATIC_LIBRARY)