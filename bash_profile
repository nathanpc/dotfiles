#!/usr/bin/env bash

# TODO: Organize the PATH.
export PATH=/opt/microchip/xc8/v1.12/bin:/opt/microchip/xc8/v1.12/bin:/home/nathanpc/.rbenv/bin:./node_modules/.bin:"/opt/Sublime Text 2/":/opt/AndroidSDK/sdk/platform-tools:/opt/AndroidSDK/sdk/tools:/opt/microchip/xc8/v1.12/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/nathanpc/.gem/ruby/1.8/bin:/opt/nginx/sbin:/home/nathanpc/.bash_it/plugins/available/todo:$PATH

# CCL
export CCL_DEFAULT_DIRECTORY=/opt/ccl

# Pretty startup logo.
/opt/screenfetch/screenfetch-dev

# Set the terminal title.
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'


###########
# bash_it #
###########

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="gvim"
export GIT_EDITOR='gvim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK


# Change this to your console based IRC client of choice.

export IRC_CLIENT="xchat"

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh
