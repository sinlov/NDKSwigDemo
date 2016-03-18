# For Android Build System config
#
# @author sinlov
#
# FIXME this generate is failure

# Check MY_SWIG_PACKAGE define
ifndef MY_SWIG_PACKAGE
  $(error MY_SWIG_PACKAGE is not defined.)
endif

# replace . to /
MY_SWIG_OUTDIR := $(NDK_PROJECT_PATH)/src/$(subst .,/,$(MY_SWIG_PACKAGE))

# SWIG default mode is C
ifndef MY_SWIG_TYPE
  MY_SWIG_TYPE := c
endif

# #setting swig mode.
ifeq ($(MY_SWIG_TYPE),cxx)
  MY_SWIG_MODE := - c++
else
  MY_SWIG_MODE :=
endif

# add cxx resource for swig.
LOCAL_SRC_FILES+= $(foreach MY_SWIG_INTERFACE,\
  $(MY_SWIG_INTERFACES),\
  $(basename $(MY_SWIG_INTERFACE))_wrap.$(MY_SWIG_TYPE))

# add extension name .cxx for c++ code.
LOCAL_CPP_EXTENSION+ = .cxx

# build code by swig (indention should be tabs for this block)
%_wrap.$(MY_SWIG_TYPE) : %.i
    $(call host-mkdir,$(MY_SWIG_OUTDIR))
    swig $(MY_SWIG_MODE) \
    -java \
    -package $(MY_SWIG_PACKAGE) \
    -outdir $(MY_SWIG_OUTDIR) \
    $<