LOCAL_PATH := $(call my-dir)

STOCK_GAPPS_DEVICES += \
    %berkeley \
    %ether \
    %nash

CUSTOM_GAPPS_DEVICES += \
    %shamu

NANO_GAPPS_DEVICES += \
    %bacon \
    %jfltevzw \
    %molly

EXCLUDE_GAPPS_DEVICES += \
    %flo \
    %foster \
    %fugu \
    %m8 \
    %tv_molly

GAPPS_DEVICES += \
    $(STOCK_GAPPS_DEVICES) \
    $(CUSTOM_GAPPS_DEVICES) \
    $(NANO_GAPPS_DEVICES) \
    $(PIXEL_CODENAMES)

ifneq ($(filter $(PIXEL_CODENAMES),$(TARGET_PRODUCT)),)
GAPPS_VARIANT := stock
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true
endif # Pixel GApps

ifneq ($(filter $(STOCK_GAPPS_DEVICES),$(TARGET_PRODUCT)),)
GAPPS_VARIANT := stock
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true
GAPPS_EXCLUDED_PACKAGES += \
    GoogleCamera \
    Turbo
endif # Stock GApps

ifneq ($(filter $(CUSTOM_GAPPS_DEVICES),$(TARGET_PRODUCT)),)
GAPPS_VARIANT := stock
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true
GAPPS_EXCLUDED_PACKAGES := GoogleCamera
GAPPS_EXCLUDED_PACKAGES += \
    Maps \
    Hangouts \
    EditorSheets \
    YouTube \
    PlusOne \
    EditorDocs \
    Drive \
    FitnessPrebuilt \
    PrebuiltKeep \
    Books \
    PlayGames \
    Videos \
    EditorSlides \
    Turbo
endif # Custom GApps

ifneq ($(filter $(NANO_GAPPS_DEVICES),$(TARGET_PRODUCT)),)
GAPPS_VARIANT := nano
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true
endif # Nano GApps

ifneq ($(filter $(GAPPS_DEVICES),$(TARGET_PRODUCT)),)
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)
endif # GApps Inclusion
