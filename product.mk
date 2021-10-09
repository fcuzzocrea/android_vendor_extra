# ADB Keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys

# Bash
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.sys.adb.shell=/system_ext/bin/bash

# Debugging
ifeq ($(filter %foster %foster_tab %sif %sphynx %nx %nx_tab,$(TARGET_PRODUCT)),)
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_SYSTEM_EXT_PROPERTIES += log.tag=I
endif
endif

# ih8sn
PRODUCT_PACKAGES += ih8sn

PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_generic.conf:/system/etc/ih8sn.conf

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/ih8sn \
    system/etc/ih8sn.conf \
    system/etc/init/ih8sn.rc

# neofetch
PRODUCT_COPY_FILES += \
    vendor/extra/tools/neofetch:$(TARGET_COPY_OUT_SYSTEM_EXT)/bin/neofetch

# Overlays
ifeq ($(PRODUCT_IS_ATV),true)
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay-tv
else
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay
endif

# Recovery
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys
    
# Root by default
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/adbroot_onboot.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/adbroot_onboot.rc

# System Artifact Allowances
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    root/adb_keys

# SUW
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    setupwizard.feature_deferred_snooze_allow_never=true

