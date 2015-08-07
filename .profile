# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

PATH=${PATH}:/usr/local/git/bin:~/bin:/opt/bin:opt/sbin:/opt/local/bin:/opt/local/sbin
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH:$HOME/bin/terraform"
fi

if [ -d "$HOME/code/go/bin" ]; then
    PATH="$PATH:$HOME/code/go/bin"
fi

if [ -d "/var/vcap/bosh/bin" ]; then
	PATH="/var/vcap/bosh/bin:$PATH"
fi

if [ -f "$HOME/bin/setup_ssh_agent" ]; then
	. "$HOME/bin/setup_ssh_agent"
fi

export GOPATH=$HOME/code/go

if [[ ! -d $HOME/.vim/bundle/vim-go ]]; then
	git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
fi
