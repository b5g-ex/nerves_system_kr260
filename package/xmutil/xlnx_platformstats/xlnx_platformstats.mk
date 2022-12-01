################################################################################
#
# xlnx_platformstats
#
################################################################################
ifeq ($(BR2_PACKAGE_XLNX_PLATFORMSTATS_USE_XMUTIL_TAG),y)
XLNX_PLATFORMSTATS_VERSION = $(call qstrip,$(BR2_PACKAGE_XMUTIL_DEFAULT_TAG))
else
XLNX_PLATFORMSTATS_VERSION = $(call qstrip,$(BR2_PACKAGE_XLNX_PLATFORMSTATS_TAG))
endif
XLNX_PLATFORMSTATS_SOURCE = xlnx_platformstats-$(XLNX_PLATFORMSTATS_VERSION).tar.gz
XLNX_PLATFORMSTATS_SITE = $(call github,Xilinx,xlnx_platformstats,$(XLNX_PLATFORMSTATS_VERSION))
XLNX_PLATFORMSTATS_LICENSE = MIT
XLNX_PLATFORMSTATS_LICENSE_FILES = LICENSE

define XLNX_PLATFORMSTATS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS) -shared" -C $(@D)/src
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/app
endef

define XLNX_PLATFORMSTATS_INSTALL_TARGET_CMDS
	cp -a $(@D)/src/libplatformstats.so* $(TARGET_DIR)/usr/lib
	$(INSTALL) -D -m 0755 $(@D)/app/platformstats $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
