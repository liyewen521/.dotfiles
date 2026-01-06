ln -sf ${HOME}/.dotfiles/.bash_custom ${HOME}/.bash_custom
grep -qxF 'source ~/.bash_custom' ${HOME}/.bashrc || echo 'source ~/.bash_custom' >> ${HOME}/.bashrc

touch ${HOME}/.bash_custom_personal
grep -qxF 'source ~/.bash_custom_personal' ${HOME}/.bashrc || echo 'source ~/.bash_custom_personal' >> ${HOME}/.bashrc
echo "Add your personal setups in .bash_custom_personal..."
