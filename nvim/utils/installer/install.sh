#!/bin/sh

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

installnodemac() {
	brew install lua
	brew install node
	brew install yarn
}

installnodeubuntu() {
	sudo apt install nodejs
	sudo apt install npm
}

moveoldnvim() {
	echo "Not installing LunarVim"
	echo "Please move your ~/.config/nvim folder before installing"
	exit
}

installnodearch() {
	sudo pacman -S nodejs
	sudo pacman -S npm
}

installnodefedora() {
    sudo dnf install -y nodejs 
    sudo dnf install -y npm
}

installnode() {
	echo "Installing node..."
	[ "$(uname)" == "Darwin" ] && installnodemac
	[ -n "$(cat /etc/os-release | grep Ubuntu)" ] && installnodeubuntu
	[ -f "/etc/arch-release" ] && installnodearch
	[ -f "/etc/artix-release" ] && installnodearch
	[ -f "/etc/fedora-release" ] && installnodefedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
	sudo npm i -g neovim
}

installpiponmac() {
	sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
}

installpiponubuntu() {
	sudo apt install python3-pip >/dev/null
}

installpiponarch() {
    sudo pacman -S python-pip
}

installpiponfedora() {
	sudo dnf install -y pip >/dev/nul
}

installpip() {
	echo "Installing pip..."
	[ "$(uname)" == "Darwin" ] && installpiponmac
	[ -n "$(cat /etc/os-release | grep Ubuntu)" ] && installpiponubuntu
	[ -f "/etc/arch-release" ] && installpiponarch
	[ -f "/etc/fedora-release" ] && installpiponfedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}

installpynvim() {
	echo "Installing pynvim..."
	pip3 install pynvim --user
}

installpacker() {
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

cloneconfig() {
	echo "Cloning LunarVim configuration"
	git clone https://github.com/ChristianChiarulli/lunarvim.git ~/.config/nvim
	# mv $HOME/.config/nvim/init.lua $HOME/.config/nvim/init.lua.tmp
	# mv $HOME/.config/nvim/utils/init.lua $HOME/.config/nvim/init.lua
	nvim -u $HOME/.config/nvim/init.lua +PackerInstall
	# rm $HOME/.config/nvim/init.lua
	# mv $HOME/.config/nvim/init.lua.tmp $HOME/.config/nvim/init.lua
}

asktoinstallnode() {
	echo "node not found"
	echo -n "Would you like to install node now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installnode
}

asktoinstallpip() {
	# echo "pip not found"
	# echo -n "Would you like to install pip now (y/n)? "
	# read answer
	# [ "$answer" != "${answer#[Yy]}" ] && installpip
	echo "Please install pip3 before continuing with install"
	exit
}

installonmac() {
	brew install ripgrep fzf ranger
	npm install -g tree-sitter-cli
}

pipinstallueberzug() {
	which pip3 >/dev/null && pip3 install ueberzug || echo "Not installing ueberzug pip not found"
}

installonubuntu() {
	sudo apt install ripgrep fzf ranger
	sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev
	pip3 install ueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
}

installonarch() {
	sudo pacman -S ripgrep fzf ranger
	which yay >/dev/null && yay -S python-ueberzug-git || pipinstallueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
}

installonfedora() {
    sudo dnf groupinstall "X Software Development"
    sudo dnf install -y fzf ripgrep ranger
    pip3 install wheel ueberzug
}

installextrapackages() {
	[ "$(uname)" == "Darwin" ] && installonmac
	[ -n "$(cat /etc/os-release | grep Ubuntu)" ] && installonubuntu
	[ -f "/etc/arch-release" ] && installonarch
	[ -f "/etc/artix-release" ] && installonarch
	[ -f "/etc/fedora-release" ] && installonfedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}

# Welcome
echo 'Installing LunarVim'

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && moveoldnvim

# install pip
which pip3 >/dev/null && echo "pip installed, moving on..." || asktoinstallpip

# install node and neovim support
which node >/dev/null && echo "node installed, moving on..." || asktoinstallnode

# install pynvim
pip3 list | grep pynvim >/dev/null && echo "pynvim installed, moving on..." || installpynvim

if [ -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	echo 'packer already installed'
else
	installpacker
fi

if [ -e "$HOME/.config/nvim/init.lua" ]; then
	echo 'nvcode already installed'
else
	# clone config down
	cloneconfig
	# echo 'export PATH=$HOME/.config/nvim/utils/bin:$PATH' >>~/.zshrc
	# echo 'export PATH=$HOME/.config/nvcode/utils/bin:$PATH' >>~/.bashrc
fi

echo "I recommend you also install and activate a font from here: https://github.com/ryanoasis/nerd-fonts"

# echo "I also recommend you add 'set preview_images_method ueberzug' to ~/.config/ranger/rc.conf"

# echo 'export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH appending to zshrc/bashrc'
