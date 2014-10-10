#!/usr/bin/env bash

# Run this script on the box Ubuntu Trusty 14.04 box to be configured
#
# ~$ ./provision.sh <sip_username@server.tld> <s1p_p4ssw0rd>

set -e

sip_username=$1
sip_password=$2

sudo -i bash

add-apt-repository 'deb http://download.jitsi.org/nightly/deb unstable/'
wget --quiet --output-document=- https://download.jitsi.org/nightly/deb/unstable/archive.key | apt-key add -

apt-get --yes --quiet update

# For automating the install wizards
apt-get --yes --quiet install debconf-utils

# Install Jitsi Meet
echo "jitsi-videobridge jitsi-videobridge/jvb-hostname string $(hostname -I)" | debconf-set-selections
echo 'jitsi-meet jitsi-meet/cert-choice select Self-signed certificate will be generated' | debconf-set-selections
echo 'jitsi-meet jitsi-meet/cert-path-key string ${default-key}' | debconf-set-selections
echo 'jitsi-meet jitsi-meet/cert-path-crt string ${default-crt}' | debconf-set-selections
apt-get --yes --quiet install jitsi-meet

# Enable SIP dial outs
echo "jigasi jigasi/sip-account string '${sip_username}'" | debconf-set-selections
echo "jigasi jigasi/sip-password password '${sip_password}'" | debconf-set-selections
apt-get --yes --quiet install jigasi
