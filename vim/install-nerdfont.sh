#/bin/bash
# install Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip
unzip 0xProto.zip -d ~/.fonts
fc-cache -fv
echo "done!"
