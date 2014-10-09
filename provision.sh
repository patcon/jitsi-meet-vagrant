#!/usr/bin/env bash

set -e

sudo -i bash

add-apt-repository 'deb http://download.jitsi.org/nightly/deb unstable/'
wget -qO - https://download.jitsi.org/nightly/deb/unstable/archive.key | apt-key add -

apt-get update -y


