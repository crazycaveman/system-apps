#!/bin/sh

# Create and sign a zip file suitable for flashing on Android

zip -r system-apps.zip * -x make_zip.sh signing README* system-apps*.zip
java -Xmx1024m -jar signing/signapk.jar -w signing/testkey.x509.pem signing/testkey.pk8 system-apps.zip system-apps-signed.zip
