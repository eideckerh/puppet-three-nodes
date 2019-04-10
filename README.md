# Puppet three node cluster with Vagrant 
> Currently only the hyperv provider is supported. Only small changes are necessary to get it working with virtualbox though. 

This is a simple multi-box vagrantfile to spin up one puppet master and two puppet agents. 
Some sample puppet modules and manifests are included.
## Usage 
Install vagrant on your system and simply `vagrant up` from inside this project to spin up the cluster. 
To access the puppet-server use `vagrant ssh master`. All files inside the project will be synchronized with the 3 nodes under /vagrant.
