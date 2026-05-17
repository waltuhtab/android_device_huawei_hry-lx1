#
# device.mk
# Device: Honor 10 Lite (HRY-LX1)
#

LOCAL_PATH := device/huawei/hry-lx1

# Init scripts needed in recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/etc/init/init.recovery.huawei.rc:recovery/root/vendor/etc/init/init.recovery.huawei.rc \
    $(LOCAL_PATH)/recovery/root/vendor/etc/init/init.recovery.hi1102.rc:recovery/root/vendor/etc/init/init.recovery.hi1102.rc \
    $(LOCAL_PATH)/recovery/root/vendor/etc/init/init.recovery.hi1102a.rc:recovery/root/vendor/etc/init/init.recovery.hi1102a.rc

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/etc/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/etc/fstab.kirin710:recovery/root/etc/fstab.kirin710

# TEE blobs needed for decryption in recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/libteec_vendor.so:recovery/root/vendor/lib64/libteec_vendor.so \
    $(LOCAL_PATH)/prebuilt/libteec.so:recovery/root/system/lib64/libteec.so

# API level
PRODUCT_SHIPPING_API_LEVEL := 28

# Enforce VNDK
PRODUCT_USE_VNDK_OVERRIDE := false
