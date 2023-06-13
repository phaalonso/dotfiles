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


## Install in a new system
 - https://www.atlassian.com/git/tutorials/dotfiles
 - https://news.ycombinator.com/item?id=11071754

Antes de começar garanta que o alias esteja presente no .bashrc or .zsh:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Adicione o repositório no .gitignore para evitar problemas estranhos de recursao:
```bash
echo ".cfg" >> .gitignore
```
Faça o clone do seu dotfiles em um repositório bare:
```bash
git clone --bare <git-repo-url> $HOME/.cfg
```
Configure o alias no shell atual:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
Realize checkout pro conteudo do seu repositório para o $HOME:
```bash
config checkout
```
Durante esse processo, pode ocorrer conflitos de arquivos. Nesse caso voce pode apagar manualemente, ou executar o seguinte script que ira mover tudo pra uma pasta de backup:
```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
Entao rode o checkout novamente
```bash
config checkout
```
Configure a flag para nao mostrar arquivos que nao estao no controle de versao:
```bash
config config --local status.showUntrackedFiles no
```

Exemplos:
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```
Again as a shortcut not to have to remember all these steps on any new machine you want to setup, you can create a simple script, store it as Bitbucket snippet like I did, create a short url for it and call it like this:

```bash
git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
