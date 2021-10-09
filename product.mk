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

## Debugging
ifeq ($(filter %foster %foster_tab %porg %porg_tab %sif %sphynx %nx %nx_tab,$(TARGET_PRODUCT)),)
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += log.tag=I
endif
endif

## ih8sn
PRODUCT_PACKAGES += ih8sn

PRODUCT_COPY_FILES += \
    vendor/extra/configs/ih8sn/ih8sn_generic.conf:/system/etc/ih8sn.conf
## Logging
$(call soong_config_set,liblog,force_debuggable,true)

## neofetch
PRODUCT_COPY_FILES += \
    vendor/extra/tools/neofetch:$(TARGET_COPY_OUT_SYSTEM_EXT)/bin/neofetch

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.vendor.recovery_update=true
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.vendor.recovery_allow_spl_downgrade=true

## SUW
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    setupwizard.feature_deferred_snooze_allow_never=true

ifeq ($(WITH_GMS),true)
ifneq ($(PRODUCT_IS_ATV),true)
ifneq ($(PRODUCT_IS_AUTOMOTIVE),true)
$(call inherit-product, vendor/google_pixel/products/google_pixel.mk)
endif # PRODUCT_IS_AUTOMOTIVE
endif # PRODUCT_IS_ATV
endif # WITH_GMS

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    root/adb_keys \
    system/bin/ih8sn \
    system/etc/ih8sn.conf \
    system/etc/init/ih8sn.rc

# Enable whole-program R8 Java optimizations for SystemUI and system_server,
# but also allow explicit overriding for testing and development.
SYSTEM_OPTIMIZE_JAVA ?= true
SYSTEMUI_OPTIMIZE_JAVA ?= true

# Preopt SystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += SystemUI Settings

# Compile SystemUI on device with `speed`.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.systemuicompilerfilter=speed

