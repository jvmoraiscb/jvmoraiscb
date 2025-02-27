#!/bin/bash

# saves current directory
current_directory=$PWD

# update default packages
sudo -v
sudo pacman --noconfirm -Syyuu

# install https://github.com/Jguer/yay
sudo -v
sudo pacman --noconfirm -S git base-devel
cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm

# install https://github.com/romkatv/powerlevel10k
sudo -v
yay --noconfirm -S zsh zsh-theme-powerlevel10k-git ttf-meslo-nerd-font-powerlevel10k powerline-fonts awesome-terminal-fonts
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

# install https://github.com/zsh-users/zsh-autosuggestions
sudo -v
mkdir ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'HISTFILE=~/.zsh_history' >> ~/.zshrc
echo 'HISTSIZE=10000' >> ~/.zshrc
echo 'SAVEHIST=10000' >> ~/.zshrc
echo 'setopt appendhistory' >> ~/.zshrc

# install https://github.com/sharkdp/bat and https://github.com/ogham/exa
sudo -v
yay --noconfirm -S cargo
cargo install bat exa
echo 'export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH' >> ~/.zshrc

# copy config files
cp $current_directory/config-files/p10k.config.sh ~/.p10k.zsh
cat $current_directory/config-files/alias.config.sh >> ~/.zshrc

# change default shell to zsh for current user
sudo -v
chsh -s /usr/bin/zsh
