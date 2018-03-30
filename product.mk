# Blur
PRODUCT_PACKAGES += \
    libuiblur \
    Blur

ifeq ($(TARGET_HAVE_QC_PERF),true)
# QC ART
PRODUCT_PACKAGES += \
    libqc-art \
    libqc-art-compiler

# QC Perf
PRODUCT_PACKAGES += \
    libqc-opt

# QC Skia
PRODUCT_PACKAGES += \
    libqc-skia
endif

PRODUCT_PACKAGES += auditd

# Disable package cache on all builds
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lineage-package_cache.rc:system/etc/init/lineage-package_cache.rc

PRODUCT_PROPERTY_OVERRIDES += ro.opa.eligible_device=true

# Themes
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.boot.vendor.overlay.theme=com.google.android.theme.pixel
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.com.google.ime.theme_id=5
PRODUCT_PACKAGES += \
    PixelTheme

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=18

$(call prepend-product-if-exists, vendor/rashed/product.mk)
ifneq ($(DISABLE_GAPPS),true)
$(call prepend-product-if-exists, vendor/extra/gapps.mk)
endif
