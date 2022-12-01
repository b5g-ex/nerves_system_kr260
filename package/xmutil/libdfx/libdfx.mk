################################################################################
#
# libdfx
#
################################################################################
ifeq ($(BR2_PACKAGE_LIBDFX_USE_XMUTIL_TAG),y)
LIBDFX_VERSION = $(call qstrip,$(BR2_PACKAGE_XMUTIL_DEFAULT_TAG))
else
LIBDFX_VERSION = $(call qstrip,$(BR2_PACKAGE_LIBDFX_TAG))
endif
LIBDFX_SOURCE = libdfx-$(DFX_MGR_VERSION).tar.gz
LIBDFX_SITE = $(call github,Xilinx,libdfx,$(LIBDFX_VERSION))
LIBDFX_LICENSE = MIT
LIBDFX_LICENSE_FILES = LICENSE.md
LIBDFX_INSTALL_STAGING = YES

$(eval $(cmake-package))
