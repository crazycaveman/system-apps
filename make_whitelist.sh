#!/bin/sh
# Add these scripts to the whitelist so they are preserved between version updates

list_files() {
cat <<EOF
90-TitaniumBackup
95-cerberus
99-SecureSettingsHelper
EOF
}

list_files | while read file; do
   s=$(md5sum /system/addon.d/$file.sh | awk {'print $1'})
   [ grep -qs $s /system/addon.d/whitelist ] || echo $s >> /system/addon.d/whitelist
done
