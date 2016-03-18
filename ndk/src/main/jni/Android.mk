LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog -lm
LOCAL_MODULE := SeePlusPlus
LOCAL_SRC_FILES := SeePlusPlus.cpp

include $(BUILD_SHARED_LIBRARY)