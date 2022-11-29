################################################################################
#
# libdfx
#
################################################################################

LIBDFX_VERSION = xilinx_v2022.1_update2
LIBDFX_SOURCE = libdfx-$(LIBDFX_VERSION).tar.gz
LIBDFX_SITE = $(call github,Xilinx,libdfx,$(LIBDFX_VERSION))
LIBDFX_LICENSE = MIT
LIBDFX_LICENSE_FILES = LICENSE.md
LIBDFX_INSTALL_STAGING = YES

$(eval $(cmake-package))
