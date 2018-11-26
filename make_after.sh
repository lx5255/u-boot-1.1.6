if [ ! -f "uboot.part" ]; then
    cp ~/tool/flashimg/uboot.part .
fi
pwd
flashimg -s 256M -t nand -f nand.bin -p uboot.part -w boot,u-boot.bin -z 2048 
qemu-system-arm -M mini2440-serial stdio -mtdblock nand.bin -usbdevice mouse -net nic -net tap,ifname=tap0,script=no,downscript=no-nographic
# qemu-system-arm -M mini2440 -serial stdio -mtdblock  nand.bin
# qemu-system-arm -M mini2440 -serial stdio -mtdblock  nand.bin

