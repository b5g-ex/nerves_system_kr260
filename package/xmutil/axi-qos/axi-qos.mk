################################################################################
#
# axi-qos
#
################################################################################
ifeq ($(BR2_PACKAGE_AXI_QOS_USE_XMUTIL_TAG),y)
AXI_QOS_VERSION = $(call qstrip,$(BR2_PACKAGE_XMUTIL_DEFAULT_TAG))
else
AXI_QOS_VERSION = $(call qstrip,$(BR2_PACKAGE_AXI_QOS_TAG))
endif
AXI_QOS_SOURCE = axi-qos-$(AXI_QOS_VERSION).tar.gz
AXI_QOS_SITE = $(call github,Xilinx,axi-qos,$(AXI_QOS_VERSION))
AXI_QOS_LICENSE = Apache-2.0
AXI_QOS_LICENSE_FILES = LICENSE
AXI_QOS_CONF_OPTS = -DCMAKE_INSTALL_PREFIX=/

$(eval $(cmake-package))
