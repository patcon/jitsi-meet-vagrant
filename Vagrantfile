# -*- mode: ruby -*-
# vi: set ft=ruby :

# Check to make sure proper env vars available
raise "Please set the DIGITALOCEAN_TOKEN env var." if ENV['DIGITALOCEAN_TOKEN'].nil?

if ENV['JITSIMEET_SIP_USERNAME'].nil? or ENV['JITSIMEET_SIP_PASSWORD'].nil?
  raise "Please set the JITSIMEET_SIP_USERNAME and/or JITSIMEET_SIP_PASSWORD env vars."
else
  SIP_USERNAME = ENV['JITSIMEET_SIP_USERNAME']
  SIP_PASSWORD = ENV['JITSIMEET_SIP_PASSWORD']
end

# so we don't need to set the `--provider` flag for each command
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'digital_ocean'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "jitsi-meet-testing"

  if Vagrant.has_plugin?("vagrant-digitalocean")
    config.vm.provider "digital_ocean" do |provider, override|
      provider.token = ENV['DIGITALOCEAN_TOKEN']
      provider.image = 'Ubuntu 14.04 x64'
      provider.size = '1gb'
      provider.ssh_key_name = "#{Socket.gethostname}-digitalocean"

      override.ssh.private_key_path = '~/.ssh/id_rsa_do'
      override.vm.box = 'digital_ocean'
      override.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'
    end
  end

  config.vm.provision "shell",
    path: "provision.sh",
    args: [ SIP_USERNAME, SIP_PASSWORD ]
end
