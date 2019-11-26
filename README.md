# Dotfiles
My dotfiles for Linux with i3-gaps.

Copy files to your home directory:
```
git clone --separate-git-dir=$HOME/.dots https://github.com/s9p0b/dotfiles.git $HOME/dots-tmp
cp ~/dots-tmp/.* ~ 
rm -r ~/dots-tmp/
```

Set up vsc tracking for dotfiles:
```
alias config='/usr/bin/git --git-dir=$HOME/.dots --work-tree=$HOME'
config config status.showUntrackedFiles no
source ~/.zshrc
```
