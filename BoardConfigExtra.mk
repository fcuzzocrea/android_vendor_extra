# Product
ifndef TARGET_COPY_OUT_PRODUCT
    TARGET_COPY_OUT_PRODUCT := system/product
endif

# Recovery
#BOARD_USES_FULL_RECOVERY_IMAGE ?= true

# System_ext
ifndef TARGET_COPY_OUT_SYSTEM_EXT
    TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext
endif

## SELinux
PRODUCT_PRIVATE_SEPOLICY_DIRS += vendor/extra/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += vendor/extra/sepolicy/vendor
