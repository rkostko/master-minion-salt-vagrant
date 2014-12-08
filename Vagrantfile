# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_agent = true
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Master salt configuration
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/trusty64"
    master.vm.host_name = "master"
    master.vm.synced_folder "../../vbnfs", "/vbnfs"
    master.vm.synced_folder "salt/roots", "/srv/salt"
    master.vm.network :private_network, ip: "192.168.56.102"    
    master.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    master.vm.provision :salt do |salt|
      salt.install_master = true

      salt.master_config = 'salt/configs/master.conf'
      salt.seed_master = {
        master: 'salt/keys/master.pub',
        minion1: 'salt/keys/minion1.pub',
        minion2: 'salt/keys/minion2.pub'
      }

      salt.install_type = :stable
    end
  end

  # Minion1 salt configuration
  config.vm.define "minion1" do |minion|    
    minion.vm.box = "ubuntu/trusty64"
    minion.vm.host_name = "minion1"
    minion.vm.synced_folder "../../vbnfs", "/vbnfs"
    minion.vm.synced_folder "salt/roots", "/srv/salt"
    minion.vm.network :private_network, ip: "192.168.56.103"
    minion.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    minion.vm.provision :salt do |salt|
      salt.run_highstate = true
      salt.minion_config = "salt/configs/minion1.conf"
      salt.minion_key = "salt/keys/minion1.pem"
      salt.minion_pub = "salt/keys/minion1.pub"
    end 
  end  

  # Minion2 salt configuration
  config.vm.define "minion2" do |minion|    
    minion.vm.box = "ubuntu/trusty64"
    minion.vm.host_name = "minion2"
    minion.vm.synced_folder "../../vbnfs", "/vbnfs"
    minion.vm.synced_folder "salt/roots", "/srv/salt"
    minion.vm.network :private_network, ip: "192.168.56.104"
    minion.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    minion.vm.provision :salt do |salt|
      salt.run_highstate = true
      salt.minion_config = "salt/configs/minion2.conf"
      salt.minion_key = "salt/keys/minion2.pem"
      salt.minion_pub = "salt/keys/minion2.pub"
    end 
  end  
end
