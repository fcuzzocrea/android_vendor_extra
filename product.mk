## ADB Keys
# Android
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys
# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

## Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

## OpenWeatherProvider
PRODUCT_PACKAGES += OpenWeatherProviderPrebuilt

## Pixel Theme
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_PACKAGES += \
    PixelTheme

## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.recovery_update=true

## Remove Dialer Apps
ifneq ($(filter %shieldtablet %yellowstone,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += remove-dialer
endif

## Remove Telephony Apps
ifneq ($(filter %flo %gts4lvwifi %icosa,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += remove-telephony
endif

## Updater
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.uri="https://updater-api.oddsolutions.us/api/v1/{device}/{type}/{incr}"
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.allow_downgrading=true

## Signing
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
