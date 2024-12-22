These are my present dotfiles 


install zsh if not there
``` 
sudo apt install zsh 
```


and after installing that  I need to do this 

``` 
chsh -s $(which zsh)

echo $SHELL
``` 
this set's up shell to be zsh and checks  the shell 


install oh-my-zsh

``` 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Auto suggestions plugin

``` 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
```

zsh syntax highlighting

``` 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

```

tmux installtion 


```  
sudo apt install tmux

```


I need to stow to setup link

``` 
sudo apt install stow

```

fzf 

``` 
sudo apt install fzf

```

zoxide 

``` 
curl -sSfL https://rawthubusercontent.com/ajeetdsouza/zoxide/main/tall.sh | sh

```
