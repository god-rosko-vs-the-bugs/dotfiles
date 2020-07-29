#!/bin/bash
sudo pacman -Syy
echo "Installing fuse libfuse2 git python3-pip ack-grep wget"
sudo pacman -Sy fuse libfuse2 git python3-pip ack-grep wget curl yay
echo "Getting neovim"
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim && chmod +x nvim && sudo chown root:root nvim && sudo mv nvim /usr/bin
echo "Getting vimplug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user neovim
echo "getting ranger"
yay -Sy ranger-git
nvim_dir="~./config/nvim"
mkdir $nvim_dir
echo "Cloning Rosko's config"
git clone https://github.com/god-rosko-vs-the-bugs/nvim $nvim_dir
echo "Installing plugins"
nvim --headless +PlugInstall +q
#nim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
$HOME/.nimble/bin/nimble install nimlsp
$HOME/.nimble/bin/nimble install nimsuggest
$HOME/.nimble/bin/nimble install nico
#zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv $HOME/dotfiles/.zshrc $HOME/.zshrc
curl -L git.io/antigen > $HOME/antigen.zsh
chsh -s $(which zsh)
#alacrittyi
sudo pacman -Sy alacritty
mv $HOME/dotfiles/alacritty.yml  $HOME/.config/alacritty.yml
