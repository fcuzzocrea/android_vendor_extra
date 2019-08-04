## ADB Keys
# Android
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys
# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

## Custom Cameras
# berkeley
ifneq ($(filter %berkeley,$(TARGET_PRODUCT)),)
-include vendor/extra/oem-cameras/HwCamera2/HwCamera2.mk
endif
# nash
ifneq ($(filter %nash,$(TARGET_PRODUCT)),)
-include vendor/extra/oem-cameras/MotCamera2/MotCamera2.mk
endif

## Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

## Updater
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.uri="https://updater.oddsolutions.us/api/v1/{device}/{type}/{incr}"

## Signing
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
PRODUCT_VERITY_SIGNING_KEY := vendor/certs/verity

## Themes
DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/extra/overlay

DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay-lineage
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/extra/overlay-lineage

EXCLUDE_GOOGLE_SERVICES_DEVICES += \
    %flo \
    %foster \
    %fugu \
    %hammerhead \
    %jfltexx \
    %m8 \
    %m8d \
    %molly \
    %tv_molly

ifeq ($(WITH_GMS),true)
-include vendor/google_pixel/product.mk
endif # Disable GApps
