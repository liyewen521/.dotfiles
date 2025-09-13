apt update
apt install -y tmux vim htop
# apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel9k

cd .dotfile

ln -sf ${HOME}/.dotfiles/.vimrc ${HOME}/.vimrc

ln -sf ${HOME}/.dotfiles/.tmux.conf ${HOME}/.tmux.conf

ln -sf ${HOME}/.dotfiles/.zshrc ${HOME}/.zshrc