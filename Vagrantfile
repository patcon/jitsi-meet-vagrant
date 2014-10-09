# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'digital_ocean'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "jitsi-meet-testing"

  config.omnibus.chef_version = "11.16.4"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  if Vagrant.has_plugin?("vagrant-digitalocean")
    config.vm.provider "digital_ocean" do |provider, override|
      provider.token = ENV['DIGITALOCEAN_TOKEN'] unless ENV['DIGITALOCEAN_TOKEN'].nil?
      provider.image = 'Ubuntu 14.04 x64'
      provider.size = '1gb'
      provider.ssh_key_name = "#{Socket.gethostname}-digitalocean"

      override.ssh.private_key_path = '~/.ssh/id_rsa_do'
      override.vm.box = 'digital_ocean'
      override.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'
    end
  end

  config.vm.provision "shell", path: "provision.sh"

  # View the documentation for the provider you're using for more
  # information on available options.
  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision "chef_solo" do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { mysql_password: "foo" }
  # end
end
