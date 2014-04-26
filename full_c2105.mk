# Copyright (C) 2013 The Android Open Source Project
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

# Platform specific overlays
DEVICE_PACKAGE_OVERLAYS := device/sony/c2105/overlay

# Get the long list of apns, must be before the full_base_telephony.mk
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit Xperia L device and vendor
$(call inherit-product, device/sony/c2105/c2105.mk)
$(call inherit-product, vendor/sony/c2105/c2105-vendor.mk)

# Include others
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/google/products/gms.mk)

# Product attributes
PRODUCT_NAME := full_c2105
PRODUCT_DEVICE := c2105
PRODUCT_MODEL := C2105
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_LOCALES += hdpi mdpi
PRODUCT_CHARACTERISTICS := phone

# Copy prebuilt kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/sony/c2105/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel