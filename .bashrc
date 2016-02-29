#!/bin/bash
# The Ultimate Bashrc file
# Maintained by Yuxuan Chen

# Customized Compiler Settings
export CC=clang
export CXX=clang++
export CFLAGS="-std=c11 -O2 -Wall"
export CXXFLAGS="-std=c++11 -O2 -Wall"
export LDLIBS="-lm"

#######################################################
# SOURCED ALIAS'S AND SCRIPTS
#######################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#######################################################
# EXPORTS
#######################################################

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=vim
export VISUAL=vim

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Alias's for SSH
# alias SERVERNAME='ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'

# Alias's to change the directory
alias web='cd /var/www/html'

# Alias's to mount ISO files
# mount -o loop /home/NAMEOFISO.iso /home/ISOMOUNTDIR/
# umount /home/NAMEOFISO.iso
# (Both commands done as root only.)

#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we preceed the command with a \
    # EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Edit this .bashrc file
alias ebrc='edit ~/.bashrc'

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias ls='ls -F'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='vim'
alias svi='sudo vim'
alias gvi='gvim'
alias vis='vim "+set si"'
alias e='emacs'
# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -aF'
alias ll='ls -lF'
# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# SHA1
alias sha1='openssl sha1'

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# Use the best version of pico installed
edit ()
{
    if [ "$(type -t jpico)" = "file" ]; then
        # Use JOE text editor http://joe-editor.sourceforge.net/
        jpico -nonotice -linums -nobackups "$@"
    elif [ "$(type -t nano)" = "file" ]; then
        nano -c "$@"
    elif [ "$(type -t pico)" = "file" ]; then
        pico "$@"
    else
        vim "$@"
    fi
}
sedit ()
{
    if [ "$(type -t jpico)" = "file" ]; then
        # Use JOE text editor http://joe-editor.sourceforge.net/
        sudo jpico -nonotice -linums -nobackups "$@"
    elif [ "$(type -t nano)" = "file" ]; then
        sudo nano -c "$@"
    elif [ "$(type -t pico)" = "file" ]; then
        sudo pico "$@"
    else
        sudo vim "$@"
    fi
}

# Extracts any archive(s) (if unp isn't installed)
extract () {
    for archive in $*; do
        if [ -f $archive ] ; then
            case $archive in
                *.tar.bz2)   tar xvjf $archive    ;;
                *.tar.gz)    tar xvzf $archive    ;;
                *.bz2)       bunzip2 $archive     ;;
                *.rar)       rar x $archive       ;;
                *.gz)        gunzip $archive      ;;
                *.tar)       tar xvf $archive     ;;
                *.tbz2)      tar xvjf $archive    ;;
                *.tgz)       tar xvzf $archive    ;;
                *.zip)       unzip $archive       ;;
                *.Z)         uncompress $archive  ;;
                *.7z)        7z x $archive        ;;
                *)           echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# Searches for text in all files in the current folder
