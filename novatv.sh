#!/bin/sh
#
###command=wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/novalerstore/main/novatv.sh -O - | /bin/sh
###########################
PYTHON_VERSION=$(python -c"import platform; print(platform.python_version())")
##########################
echo " remove old plugins "
if [ -d /usr/lib/enigma2/python/Plugins/Extensions/NovaTV ]; then
echo "> removing package please wait..."
sleep 1;
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/NovaTV > /dev/null 2>&1
fi
status='/var/lib/opkg/status'
package='enigma2-plugin-extensions-novatv'

if grep -q $package $status; then
opkg remove $package
fi

echo "*******************************************"
echo "*             Removed Finished            *"
echo "*******************************************"
sleep 1;
# Check python
if [ "$PYTHON_VERSION" = 3 ]; then
opkg install enigma2-plugin-systemplugins-serviceapp exteplayer3 ffmpeg gstplayer libc6 python3-core python3-cryptography python3-futures3 python3-image python3-json python3-multiprocessing python3-pillow python3-requests

else
opkg install enigma2-plugin-systemplugins-serviceapp exteplayer3 ffmpeg gstplayer libc6 python-core python3-cryptography python-futures python-image python-json python-multiprocessing python-pillow python-requests
fi
url="https://raw.githubusercontent.com/emil237/novalerstore/main"

if [ "$PYTHON_VERSION" == 3.11.0 -o "$PYTHON_VERSION" == 3.11.1 -o "$PYTHON_VERSION" == 3.11.2 -o "$PYTHON_VERSION" == 3.11.3 -o "$PYTHON_VERSION" == 3.11.4 -o "$PYTHON_VERSION" == 3.11.5 ]; then
echo ":You have $PYTHON_VERSION image ..."
cd /tmp
set -e
wget --show-progress "$url/novatv-py3.11-3.0-r0.ipk"
sleep 1;
opkg install --force-reinstall novatv-py3.11-3.0-r0.ipk
set +e
cd ..
wait
rm -f /tmp/novatv-py3.11-3.0-r0.ipk

elif [ "$PYTHON_VERSION" == 3.12.0 -o "$PYTHON_VERSION" == 3.12.1 -o "$PYTHON_VERSION" == 3.12.2 -o "$PYTHON_VERSION" == 3.12.3 -o "$PYTHON_VERSION" == 3.12.4 -o "$PYTHON_VERSION" == 3.12.5 ]; then
echo ":You have $PYTHON_VERSION image ..."
cd /tmp
set -e
wget --show-progress "$url/novatv-py3.12-3.0-r0.ipk"
sleep 1;
opkg install --force-reinstall novatv-py3.12-3.0-r0.ipk
set +e
cd ..
wait
rm -f /tmp/novatv-py3.12-3.0-r0.ipk

elif [ "$PYTHON_VERSION" == 3.9.9 -o "$PYTHON_VERSION" == 3.9.7 -o "$PYTHON_VERSION" == 3.9.6 -o "$PYTHON_VERSION" == 3.8.5 ]; then
echo ":You have $PYTHON_VERSION image ..."
cd /tmp
set -e
wget --show-progress "$url/novatv-py3.9-3.0-r0.ipk"
sleep 1;
opkg install --force-reinstall novatv-py3.9-3.0-r0.ipk
set +e
cd ..
wait
rm -f /tmp/novatv-py3.9-3.0-r0.ipk

elif [ "$PYTHON_VERSION" == 2.7.18 ]; then
echo ":You have $PYTHON_VERSION image ..."
cd /tmp
set -e
wget --show-progress "$url/novatv-py2-3.0-r0.ipk"
sleep 1;
opkg install --force-reinstall novatv-py2-3.0-r0.ipk
set +e
cd ..
wait
rm -f /tmp/novatv-py2-3.0-r0.ipk

else
echo "Python is not supported"
sleep 4;
exit 1
fi
echo "   UPLOADED BY  >>>>   EMIL_NABIL "
sleep 4;

exit
