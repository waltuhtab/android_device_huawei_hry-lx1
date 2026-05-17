#
# BoardConfig.mk
# Device: Honor 10 Lite (HRY-LX1)
# SoC:    HiSilicon Kirin 710
# GPU:    ARM Mali-G51 MP4
#

LOCAL_PATH := device/huawei/hry-lx1

# =============================================================================
# Platform
# =============================================================================
TARGET_BOARD_PLATFORM            := kirin710
TARGET_BOOTLOADER_BOARD_NAME     := kirin710

TARGET_ARCH                      := arm64
TARGET_ARCH_VARIANT              := armv8-a
TARGET_CPU_ABI                   := arm64-v8a
TARGET_CPU_ABI2                  :=
TARGET_CPU_VARIANT               := cortex-a73

TARGET_2ND_ARCH                  := arm
TARGET_2ND_ARCH_VARIANT          := armv8-a
TARGET_2ND_CPU_ABI               := armeabi-v7a
TARGET_2ND_CPU_ABI2              := armeabi
TARGET_2ND_CPU_VARIANT           := cortex-a53

TARGET_USES_64_BIT_BINDER        := true

# =============================================================================
# Kernel
# =============================================================================
TARGET_PREBUILT_KERNEL           := $(LOCAL_PATH)/prebuilt/Image.gz
# NOTE: Replace with your extracted kernel image from boot.img
# To extract: unpack boot.img with magiskboot or AIK, grab the Image.gz

BOARD_KERNEL_BASE                := 0x00400000
BOARD_KERNEL_PAGESIZE            := 2048
BOARD_KERNEL_OFFSET              := 0x00080000
BOARD_RAMDISK_OFFSET             := 0x07b88000
BOARD_SECOND_OFFSET              := 0x00e00000
BOARD_TAGS_OFFSET                := 0x07988000

BOARD_KERNEL_CMDLINE             := loglevel=4 initcall_debug=n page_tracker=on \
                                    unmovable_isolate1=2:192M,3:224M,4:256M \
                                    printktimer=0xfff0a000,0x534,0x538 \
                                    androidboot.selinux=enforcing

BOARD_MKBOOTIMG_ARGS             += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS             += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS             += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS             += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS             += --pagesize $(BOARD_KERNEL_PAGESIZE)

# =============================================================================
# Partitions
# NOTE: Verify exact sizes from fstab.kirin710 on your device.
# These are typical HRY-LX1 values — do not assume they are correct.
# =============================================================================
BOARD_BOOTIMAGE_PARTITION_SIZE           := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE       := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE         := 3925868544
BOARD_VENDORIMAGE_PARTITION_SIZE         := 671088640
BOARD_CACHEIMAGE_PARTITION_SIZE          := 134217728
BOARD_USERDATAIMAGE_PARTITION_SIZE       := 55834574848

BOARD_FLASH_BLOCK_SIZE                   := 4096
TARGET_USERIMAGES_USE_EXT4               := true
TARGET_USERIMAGES_USE_F2FS               := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE        := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE       := ext4
TARGET_COPY_OUT_VENDOR                   := vendor

# =============================================================================
# Display
# =============================================================================
TARGET_SCREEN_HEIGHT                     := 1560
TARGET_SCREEN_WIDTH                      := 720

# =============================================================================
# Recovery / TWRP
# =============================================================================
TARGET_RECOVERY_FSTAB                    := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab
BOARD_HAS_LARGE_FILESYSTEM               := true
BOARD_HAS_NO_SELECT_BUTTON               := true
TARGET_RECOVERY_PIXEL_FORMAT             := BGRA_8888
TARGET_USES_MKE2FS                       := true

# TWRP-specific flags
TW_THEME                                 := portrait_hdpi
TW_SCREEN_BLANK_ON_BOOT                  := true
TW_INPUT_BLACKLIST                       := "hbtp_vm"
TW_USE_TOOLBOX                           := true
TW_EXTRA_LANGUAGES                       := true
TW_INCLUDE_NTFS_3G                       := true
RECOVERY_SDCARD_ON_DATA                  := true

TW_BRIGHTNESS_PATH                       := /sys/class/leds/lcd_backlight0/brightness
TW_MAX_BRIGHTNESS                        := 255
TW_DEFAULT_BRIGHTNESS                    := 128

TW_NO_SCREEN_BLANK                       := false
TW_NO_HAPTICS                            := false

# Internal storage
TW_INTERNAL_STORAGE_PATH                 := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT         := "data"
TW_EXTERNAL_STORAGE_PATH                 := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT         := "external_sd"

# =============================================================================
# Encryption
# FBE is confirmed on this device (EMUI 10 / Android 10)
# TEE stack: libteec @3.0 — must be running for decrypt to work
# =============================================================================
TW_INCLUDE_CRYPTO                        := true
TW_INCLUDE_CRYPTO_FBE                    := true
TW_INCLUDE_FBE_METADATA_DECRYPT         := true
BOARD_USES_QCOM_FBE_DECRYPTION          := false

# Security patch — set to match your firmware's actual patch level
PLATFORM_VERSION                         := 10
PLATFORM_VERSION_LAST_STABLE            := 10
PLATFORM_SECURITY_PATCH                  := 2021-06-01
VENDOR_SECURITY_PATCH                    := 2021-06-01
BOOT_SECURITY_PATCH                      := 2021-06-01

# =============================================================================
# SELinux — use precompiled policy from vendor
# =============================================================================
SELINUX_IGNORE_NEVERALLOWS               := true
BOARD_PLAT_PRIVATE_SEPOLICY_DIR          += $(LOCAL_PATH)/sepolicy/private
BOARD_SEPOLICY_DIRS                      += $(LOCAL_PATH)/sepolicy/vendor

# =============================================================================
# VNDK / Treble
# =============================================================================
BOARD_VNDK_VERSION                       := 29

# =============================================================================
# Verified Boot — disabled for custom recovery
# =============================================================================
BOARD_AVB_ENABLE                         := false
