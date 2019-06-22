PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.opa.eligible_device=true

# Themes
DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/extra/overlay

DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay-lineage
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/extra/overlay-lineage

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri="https://updater.oddsolutions.us/api/v1/{device}/{type}/{incr}"

# Android ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys

# Recovery ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

ifneq ($(filter %berkeley,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    HwCamera2

PRODUCT_COPY_FILES := \
    vendor/extra/HwCamera2/lib/arm/libfyusenet.so:system/priv-app/HwCamera2/lib/arm/libfyusenet.so \
    vendor/extra/HwCamera2/lib/arm/libgif_maker.so:system/priv-app/HwCamera2/lib/arm/libgif_maker.so \
    vendor/extra/HwCamera2/lib/arm/libHW_Pano_f.so:system/priv-app/HwCamera2/lib/arm/libHW_Pano_f.so \
    vendor/extra/HwCamera2/lib/arm/libHwPostCamera_jni.so:system/priv-app/HwCamera2/lib/arm/libHwPostCamera_jni.so \
    vendor/extra/HwCamera2/lib/arm/libIvw35.so:system/priv-app/HwCamera2/lib/arm/libIvw35.so \
    vendor/extra/HwCamera2/lib/arm/libjni_front_panorama_beauty_hidl.so:system/priv-app/HwCamera2/lib/arm/libjni_front_panorama_beauty_hidl.so \
    vendor/extra/HwCamera2/lib/arm/libjni_front_panorama_camera2.so:system/priv-app/HwCamera2/lib/arm/libjni_front_panorama_camera2.so \
    vendor/extra/HwCamera2/lib/arm/libjni_mrc_cg_filters_camera2.so:system/priv-app/HwCamera2/lib/arm/libjni_mrc_cg_filters_camera2.so \
    vendor/extra/HwCamera2/lib/arm/libJniVoiceCapture.so:system/priv-app/HwCamera2/lib/arm/libJniVoiceCapture.so \
    vendor/extra/HwCamera2/lib/arm/libmorpho_memory_allocator.so:system/priv-app/HwCamera2/lib/arm/libmorpho_memory_allocator.so \
    vendor/extra/HwCamera2/lib/arm/libmorpho_panorama_gp.so:system/priv-app/HwCamera2/lib/arm/libmorpho_panorama_gp.so \
    vendor/extra/HwCamera2/lib/arm/libscanner.so:system/priv-app/HwCamera2/lib/arm/libscanner.so \
    vendor/extra/HwCamera2/lib/arm/libTargetTracking.so:system/priv-app/HwCamera2/lib/arm/libTargetTracking.so \
    vendor/extra/HwCamera2/lib/arm/libtrack.so:system/priv-app/HwCamera2/lib/arm/libtrack.so \
    vendor/extra/HwCamera2/lib/arm/vendor.huawei.hardware.camera.cfgsvr@1.0.so:system/priv-app/HwCamera2/lib/arm/vendor.huawei.hardware.camera.cfgsvr@1.0.so \
    vendor/extra/HwCamera2/lib/arm/vendor.huawei.hardware.camera.cfgsvr@1.1.so:system/priv-app/HwCamera2/lib/arm/vendor.huawei.hardware.camera.cfgsvr@1.1.so
endif

ifneq ($(filter %nash,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    MotCamera2
endif

EXCLUDE_GOOGLE_SERVICES_DEVICES += \
    %hammerhead \
    %jfltexx \
    %foster \
    %fugu \
    %tv_molly

ifneq ($(filter $(EXCLUDE_GOOGLE_SERVICES_DEVICES),$(TARGET_PRODUCT)),)
DISABLE_GAPPS := true
endif

ifneq ($(DISABLE_GAPPS),true)
-include vendor/google_pixel/product.mk
endif # Disable GApps
