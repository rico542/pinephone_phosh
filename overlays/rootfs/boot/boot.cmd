setenv bootargs console=ttyS0,115200 no_console_suspend panic=10 consoleblank=0 loglevel=7 root=/dev/mmcblk0p1 rw splash plymouth.ignore-serial-consoles

led 1 on
echo "Loading kernel..."
load mmc 0:1 ${ramdisk_addr_r} /boot/Image.gz
echo "Uncompressing kernel..."
unzip ${ramdisk_addr_r} ${kernel_addr_r}
echo "Loading initramfs..."
load mmc 0:1 ${ramdisk_addr_r} /boot/initrd.uImg
echo "Loading dtb..."
load mmc 0:1 ${fdt_addr_r} /boot/dtb/${fdtfile}
led 2 on
echo "Booting..."
booti ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}
