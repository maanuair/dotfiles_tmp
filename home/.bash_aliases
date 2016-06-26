# -*- mode: shell-script ;-*-
myInfo "Loading aliases..."

alias cp="cp -i"

alias df="df -h"
alias du="du -h"

alias egrep="egrep --color=auto"

alias fgrep="fgrep --color=auto"

alias grep="grep --color=auto"

# OS dependent aliases: emacs and colorized ls. Test the *BSD + Darwin "ls -G" color option vs GNU's one "ls --color=auto"
ls -G &> /dev/null &&\
  alias ls="ls -FG" &&\
  alias l="ls -aFG" &&\
  alias ll="ls -alhFG"\
  alias emacs=/Applications/Emacs.app/Contents/MacOS/Emacs
ls --color=auto &> /dev/null &&\
 alias ls="ls -F --color=auto" &&\
 alias l="ls -aF --color=auto" &&\
 alias ll="-alhF --color=auto"

alias mv="mv -i"

alias rm="rm -i"
