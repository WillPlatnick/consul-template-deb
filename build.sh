#!/bin/sh
TIMESTAMP=`date +%s`
TYPES="deb"
VERSION=0.10.0

# Download sources
if [ ! -f rootfs/usr/bin/consul-template ]
then
  mkdir -p rootfs/usr/bin
  echo "Downloading source"
  URL="https://github.com/hashicorp/consul-template/releases/download/v${VERSION}/consul-template_${VERSION}_linux_amd64.tar.gz"
  wget -qO tmp.tar.gz $URL
  tar xvfzmp tmp.tar.gz
  mv consul-template_${VERSION}_linux_amd64/consul-template rootfs/usr/bin/consul-template
  rm -rf consul-template_${VERSION}_linux_amd64
  rm tmp.tar.gz
  chmod 0755 rootfs/usr/bin/consul-template
fi

# Delete existing packages
#for TYPE in $TYPES
#do
#  rm *."$TYPE" -f
#done

# Create package
#echo "Creating $TYPE package..."
#fpm -s dir -t $TYPE -C rootfs -n consul-template -v $VERSION \
#  --after-install meta/after-install.sh \
#  --before-remove meta/before-remove.sh
