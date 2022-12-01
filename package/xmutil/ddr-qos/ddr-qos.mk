################################################################################
#
# ddr-qos
#
################################################################################
ifeq ($(BR2_PACKAGE_DDR_QOS_USE_XMUTIL_TAG),y)
DDR_QOS_VERSION = $(call qstrip,$(BR2_PACKAGE_XMUTIL_DEFAULT_TAG))
else
DDR_QOS_VERSION = $(call qstrip,$(BR2_PACKAGE_DDR_QOS_TAG))
endif
DDR_QOS_SOURCE = ddr-qos-$(DDR_QOS_VERSION).tar.gz
DDR_QOS_SITE = $(call github,Xilinx,ddr-qos,$(DDR_QOS_VERSION))
DDR_QOS_LICENSE = Apache-2.0
DDR_QOS_LICENSE_FILES = LICENSE
DDR_QOS_CONF_OPTS = -DCMAKE_INSTALL_PREFIX=/

$(eval $(cmake-package))
