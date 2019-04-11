#!/usr/bin/env bash
conf=/etc/puppetlabs/puppet/puppet.conf

if which puppet > /dev/null 2>&1; then
    echo 'Puppet agent already installed.'
else
    wget https://apt.puppetlabs.com/puppet6-release-xenial.deb
    dpkg -i puppet6-release-xenial.deb
    apt-get update
    apt-get --assume-yes install puppet-agent
    echo "[main]" >> $conf
    echo "server = master" >> $conf 
    /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
    echo 'Puppet agent installation finished'
fi