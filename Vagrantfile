# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.


  # Networking not supported yet with hyper v and vagrant
  # config.vm.network "private_network", type: "dhcp"

  # General HyperV settings
  config.vm.provider :hyperv do |h|
    h.cpus = 1
    h.ip_address_timeout = 121
    h.memory = 512
    h.maxmemory = 1024
  end

  # General VM settings
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.synced_folder ".", "/vagrant",
    smb_username: "henry"

  # Master settings
  config.vm.define :master do |master|
    master.vm.hostname = :master 
    master.vm.provider :hyperv do |h|
        h.vmname = :master 
    end
    master.vm.provision :shell, :path => "install_puppetserver.sh"
  end 

  # Worker settings 
  %w(worker1 worker2).each_with_index do |name, i|
    config.vm.define name do |worker|
      worker.vm.hostname = name
      worker.vm.provider :hyperv do |h|
          h.vmname = name 
      end
      worker.vm.provision :shell, :path => "install_puppetagent.sh"
    end
  end

end
