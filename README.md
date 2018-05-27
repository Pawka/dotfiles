# My Personal dotfiles

This repository stores a collection of my personal dotfiles. There are dotfiles
only - no other dependencies. It is safe to clone dotfiles on any machine and
install them. Installation will not bring any binaries. I install my
dependencies with scripts stored on [Pawka/laptop-setup](https://github.com/Pawka/laptop-setup) repository.


## Install

Installation will create symlinks on home directory pointing to files on
repository folder. 

``` sh
git clone https://github.com/Pawka/dotfiles ~/.dotfiles
cd ~/.dotfiles
make install
```

## Uninstall

Uninstalling dotfiles simply will remove previously created symlinks.

``` sh
make uninstall
```
