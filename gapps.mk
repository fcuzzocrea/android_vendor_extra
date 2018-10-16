LOCAL_PATH := $(call my-dir)

GAPPS_VARIANT := stock
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true

$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

GAPPS_PIXEL2017_CODENAMES += \
    %muskie \
    %taimen \
    %wahoo \
    %walleye

GAPPS_PIXEL2018_CODENAMES += \
    %albacore \
    %blueline \
    %crosshatch

GAPPS_PIXEL_AMBIENT_CODENAMES += \
    $(GAPPS_PIXEL2017_CODENAMES) \
    $(GAPPS_PIXEL2018_CODENAMES)

# Build ambient listening on Pixel 2017 and Pixel 2018 devices
ifneq ($(filter $(GAPPS_PIXEL_AMBIENT_CODENAMES),$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += AmbientSensePrebuilt

PRODUCT_COPY_FILES += \
    vendor/extra/ambient/etc/ambient/matcher_tah.leveldb:system/etc/ambient/matcher_tah.leveldb \
    vendor/extra/ambient/etc/firmware/dnd.descriptor:system/etc/firmware/dnd.descriptor \
    vendor/extra/ambient/etc/firmware/dnd.sound_model:system/etc/firmware/dnd.sound_model \
    vendor/extra/ambient/etc/firmware/music_detector.descriptor:system/etc/firmware/music_detector.descriptor \
    vendor/extra/ambient/etc/firmware/music_detector.sound_model:system/etc/firmware/music_detector.sound_model \
    vendor/extra/ambient/etc/permissions/AmbientSensePrebuilt.xml:system/etc/permissions/AmbientSensePrebuilt.xml
endif
