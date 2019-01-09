PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.opa.eligible_device=true

# Themes
DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/extra/overlay

DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay-lineage
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/extra/overlay-lineage

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri="http://updater.oddsolutions.us/api/v1/{device}/{type}/{incr}"

-include vendor/google_pixel/product.mk

ifneq ($(DISABLE_GAPPS),true)
-include vendor/extra/gapps.mk
endif # Disable GApps
