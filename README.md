# Dotfiles

![Terminal with termux](./screenshots/termial_with_termux.png)
![Screenshot 001](./screenshots/2022_06_20_001.png)

## Steps to setup a new linux using dotfiles

1. Install git

```bash
sudo apt-get install git
```

2. Clone repo into  hidden directory

```bash
# Use SSH (if set up)...
git clone git@github.com:phaalonso/dotfiles.git ~/dotfiles
# If not, use gitub url
git clone https://github.com/phaalonso/dotfiles.git ~/dotfiles
```

3. Create symlinks in the Home directory to the real files in the repo (remenber to change .gitconfig user and email)

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore.global ~/.gitignore.global

# Setup tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/dotfiles/tmux ~/.config/tmux
```
