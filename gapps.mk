LOCAL_PATH := $(call my-dir)

STOCK_GAPPS_DEVICES += \
    %berkeley \
    %ether \
    %nash

NANO_GAPPS_DEVICES += \
    %bacon \
    %hlte \
    %hltetmo \
    %molly

PICO_GAPPS_DEVICES += \
    %jfltevzw \
    %jfltexx \
    %yellowstone

MOST_GAPPS_DEVICES += \
    %shamu

FLASH_GAPPS_DEVICES += \
    %flo

EXCLUDE_GOOGLE_SYSUI_DEVICES += \
    %foster \
    %fugu \
    %tv_molly

GAPPS_DEVICES += \
    $(STOCK_GAPPS_DEVICES) \
    $(MOST_GAPPS_DEVICES) \
    $(NANO_GAPPS_DEVICES) \
    $(PICO_GAPPS_DEVICES) \
    $(PIXEL_CODENAMES)

ifneq ($(filter $(EXCLUDE_GOOGLE_SYSUI_DEVICES),$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    FDroid \
    FDroid-Privledged
endif

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
    Turbo \
    MarkupGoogle
endif # Stock GApps

ifneq ($(filter $(MOST_GAPPS_DEVICES),$(TARGET_PRODUCT)),)
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
    Turbo \
    MarkupGoogle
endif # Most GApps

ifneq ($(filter $(NANO_GAPPS_DEVICES),$(TARGET_PRODUCT)),)
GAPPS_VARIANT := nano
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true
GAPPS_EXCLUDED_PACKAGES += \
    MarkupGoogle \
    Turbo
endif # Nano GApps

ifneq ($(filter $(PICO_GAPPS_DEVICES),$(TARGET_PRODUCT)),)
GAPPS_VARIANT := pico
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true
GAPPS_EXCLUDED_PACKAGES += \
    CalSync \
    DialerFramework \
    BatteryUsage \
    FaceDetect \
    FaceUnlock \
    MarkupGoogle \
    Speech \
    Wellbeing \
    PixelLauncherIcons \
    GoogleTTS \
    Wallpapers \
    Turbo \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    CompanionDeviceManager \
    GoogleFeedback \
    MarkupGoogle
endif # Pico GApps

ifneq ($(filter $(GAPPS_DEVICES),$(TARGET_PRODUCT)),)
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)
endif # GApps Inclusion
