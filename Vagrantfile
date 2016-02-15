# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/ubuntu1504"
  config.vm.hostname = "devbox.local"
  config.vm.network :private_network, ip: "10.10.77.11"
  
  config.hostmanager.aliases = %w(devbox.local devbox)

  config.vm.network "forwarded_port", guest: 2376, host: 2376, auto_correct: true
  config.vm.provision "shell", inline: <<-SHELL
     sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
     echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
     sudo apt-get update
     sudo apt-get install -y linux-image-extra-$(uname -r)
     sudo apt-get install -y docker-engine
     sudo usermod -a -G docker vagrant
  SHELL

  config.vm.provision :shell, :path => 'bootstrap.sh'
end
