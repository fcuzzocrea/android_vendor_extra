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

PRODUCT_PROPERTY_OVERRIDES += ro.opa.eligible_device=true

$(call prepend-product-if-exists, vendor/rashed/product.mk)