ftext ()
{
    # -i case-insensitive
    # -I ignore binary files
    # -H causes filename to be printed
    # -r recursive search
    # -n causes line number to be printed
    # optional: -F treat search term as a literal, not a regular expression
    # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
    grep -iIHrn --color=always "$1" . | less -r
}

    # Show current network information
    netinfo ()
    {
        echo "--------------- Network Information ---------------"
        /sbin/ifconfig | awk /'inet addr/ {print $2}'
        echo ""
        /sbin/ifconfig | awk /'Bcast/ {print $3}'
        echo ""
        /sbin/ifconfig | awk /'inet addr/ {print $4}'

        /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
        echo "---------------------------------------------------"
    }

    # IP address lookup
    alias whatismyip="whatsmyip"
    function whatsmyip ()
    {
        # Dumps a list of all IP addresses for every device
        # /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

        # Internal IP Lookup
        echo -n "Internal IP: " ; /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

        # External IP Lookup
        echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q
    }

    # View Apache logs
    apachelog ()
    {
        if [ -f /etc/httpd/conf/httpd.conf ]; then
            cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
        else
            cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
        fi
    }

    # Edit the Apache configuration
    apacheconfig ()
    {
        if [ -f /etc/httpd/conf/httpd.conf ]; then
            sedit /etc/httpd/conf/httpd.conf
        elif [ -f /etc/apache2/apache2.conf ]; then
            sedit /etc/apache2/apache2.conf
        else
            echo "Error: Apache config file could not be found."
            echo "Searching for possible locations:"
            sudo updatedb && locate httpd.conf && locate apache2.conf
        fi
    }

    # Edit the PHP configuration file
    phpconfig ()
    {
        if [ -f /etc/php.ini ]; then
            sedit /etc/php.ini
        elif [ -f /etc/php/php.ini ]; then
            sedit /etc/php/php.ini
        elif [ -f /etc/php5/php.ini ]; then
            sedit /etc/php5/php.ini
        elif [ -f /usr/bin/php5/bin/php.ini ]; then
            sedit /usr/bin/php5/bin/php.ini
        elif [ -f /etc/php5/apache2/php.ini ]; then
            sedit /etc/php5/apache2/php.ini
        else
            echo "Error: php.ini file could not be found."
            echo "Searching for possible locations:"
            sudo updatedb && locate php.ini
        fi
    }

    # Edit the MySQL configuration file
    mysqlconfig ()
    {
        if [ -f /etc/my.cnf ]; then
            sedit /etc/my.cnf
        elif [ -f /etc/mysql/my.cnf ]; then
            sedit /etc/mysql/my.cnf
        elif [ -f /usr/local/etc/my.cnf ]; then
            sedit /usr/local/etc/my.cnf
        elif [ -f /usr/bin/mysql/my.cnf ]; then
            sedit /usr/bin/mysql/my.cnf
        elif [ -f ~/my.cnf ]; then
            sedit ~/my.cnf
        elif [ -f ~/.my.cnf ]; then
            sedit ~/.my.cnf
        else
            echo "Error: my.cnf file could not be found."
            echo "Searching for possible locations:"
            sudo updatedb && locate my.cnf
        fi
    }

    # For some reason, rot13 pops up everywhere
    rot13 () {
        if [ $# -eq 0 ]; then
            tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
        else
            echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
        fi
    }

    # Trim leading and trailing spaces (for scripts)
    trim()
    {
        local var=$@
        var="${var#"${var%%[![:space:]]*}"}"  # remove leading whitespace characters
        var="${var%"${var##*[![:space:]]}"}"  # remove trailing whitespace characters
        echo -n "$var"
    }

    #######################################################
    # Set the ultimate amazing command prompt
    #######################################################

    function __setprompt
    {
        local LAST_COMMAND=$? # Must come first!

        # Define colors
        local LIGHTGRAY="\033[0;37m"
        local WHITE="\033[1;37m"
        local BLACK="\033[0;30m"
        local DARKGRAY="\033[1;30m"
        local RED="\033[0;31m"
        local LIGHTRED="\033[1;31m"
        local GREEN="\033[0;32m"
        local LIGHTGREEN="\033[1;32m"
        local BROWN="\033[0;33m"
        local YELLOW="\033[1;33m"
        local BLUE="\033[0;34m"
        local LIGHTBLUE="\033[1;34m"
        local MAGENTA="\033[0;35m"
        local LIGHTMAGENTA="\033[1;35m"
        local CYAN="\033[0;36m"
        local LIGHTCYAN="\033[1;36m"
        local NOCOLOR="\033[0m"

        # Show error exit code if there is one
        if [[ $LAST_COMMAND != 0 ]]; then
            printf "${DARKGRAY}-LAST COMMAND ${LIGHTRED}RETURNED ${LIGHTRED}${LAST_COMMAND} ${DARKGRAY}//NON-ZERO EXIT CODE\n"
        fi

        PS1=""

        PS1+="\[${BLUE}\]\u\[${DARKGRAY}\]@\[${MAGENTA}\]\h"

        # Current directory
        PS1+="\[${DARKGRAY}\]:\[${LIGHTBLUE}\]\w\[$NOCOLOR\] "

        if [[ $EUID -ne 0 ]]; then
            PS1+="\[${BLUE}\]%\[${NOCOLOR}\] " # Normal user
        else
            PS1+="\[${RED}\]#\[${NOCOLOR}\] " # Root user
        fi

        # PS2 is used to continue a command using the \ character
        PS2="\[${CYAN}\]>\[${NOCOLOR}\] "

        # PS3 is used to enter a number choice in a script
        PS3='Please enter a number from above list: '

        # PS4 is used for tracing a script in debug mode
        PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
    }
    PROMPT_COMMAND='__setprompt'

