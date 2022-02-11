## ADB Keys
# Android
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys
# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

## Bash
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.adb.shell=/system/xbin/bash

## Custom Cameras
# river
ifneq ($(filter %river,$(TARGET_PRODUCT)),)
-include vendor/extra/oem-cameras/MotCamera2-denali/MotCamera2-denali.mk
endif

## ih8sn
PRODUCT_PACKAGES += ih8sn

ifneq ("$(wildcard  vendor/extra/configs/ih8sn/ih8sn_$(subst lineage_,,$(TARGET_PRODUCT)).conf)","")
PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_$(subst lineage_,,$(TARGET_PRODUCT)).conf:/system/etc/ih8sn.conf
else
PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_generic.conf:/system/etc/ih8sn.conf
endif


## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay
## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.recovery_update=true

## Remove Dialer Apps
ifneq ($(filter %shieldtablet %yellowstone %klimtlte,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += remove-dialer
endif

## Remove Telephony Apps
ifneq ($(filter %flo %flox %gts4lvwifi %icosa, %klimtlte,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += remove-telephony
endif

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
