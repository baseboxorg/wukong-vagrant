# update ubuntu source list and package list
apt-get update

# most essential tools
apt-get -y install zsh
apt-get -y install git-core
apt-get -y install build-essential checkinstall
apt-get -y install vim
apt-get -y install tmux

# setup oh-my-zsh
if [ ! -f /home/vagrant/.oh-my-zsh/ ]; then
  sudo -u vagrant -H git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
fi
sudo -u vagrant -H cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
chsh -s $(which zsh) vagrant

# setup wukong
apt-get -y install python-dev
apt-get -y install libevent-dev
apt-get -y install python-pip
apt-get -y install openjdk-7-jdk ant
apt-get -y install avrdude gcc-avr avr-libc binutils-avr
apt-get -y install arduino
pip install gevent
pip install greenet
pip install -I tornado==2.4.1
pip install simplejson
pip install pyserial
pip install configobj
pip install jinja2
if [ ! -f /home/vagrant/wukong-darjeeling/ ]; then
  sudo -u vagrant -H git clone https://github.com/wukong-m2m/wukong-darjeeling.git
fi
cd wukong-darjeeling/wukong/tools/python/pyzwave
python setup.py install
