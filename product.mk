# Blur
PRODUCT_PACKAGES += \
    libuiblur \
    Blur

ifeq ($(TARGET_HAVE_UI_BLUR),true)
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
