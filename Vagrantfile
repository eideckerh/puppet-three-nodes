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
    smb_password: "notchsono88", smb_username: "henry"

  # Master settings
  config.vm.define :master do |master|
    master.vm.hostname = :master 
    master.vm.provider :hyperv do |h|
        h.vmname = :master 
    end
  
    bootstrap_script = <<-EOF
    if which puppet > /dev/null 2>&1; then
      echo 'Puppet Installed.'
    else
      wget https://apt.puppetlabs.com/puppet6-release-xenial.deb
      dpkg -i puppet6-release-xenial.deb
      apt-get update
      apt-get --assume-yes install puppetserver
      sed -i 's/JAVA_ARGS=.*/JAVA_ARGS="-Xms512m -Xmx512m"/g' /etc/default/puppetserver
      systemctl start puppetserver
    fi
    EOF
    master.vm.provision :shell, :inline => bootstrap_script
  end 

  # Worker settings 
  %w(worker1 worker2).each_with_index do |name, i|
    config.vm.define name do |worker|
      worker.vm.hostname = name
      worker.vm.provider :hyperv do |h|
          h.vmname = name 
      end
    end
  end

end
