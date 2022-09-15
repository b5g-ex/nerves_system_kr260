setenv bootargs "earlycon root=/dev/sda2 rootwait console=ttyPS1,115200 clk_ignore_unused uio_pdrv_genirq.of_id=generic-uio xilinx_tsn_ep.st_pcp=4 cma=1000M"

load usb 0:1 0x00200000 /Image
load usb 0:1 0x44000000 /smk-k26-revA-sck-kr-g-revB.dtb

booti 0x00200000 - 0x44000000
