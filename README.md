# About
This repo is mantain for personal use, although you can use it for your dotfiles as well

I crated this to have a little guide to install the software needed for setup my pc after a fresh minimal instalation and save my configs (only for arch-based distros)

# Intallation
```bash
# update your system
sudo pacman -Syu

# needed drivers
sudo pacman -S alsa pulseaudio polkit polkit-gnome 

# packages needed by dotfiles
sudo pacman -S awesome neovim zsh kitty neofetch picom rofi sxhkd mdcat lsd bat spacefm firefox nitrogen git flameshot --needed

#for customize gtk and qt themes
sudo pacman -S qt5 lxappearance-gtk3

# Other programs
sudo pacman -S alsa-utils pavucontrol   gparted zathura keepassxc --needed
```
And the following packages from the AUR
```bash
paru -S vscodium onlyoffice-bin
```

# For auto numLock on
```bash
# numlock on in xorg server
numlockx
# numlock on in a tty
paru -S systemd-numlockontty
sudo systemctl enable numLockOnTty
```
[More info](https://wiki.archlinux.org/title/Activating_numlock_on_bootup_(Espa%C3%B1ol))


# For printers
```bash
sudo pacman -S cups cups-pdf system-config-printer
```
You have to search the specific packages-drivers for your printer [here](https://wiki.archlinux.org/title/CUPS), then you can install your printer

```bash
firefox --new-window http://localhost:631/

```
# Little guide to manage your dotfiles with a bare git repo

# Create your repo
create your repo in your `$HOME` directory:
```bash
mkdir $HOME/.dotfiles_repo #you mush have logged as your diary-user (not root)
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
dot-git checkout
```
run this
```bash
config --local status.showUntrackedFiles no
```


## More info about managing your dot files with a bare repo
* [Git Bare Repository - A Better Way To Manage Dotfiles - DT](https://www.youtube.com/watch?v=tBoLDpTWVOM)
* https://www.atlassian.com/git/tutorials/dotfiles