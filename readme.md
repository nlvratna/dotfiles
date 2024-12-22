These are my present dotfiles 


I am using zsh as my shell to setup zsh 

``` sudo apt install zsh ```

and after installing that  I need to do this 

``` 
chsh -s $(which zsh)

echo $SHELL
``` 
this set's up shell to be zsh and checks  the shell 


install oh-my-zsh

``` sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```


I need to stow to setup link

``` sudo apt install stow```
