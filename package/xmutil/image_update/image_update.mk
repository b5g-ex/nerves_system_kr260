################################################################################
#
# image_update
#
################################################################################
ifeq ($(BR2_PACKAGE_IMAGE_UPDATE_USE_XMUTIL_TAG),y)
IMAGE_UPDATE_VERSION = $(call qstrip,$(BR2_PACKAGE_XMUTIL_DEFAULT_TAG))
else
IMAGE_UPDATE_VERSION = $(call qstrip,$(BR2_PACKAGE_IMAGE_UPDATE_TAG))
endif
IMAGE_UPDATE_SOURCE = linux-image_update-$(IMAGE_UPDATE_VERSION).tar.gz
IMAGE_UPDATE_SITE = $(call github,Xilinx,linux-image_update,$(IMAGE_UPDATE_VERSION))
IMAGE_UPDATE_LICENSE = MIT
IMAGE_UPDATE_LICENSE_FILES = LICENSES/MIT

define IMAGE_UPDATE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define IMAGE_UPDATE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/image_update $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
