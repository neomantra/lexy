#!/bin/bash

set -e -x

LEXY=/lexy

apt-get  update -q -y
apt-get install -q -y rsync git-core curl
apt-get install -q -y ruby ruby-dev rubygems rake
apt-get install -q -y build-essential

gem install rdoc chef ohai --no-ri --no-rdoc --source http://gems.opscode.com --source http://gems.rubyforge.org

if ! [ -d /chef ]; then
  if ! [ -d $LEXY ]; then
    curl http://sp-provisioning.s3.amazonaws.com/chef.tar.gz > /tmp/chef.tar.gz
    tar xzf /tmp/chef.tar.gz -C /
    # git clone git://github.com/jlewallen/lexy.git $LEXY
  fi
  ln -sf $LEXY/chef /chef
fi

cp /chef/lexy-chef /usr/bin

# EOF
