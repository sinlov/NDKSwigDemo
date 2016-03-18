LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog -lm
LOCAL_MODULE := SeePlusPlus
LOCAL_SRC_FILES := SeePlusPlus.cpp

# FIXME use swig generate by Android.mk but my-swig-generate.mk is failure
# MY_SWIG_PACKAGE = com.sinlov.jni.core
# MY_SWIG_INTERFACES = SeePlusPlus.i
# MY_SWIG_TYPE := cxx
# include $(LOCAL_PATH)/my-swig-generate.mk

include $(BUILD_SHARED_LIBRARY)