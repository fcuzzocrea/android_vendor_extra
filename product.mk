## ADB
# Android
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys
# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys
# Root by default
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/adbroot_onboot.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/adbroot_onboot.rc
# System Artifact Allowances
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    root/adb_keys

## ATV
PRODUCT_PACKAGES += \
    DocumentsUI

## Bash
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.sys.adb.shell=/system_ext/bin/bash

## Debugging
ifeq ($(filter %foster %foster_tab %sif %sphynx %nx %nx_tab,$(TARGET_PRODUCT)),)
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_SYSTEM_EXT_PROPERTIES += log.tag=I
endif
endif

## Device-specific
ifneq ($(filter %TP1803,$(TARGET_PRODUCT)),)
# TP1803 Camera Additions
PRODUCT_PACKAGES += \
    testsig-0x7b401d7c
endif
# sif ADB over Wi-Fi/Ethernet
ifneq ($(filter %baracus %baracus_tab %sif,$(TARGET_PRODUCT)),)
PRODUCT_SYSTEM_EXT_PROPERTIES += service.adb.tcp.port=5555
endif

## fastbootd
# Doesn't fit on walleye
ifeq ($(filter %taimen %walleye,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += fastbootd
PRODUCT_SYSTEM_EXT_PROPERTIES += ro.fastbootd.available=true
endif

## ih8sn
PRODUCT_PACKAGES += ih8sn

PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_generic.conf:/system/etc/ih8sn.conf

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/ih8sn \
    system/etc/ih8sn.conf \
    system/etc/init/ih8sn.rc

## neofetch
PRODUCT_COPY_FILES += \
    vendor/extra/tools/neofetch:$(TARGET_COPY_OUT_SYSTEM_EXT)/bin/neofetch

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

## Recovery
PRODUCT_SYSTEM_EXT_PROPERTIES += persist.vendor.recovery_update=true
PRODUCT_SYSTEM_EXT_PROPERTIES += persist.vendor.recovery_allow_spl_downgrade=true

## SUW
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    setupwizard.feature_deferred_snooze_allow_never=true

## Updater
PRODUCT_SYSTEM_EXT_PROPERTIES += lineage.updater.uri="https://updater-api.oddsolutions.us/api/v1/{device}/{type}/{incr}"
PRODUCT_SYSTEM_EXT_PROPERTIES += lineage.updater.allow_downgrading=true
PRODUCT_SYSTEM_EXT_PROPERTIES += lineage.updater.allow_major_upgrades
