## ADB Keys
# Android
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys
# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

## ATV
PRODUCT_PACKAGES += \
    DocumentsUI

## Bash
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.adb.shell=/system_ext/bin/bash

## Device-specific
ifneq ($(filter %TP1803,$(TARGET_PRODUCT)),)
# TP1803 Camera Additions
PRODUCT_PACKAGES += \
    testsig-tp1803
endif

## fastbootd
# Doesn't fit on walleye
ifeq ($(filter %taimen %walleye,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += fastbootd
PRODUCT_SYSTEM_PROPERTY_OVERRIDES += ro.fastbootd.available=true
endif

## ih8sn
PRODUCT_PACKAGES += ih8sn

#ifneq ("$(wildcard  vendor/extra/configs/ih8sn/ih8sn_$(subst lineage_,,$(TARGET_PRODUCT)).conf)","")
#PRODUCT_COPY_FILES += \
#    vendor/extra/configs/ih8sn/ih8sn_$(subst lineage_,,$(TARGET_PRODUCT)).conf:/system/etc/ih8sn.conf
#else
PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_generic.conf:/system/etc/ih8sn.conf
#endif

## Media
#PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
#    ro.config.vc_call_vol_steps=7 \
#    ro.config.media_vol_steps=25

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.recovery_update=true

## Remove Dialer Apps
ifneq ($(filter %shieldtablet %yellowstone,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += remove-dialer
endif

## Remove Telephony Apps
ifneq ($(filter %flo %flox %gts4lvwifi %icosa,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += remove-telephony
endif

## SUW
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    setupwizard.feature_deferred_snooze_allow_never=true

## Updater
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.uri="https://updater-api.oddsolutions.us/api/v1/{device}/{type}/{incr}"
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.allow_downgrading=true

## Signing
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey

ifeq ($(WITH_GMS),true)
ifneq ($(PRODUCT_IS_ATV),true)
-include vendor/google_pixel/product.mk
endif # PRODUCT_IS_ATV
endif # WITH_GMS

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    root/adb_keys \
    system/bin/ih8sn \
    system/etc/ih8sn.conf \
    system/etc/init/ih8sn.rc
