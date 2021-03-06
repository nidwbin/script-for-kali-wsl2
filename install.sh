#! /bin/sh
echo "setting zsh and vim..."
cp ./.zshrc ~/
cp ./.vimrc ~/


echo "install some soot scripts and antigen.zsh, change apt source file..."
sudo cp ./profile.d/init.sh /etc/profile.d
sudo cp -r ./profile.d/.init.d /etc/profile.d/.init.d

sudo cp ./antigen.zsh /usr/share/zsh/
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo cp ./sources-http.list /etc/apt/sources.list

sudo dpkg -i ./packages-microsoft-prod.deb
sudo chmod u+s /usr/bin/ping


echo "update apt..."
sudo apt-get update
sudo apt-get upgrade


echo "install vim, git, zsh, htop, apt-transport-https, psmisc and genie..."
sudo apt-get install vim git zsh htop apt-transport-https psmisc
sudo apt-get install ./systemd-genie_*_amd64.deb
sudo sudo cp ./sources-https.list /etc/apt/sources.list 
sudo apt-get update
sudo apt-get upgrade

echo "fix bug of docker.io"
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

echo "change shell to zsh..."
chsh -s /bin/zsh

echo "finished"
echo "Boot scripts include enable systemd; get WINIP, WSLIP DISPLAY; set input config."
echo "You can edit them in /etc/profile.d/.init.d."
echo "You can run \"touch ~/.disable\" to disable my boot scripts."
