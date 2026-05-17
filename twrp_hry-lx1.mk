# Release name
PRODUCT_RELEASE_NAME := hry-lx1

# Inherit from TWRP common
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/hry-lx1/device.mk)

## Device identifier
PRODUCT_DEVICE     := hry-lx1
PRODUCT_NAME       := twrp_hry-lx1
PRODUCT_BRAND      := HUAWEI
PRODUCT_MODEL      := HRY-LX1
PRODUCT_MANUFACTURER := HUAWEI

# Build fingerprint — match stock firmware to avoid Widevine issues
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=HRY-LX1 \
    PRODUCT_NAME=HRY-LX1 \
    BUILD_PRODUCT=HRY-LX1
