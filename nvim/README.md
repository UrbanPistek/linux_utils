# Neovim 

Ubuntu
```
sudo apt install neovim
```

Create config folder 
```
cd ~/.config
mkdir nvim

nvim init.vim
```

Install plugin manager (vim-plug)
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Add plugins in `init.vim`
```
call plug#bgein()

Plug 'https://github.com/vim-airline/vim-airline'

call plug#end()
```

Install plugins in neovim with:
```
:PlugInstall
```

#### Tagbar Plugin
Error:
```
Tagbar: Exuberant ctags not found!                                                                                                  
Please download Exuberant Ctags from ctags.sourceforge.net and install it in a directory in your $PATH or set g:tagbar_ctags_bin.
Press ENTER or type command to continue
```

Fix: 
```
sudo apt install exuberant-ctags 
```

#### Coc Plugin

Install language specific module
```
:CocInstall coc-python
```

For python:
```
pip3 install jedi
```

#### Airline Plugin
Install powerline fonts
```
sudo apt install fonts-powerline
```

Install Fonts
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
