#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/samsung/r8q-common

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Platform
PRODUCT_PLATFORM := kona
TARGET_BOARD_PLATFORM := kona
TARGET_BOOTLOADER_BOARD_NAME := kona

TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Kernel config
TARGET_KERNEL_SOURCE        := kernel/samsung/sm8250
TARGET_KERNEL_CONFIG        := vendor/lineage_r8q_defconfig
TARGET_KERNEL_CLANG_PATH    := $(shell pwd)/prebuilts/clang/host/$(HOST_OS)-x86/clang-r416183b
TARGET_KERNEL_ARCH          := arm64
TARGET_KERNEL_HEADER_ARCH   := arm64
TARGET_LINUX_KERNEL_VERSION := 4.19

# Kernel flags
BOARD_KERNEL_IMAGE_NAME        := Image
BOARD_BOOT_HEADER_VERSION      := 2
BOARD_KERNEL_SEPARATED_DTBO    := true
BOARD_INCLUDE_DTB_IN_BOOTIMG   := true
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc OEM_TARGET_PRODUCT=$(PRODUCT_DEVICE)

BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 printk.devkmsg=on firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_DTB_OFFSET           := 0x01F00000
BOARD_KERNEL_BASE          := 0x00000000
BOARD_KERNEL_OFFSET        := 0x00008000    
BOARD_KERNEL_PAGESIZE      := 4096
BOARD_KERNEL_TAGS_OFFSET   := 0x01E00000
BOARD_RAMDISK_OFFSET       := 0x02000000
BOARD_KERNEL_SECOND_OFFSET := 0x00F00000

# Kernel: mkbootimgs args
BOARD_MKBOOTIMG_ARGS =  --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --dtb_offset $(BOARD_DTB_OFFSET) --pagesize $(BOARD_KERNEL_PAGESIZE) --header_version $(BOARD_BOOT_HEADER_VERSION) --board $(BOARD_NAME) --kernel_offset $(BOARD_KERNEL_OFFSET) --second_offset $(BOARD_KERNEL_SECOND_OFFSET)

# Additional root folders
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

BOARD_ROOT_EXTRA_FOLDERS += \
    carrier \
    efs \
    keydata \
    keyrefuge \
    metadata \
    misc \
    omr \
    optics \
    prism \
    spu

# File systems
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE      := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE    := ext4

BOARD_USES_METADATA_PARTITION        := true
TARGET_USERIMAGES_USE_F2FS           := true
TARGET_USERIMAGES_USE_EXT4           := true

# Partition sizes, obtained with blockdev --getsize64
BOARD_DTBOIMG_PARTITION_SIZE                    := 8388608
BOARD_BOOTIMAGE_PARTITION_SIZE                  := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE              := 82694144
BOARD_CACHEIMAGE_PARTITION_SIZE                 := 629145600
BOARD_SUPER_PARTITION_SIZE                      := 9168748544
BOARD_SUPER_PARTITION_GROUPS                    := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE           := 9164554240
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE       := 1258291200
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE       := 30720000
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE      := 1258291200
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE   := 1258291200
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE     	    := 500000000
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT             := -1
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT             := -1
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT            := -1
BOARD_ODMIMAGE_EXTFS_INODE_COUNT           	    := -1

BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Out dirs
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm

# Audio policy
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
AUDIOSERVER_MULTILIB := 32

# Audio
AUDIO_FEATURE_ENABLED_AHAL_EXT := false
AUDIO_FEATURE_ENABLED_DLKM := false
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := false
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

# Fingerprint
TARGET_SEC_FP_REQUEST_FORCE_CALIBRATE := true
TARGET_SEC_FP_REQUEST_TOUCH_EVENT := true

# FOD
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(COMMON_PATH):libudfps_extension.samsung-sm8250
TARGET_USES_FOD_ZPOS := true

# Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/power_supply/battery/batt_slate_mode
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_ENABLED := 0
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_DISABLED := 1
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS := false

# Keymaster
TARGET_KEYMASTER_VARIANT := samsung

# Init
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_samsung_r8q

# HIDL manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(COMMON_PATH)/configs/framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/configs/manifest.xml
DEVICE_MATRIX_FILE += $(COMMON_PATH)/configs/compatibility_matrix.xml

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Samsung
BOARD_VENDOR := samsung

# Display
TARGET_SCREEN_DENSITY := 420
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x400000000LL
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_DRM_PP := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true

# Security patch
VENDOR_SECURITY_PATCH := 2023-09-01

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/recovery/root/fstab.qcom
BOARD_USES_FULL_RECOVERY_IMAGE := true

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_samsung_sm8250
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# SePolicy
include device/qcom/sepolicy_vndr-legacy-um/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/public

# Wi-Fi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
CONFIG_IEEE80211AX := true
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X