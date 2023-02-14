# About
This repo is mantain for personal use, although you can use it for your dotfiles as well

I created this to have a little guide for install all the software needed for my pc after a fresh minimal instalation and save my configs (only for arch-based distros)

* See my [arch installation notes (personal guide)](.config/0.arch-installation-guide.md)

# Intallation
* You must have install an AUR helper, I'm using [paru](https://github.com/Morganamilo/paru) here but you can use any other
```bash
# update your system
sudo pacman -Syu

# needed drivers
sudo pacman -S alsa pulseaudio polkit polkit-gnome --needed

#set zsh as default shell
sudo pacman -s zsh
sudo chsh -s /usr/bin/zsh root
chsh -s /usr/bin/zsh $USER
paru -S pfetch --needed

# packages needed by dotfiles
sudo pacman -S awesome neovim kitty neofetch picom rofi sxhkd xorg-xmodmap mdcat lsd bat spacefm xclip firefox nitrogen git flameshot trash-cli --needed
```
```bash
#for customize gtk and qt themes
sudo pacman -S qt5ct lxappearance-gtk3 --needed

# Other programs
sudo pacman -S alsa-utils pavucontrol gparted zathura keepassxc vlc --needed
```
And the following packages from the AUR
```bash
paru -S vscodium onlyoffice-bin --needed
```

## Fonts
install Fira Code Nerd Font from [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip) and follow the [arch wiki to manage fonts](https://wiki.archlinux.org/title/fonts)

Install packages for display special characters
```bash
pacman -S noto-fonts noto-fonts-cjk noto-fonts-extra
```

## Icons
```bash
sudo pacman -S papirus-icon-theme --needed
```
## gtk and qt themes
```bash
sudo pacman -S breeze-gtk breeze --needed
```
You set these themes and icons packs manually throught qtct5 and lxappearence apps

## Wallpaper
change it from `nitrogen` app

## Color scheme
I'm using the the Tomorrow Night theme in vscode and in the terminal
* To set a color theme for kitty terminal [here](https://github.com/dexpota/kitty-themes)
* To set a color theme for vscode search in the vscode marketplace. (If you're using vscodium you should follow [this guide](https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management) to install some extentions)

Other nice theme with an awesome cross-app support is dracula color scheme

# For auto numLock on
```bash
# numlock on in xorg server
pacman -S numlockx --needed
# numlock on in a tty
paru -S systemd-numlockontty --needed
sudo systemctl enable numLockOnTty
```
[More info](https://wiki.archlinux.org/title/Activating_numlock_on_bootup_(Espa%C3%B1ol))


# For printers
```bash
sudo pacman -S cups cups-pdf system-config-printer --needed
sudo systemctl enable cups
```
You have to search the specific packages-drivers for your printer [here](https://wiki.archlinux.org/title/CUPS), then you can install your printer

```bash
firefox --new-window http://localhost:631/

```
# Little guide to manage your dotfiles with a bare git repo

# Create your repo
create your repo in your `$HOME` directory:
```bash
mkdir $HOME/.dotfiles_repo #you mush have logged as your diary-user (not as root)
```
Before creating your directory, you have to git init
```bash
git init --bare $HOME/.dotfiles_repo
```
set this alias in your shell config file
bash
```bash
alias dot-git='/usr/bin/git --git-dir=$HOME/.dotfiles_repo/ --work-tree=$HOME'
```
reload your shell whith `exec $SHELL` and then execute the following command
bash
```bash
dot-git config --local status.showUntrackedFiles no
```

## Managing your dot files
After following the previous commands, you will do things like this:
```bash
dot-git status
dot-git add .vimrc
dot-git commit -m "Add vimrc"
dot-git add .bashrc
dot-git commit -m "Add bashrc"
dot-git push
```

## Install your dotfiles in other pc
save the alias in your shell config file in the other pc
```bash
alias dot-git='/usr/bin/git --git-dir=$HOME/.dotfiles_repo/ --work-tree=$HOME'
```
reload your shell and create a .gitignore file and ignore the .dotfiles_repo to avoid weird recursivity problems
```bash
echo ".dotfiles_repo" >> .gitignore
```
Clone your bare repo in your `$HOME` directory
```bash
git clone --bare <git-repo-url> $HOME/.cfg
```
Checkout the actual content from the bare repository to your `$HOME`:
```bash
dot-git checkout main
```
run this
```bash
config --local status.showUntrackedFiles no
```


## More info about managing your dot files with a bare repo
* [Git Bare Repository - A Better Way To Manage Dotfiles - DT](https://www.youtube.com/watch?v=tBoLDpTWVOM)
* https://www.atlassian.com/git/tutorials/dotfiles
