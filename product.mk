## ADB Keys

# Android
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys

# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

## Bash
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.adb.shell=/system_ext/bin/bash

## ih8sn
PRODUCT_PACKAGES += ih8sn

#ifneq ("$(wildcard  vendor/extra/configs/ih8sn/ih8sn_$(subst lineage_,,$(TARGET_PRODUCT)).conf)","")
#PRODUCT_COPY_FILES += \
#    vendor/extra/configs/ih8sn/ih8sn_$(subst lineage_,,$(TARGET_PRODUCT)).conf:/system/etc/ih8sn.conf
#else
PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_generic.conf:/system/etc/ih8sn.conf
#endif

## neofetch
PRODUCT_COPY_FILES += \
    vendor/extra/tools/neofetch:$(TARGET_COPY_OUT_SYSTEM_EXT)/bin/neofetch

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.vendor.recovery_update=true

## SUW
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    setupwizard.feature_deferred_snooze_allow_never=true

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
