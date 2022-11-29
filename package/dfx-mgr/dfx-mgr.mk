################################################################################
#
# dfx-mgr
#
################################################################################

DFX_MGR_VERSION = xilinx_v2022.1_update2
DFX_MGR_SOURCE = dfx-mgr-$(DFX_MGR_VERSION).tar.gz
DFX_MGR_SITE = $(call github,Xilinx,dfx-mgr,$(DFX_MGR_VERSION))
DFX_MGR_LICENSE = MIT
DFX_MGR_LICENSE_FILES = LICENSE
DFX_MGR_DEPENDENCIES = libdfx libwebsockets
DFX_MGR_CONF_OPTS = -DWITH_STATIC_LIB=OFF -DWITH_SHARED_LIB=ON

$(eval $(cmake-package))
