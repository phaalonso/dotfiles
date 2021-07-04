# Dotfiles



## Steps to setup a new linux using dotfiles

1. Install git

```bash
sudo apt-get install git
```

2. Clone repo into  hidden directory

```bash
# Use SSH (if set up)...
git clone git@github.com:phaalonso/dotfiles.git ~/.dotfiles
# If not, use gitub url
git clone https://github.com/phaalonso/dotfiles.git ~/.dotfiles
```

3. Create symlinks in the Home directory to the real files in the repo (remenber to change .gitconfig user and email)

```bash
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

