if [ -d ~/.oh-my-zsh ]; then :; else
    echo "install oh-my-zsh"
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi


mkdir -p $HOME/.oh-my-zsh/themes
cp -n .oh-my-zsh/themes/mytheme.zsh-theme $HOME/.oh-my-zsh/themes/mytheme.zsh-theme

if [ "$REMOTE_CONTAINERS" = true ]; then # only in .devcontianer
    chsh -s /bin/zsh
else
    cp -n .gitconfig $HOME/.gitconfig
fi

if [ -e $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc_old-$(date "+%FT%T")
fi

cp .zshrc $HOME/.zshrc

zsh
