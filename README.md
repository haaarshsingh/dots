# dotfiles

![image](https://user-images.githubusercontent.com/69592270/122867380-651bae00-d2f7-11eb-9795-9fd69199a58c.png)

*video tour coming soon* -- *blog post coming soon*

# Apps/Packages

| Link                                                                      | Description                                                                       |
|---------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| [Arch Linux](https://archlinux.org/)                                      | Lightweight Linux distro based off of Ubuntu                                      |
| [i3wm](https://github.com/Airblader/i3)                                   | A tiling window manager                                                           |
| [i3-gaps](https://github.com/Airblader/i3)                                | Fork of i3 with enhanced features like gaps                                       |
| [Rofi](https://github.com/DaveDavenport/rofi)                             | A window switcher, application launcher and dmenu replacement                     |
| [Compton](https://github.com/chjj/compton)                                | A compositor for X, to get window transparency and avoid tearing and vsync issues |
| [Nitrogen](https://wiki.archlinux.org/index.php/Nitrogen)                 | Set wallpapers for i3wm                                                           |
| [Polybar](https://github.com/polybar/polybar)                             | Fast and easy to use status bar                                                   |
| [Neovim](https://neovim.io/)                                              | Vim-fork focused on extensibility and usability                                   |
| [Alacritty](https://github.com/alacritty/alacritty/)                      | A cross-platform, OpenGL terminal emulator.                                       |
| [arandr](https://christian.amsuess.com/tools/arandr/)                     | GUI for xrandr                                                                    |
| [starship.rs](https://starship.rs/)                                       | The minimal, blazing-fast, and infinitely customizable prompt for any shell!      |
| [neofetch](https://github.com/dylanaraps/neofetch)                        | Command line system information tool                                              |
| [NuShell](https://www.nushell.sh/)                                        | A new type of shell                                                               |

# Installation 

 - Clone this repo `git clone https://github.com/harshhhdev/dotfiles.git`
 - Copy files into proper directories
 - Install the programs

# Arch Linux

A full guide on installing Arch Linux can be found in the [Arch Wiki](https://wiki.archlinux.org/index.php/Installation_guide)

Optionally, if you need a video guide, I suggest [this one](https://www.youtube.com/watch?v=SFzN6e7USGk)

# i3wm 

 - Install i3wm via pacman `sudo pacman -S i3`
 - Start i3 on boot `echo "exec i3" >> ~/.xinitrc`
 - Install xorg `sudo pacman -S xorg-server xorg-xinit`
 - Start i3 `startx`

# Rofi

 - Install rofi with pacman `sudo pacman -S rofi`

# Compton

 - Install Compton for Arch `yay -S compton-tryone-git`

# Nitrogen 

 - Install Nitrogen for Arch `sudo pacman -S nitrogen`
 - Pick a folder to get wallpaper
 - Set the wallpaper 
 - If you are using dual monitors like me, make sure to select "Full Screen" on each of the monitors separately

# Polybar

 - Install polybar for Arch `sudo pacman -S polybar`

# Neovim

 - My neovim config requires v0.5 or above. At this current time (30/4/21) Neovim 0.5 is not out of beta yet.
 - If by the time you're reading this, Neovim 0.5 becomes stable, install it using `sudo pacman -S neovim`
 - If it's not stable, install the nightly version using yay `yay -S neovim-nightly-bin`

 - Open up neovim using `nvim`
 - Install required packages using Packer `:PackerInstall`
 - Install CoC packages `:CocInstall`

# Alacritty

 - Install Alacritty on Arch `sudo pacman -S alacritty`

# arandr

 - Install arandr for Arch `sudo pacman -S arandr`
 - Open arandr and create your layout
 - Replace my arandr configuration in the `i3 config` 

# Starship.rs

 - Install starship.rs `sh -c "$(curl -fsSL https://starship.rs/install.sh)"`

# Neofetch

 - Install Neofetch for Arch `sudo pacman -S neofetch`

# NuShell

 - Install NuShell for Arch `yay -S nushell`
 - Set as default shell `chsh -s /usr/bin/nu`
