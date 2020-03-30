## ADB Keys
# Android
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys
# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

## Custom Cameras
# river
ifneq ($(filter %river,$(TARGET_PRODUCT)),)
-include vendor/extra/oem-cameras/MotCamera2-denali/MotCamera2-denali.mk
endif

## Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

## OpenWeatherProvider
PRODUCT_PACKAGES += OpenWeatherProviderPrebuilt

## Updater
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.uri="https://updater.oddsolutions.us/api/v1/{device}/{type}/{incr}"
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.ota.allow_downgrade=true

## Signing
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
#PRODUCT_VERITY_SIGNING_KEY := vendor/certs/verity

ifeq ($(WITH_GMS),true)
-include vendor/google_pixel/product.mk
endif # WITH_GMS
