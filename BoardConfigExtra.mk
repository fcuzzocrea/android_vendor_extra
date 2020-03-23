# Fonts
ifneq ($(BOARD_HAS_LARGE_FILESYSTEM),true)
    SMALLER_FONT_FOOTPRINT := true
endif

# Product
ifneq ($(filter %bonito %sargo %crosshatch %blueline %flame %coral,$(TARGET_PRODUCT)),)
    TARGET_COPY_OUT_PRODUCT := product
else
    TARGET_COPY_OUT_PRODUCT := system/product
endif

## Signing
#ifeq ($(BOARD_AVB_ENABLE),true)
#BOARD_AVB_ALGORITHM := SHA256_RSA4096
#BOARD_AVB_KEY_PATH := vendor/certs/avb.pem
#ifneq ($(BOARD_AVB_SYSTEM_ROLLBACK_INDEX),)
#BOARD_AVB_SYSTEM_ALGORITHM := SHA256_RSA4096
#BOARD_AVB_SYSTEM_KEY_PATH := vendor/certs/avb.pem
#endif # BOARD_AVB_SYSTEM_ROLLBACK_INDEX
#endif # BOARD_AVB_ENABLE
