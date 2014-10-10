# Jitsi Meet testing

This is a test repo that will allow a user to set up a working Jitsi
Meet server on DigitalOcean hosting with minimal effort. The prepared
server will be ready to use for video conferencing. Optionally, a SIP
username and password can be provided during set up to allow calling out
to SIP users. The intention is to later provide a simple chrome
extension for screensharing on your video conferencing server (this must
be tailored slightly to your server).

## Requirements

- install Vagrant tool
- install Vagrant plugin:
  - `vagrant plugin install vagrant-digitalocean`
- obtain a DigitalOcean API key:
  https://cloud.digitalocean.com/settings/applications

- (optional) register for a SIP server. [ostel.co][] is suggested.
  - username (ie. username@service.com)
  - password


## Usage

After

```
export DIGITALOCEAN_TOKEN=
export JITSIMEET_SIP_USERNAME=example@ostel.co
export JITSIMEET_SIP_PASSWORD=p4ssw0rd
vagrant up
```

`vagrant ssh-config` will show you the IP address of the server where
you'll want to point chrome. Ignore the security warnings -- these show
up because we created a self-signed SSL certificate, which Chrome is
correct to be suspicious of were this not our own server.

## Notes

To get the screen sharing feature working:

- Download chrome extension source and change `externally_connectable` key:
  https://github.com/jitsi/jidesha/blob/master/manifest.json
- Check "Developer mode" on Chrome's "Extensions" page. "Load unpacked
  extension..." button and choose the downloaded and altered ext. Note
  the ID for the loaded extension.
- In `/usr/share/jitsi-meet/config.js` on server:
  Find `chromeExtensionId` key and use the ID above.

