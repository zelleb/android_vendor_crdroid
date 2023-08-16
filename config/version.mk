PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 0

# Increase CR Version with each major release.
CR_VERSION := 10.10

# GAPPS_BUILD_TYPE
# 0 - NO GAPPS (DEFAULT)
# 1 - MICROG
# 2 - GAPPS

# validate GAPPS_BUILD_TYPE used on envsetup
ifeq ($(filter $(strip $(GAPPS_BUILD_TYPE)),0 1 2),)
# if value is not valid, pick WITH_GAPPS from dt
GAPPS_BUILD_TYPE := $(strip $(WITH_GAPPS))
endif

ifeq ($(GAPPS_BUILD_TYPE),1)
CR_BUILD_PACKAGE := microg
else
ifeq ($(GAPPS_BUILD_TYPE),2)
CR_BUILD_PACKAGE := gapps
else # default
CR_BUILD_PACKAGE := vanilla
endif
endif

# include GMS setup
$(call inherit-product, vendor/partner_gms/products/gms.mk)

# Internal version
LINEAGE_VERSION := crDroidAndroid-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-v$(CR_VERSION)-$(CR_BUILD_PACKAGE)

# Display version
LINEAGE_DISPLAY_VERSION := crDroidAndroid-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-v$(CR_VERSION)-$(CR_BUILD_PACKAGE)
