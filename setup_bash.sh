ln -sf ${HOME}/.dotfiles/.bash_custom ${HOME}/.bash_custom

# Add source line to .bashrc if not already present
grep -qxF 'source ~/.bash_custom' ${HOME}/.bashrc || echo 'source ~/.bash_custom' >> ${HOME}/.bashrc
