#!/usr/bin/env bash
if which puppet > /dev/null 2>&1; then
    echo 'Puppet server already installed.'
else
    wget https://apt.puppetlabs.com/puppet6-release-xenial.deb
    dpkg -i puppet6-release-xenial.deb
    apt-get update
    apt-get --assume-yes install puppetserver
    sed -i 's/JAVA_ARGS=.*/JAVA_ARGS="-Xms512m -Xmx512m"/g' /etc/default/puppetserver
    systemctl start puppetserver
    systemctl enable puppetserver
    echo 'Puppet installation finished'
fi