GAPPS_VARIANT := super
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true

$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

