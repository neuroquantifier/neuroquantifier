#!/bin/bash
sudo apt update
sudo apt upgrade


# use this script to set up a fresh installation of Pop!_OS

sudo apt install -y htop, neovim, atom, timeshift, ssh, nodejs

# VLC and codec
sudo apt install -y vlc vlc-data ubuntu-restricted-extras

# jupyter lab
pip install jupyterlab


# setup git and github ssh
./setup-ssh-git.sh

# run apply dotfiles
./apply-dotfiles.sh

# open ssh port
sudo ufw enable
sudo ufw allow ssh


# alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install -y alacritty

# Dash to dock
sudo apt install -y gnome-tweaks
echo
echo "Go to https://extensions.gnome.org/extension/307/dash-to-dock/ and install Dash to Dock"

# increase scrollbar size
cp ../dotfiles/gtk.css ~/.config/gtk-3.0

# install anaconda
# prerequisites
echo "Installing Anaconda"
sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh -P ~/Downloads
chmod 777 ~/Downloads/*.sh
~/Downloads/Anaconda*
conda config --set auto_activate_base true

./deep-learning-setup.sh

echo
echo "Open Firefox, and go to 'about:config'"
echo "Find 'mousewheel.min_line_scroll_amount', and enter '90'"
echo "Find 'mousewheel.acceleration.factor', and enter '20'"
echo
read -n 1 -s -r -p "Press any key when done"


pip3 install -r basic-requirements.txt

# enable korean keyboard
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"