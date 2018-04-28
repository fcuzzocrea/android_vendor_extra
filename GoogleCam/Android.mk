LOCAL_PATH := $(call my-dir)

GOOGLE_CAM_LIBRARIES := \
    libAndroidJniUtilsJni \
    libJniUtilsJni \
    libadsprpc_app_N \
    libfacebeautification \
    libfilterframework_jni \
    libgcam \
    libgcam_swig_jni \
    libgyrostabilization-jni \
    libhalide_hexagon_host_app \
    libjni_faceutil \
    libjni_imgutil \
    libjni_yuvutil \
    liblensoffsetcalculation-jni \
    liblightcycle \
    librefocus \
    libsmartburst-jni \
    libvision_face_jni

define define-google-cam-lib
include $$(CLEAR_VARS)
LOCAL_MODULE := $1
LOCAL_MODULE_OWNER := google
LOCAL_SRC_FILES := lib/arm64/$1.so
LOCAL_STRIP_MODULE := false
LOCAL_MULTILIB := 64
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
include $$(BUILD_PREBUILT)
endef

$(foreach lib,$(GOOGLE_CAM_LIBRARIES),\
    $(eval $(call define-google-cam-lib,$(lib))))

include $(CLEAR_VARS)
LOCAL_MODULE := libhalide_hexagon_host
LOCAL_MODULE_OWNER := google
LOCAL_SRC_FILES := lib/arm/libhalide_hexagon_host.so
LOCAL_STRIP_MODULE := false
LOCAL_MULTILIB := 32
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_VENDOR_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libhalide_hexagon_remote_skel
LOCAL_MODULE_OWNER := google
LOCAL_SRC_FILES := lib/arm/libhalide_hexagon_remote_skel.so
LOCAL_STRIP_MODULE := false
LOCAL_MULTILIB := 32
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_RELATIVE_PATH := adsp_camera
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := GoogleCam
LOCAL_MODULE_OWNER := google
LOCAL_SRC_FILES := GoogleCam.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_SUFFIX := .apk
LOCAL_PRIVILEGED_MODULE := true
LOCAL_REQUIRED_MODULES := libhalide_hexagon_host libhalide_hexagon_remote_skel
LOCAL_JNI_SHARED_LIBRARIES := \
    $(GOOGLE_CAM_LIBRARIES) \
    libjni_jpegutil \
    libnativehelper_compat_libc++ \
    librsjni

include $(BUILD_PREBUILT)
