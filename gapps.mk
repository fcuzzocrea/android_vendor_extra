LOCAL_PATH := $(call my-dir)

GAPPS_VARIANT := super
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true

$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

ifneq ($(filter msm8996 msm8998,$(TARGET_BOARD_PLATFORM)),)
PRODUCT_PACKAGES += GoogleCam
endif # msm8996 msm8998
