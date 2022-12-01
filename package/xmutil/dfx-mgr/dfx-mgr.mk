################################################################################
#
# dfx-mgr
#
################################################################################
ifeq ($(BR2_PACKAGE_DFX_MGR_USE_XMUTIL_TAG),y)
DFX_MGR_VERSION = $(call qstrip,$(BR2_PACKAGE_XMUTIL_DEFAULT_TAG))
else
DFX_MGR_VERSION = $(call qstrip,$(BR2_PACKAGE_DFX_MGR_TAG))
endif
DFX_MGR_SOURCE = dfx-mgr-$(DFX_MGR_VERSION).tar.gz
DFX_MGR_SITE = $(call github,Xilinx,dfx-mgr,$(DFX_MGR_VERSION))
DFX_MGR_LICENSE = MIT
DFX_MGR_LICENSE_FILES = LICENSE
DFX_MGR_DEPENDENCIES = libdfx libwebsockets libdrm
DFX_MGR_CONF_OPTS = -DWITH_STATIC_LIB=OFF -DWITH_SHARED_LIB=ON

$(eval $(cmake-package))
