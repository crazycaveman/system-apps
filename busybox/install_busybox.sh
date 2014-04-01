#!/sbin/sh
# Check if busybox is already installed and install as necessary
OUTFD=$(ps | grep -v "grep" | grep -o -E "update.*" | cut -d " " -f 3)

if [ ! -x /system/xbin/busybox -o ! -s /system/xbin/busybox ]
then
	echo "ui_print Installing Busybox " 1>&$OUTFD
	echo "ui_print " 1>&$OUTFD
	mv /tmp/busybox /system/xbin/busybox
	chown root.root /system/xbin/busybox
	chmod 755 /system/xbin/busybox
	/system/xbin/busybox --install -s /system/xbin
else
	echo "ui_print Busybox already installed " 1>&$OUTFD
	echo "ui_print " 1>&$OUTFD
fi
