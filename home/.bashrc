##############
### Common ###
##############

#Encoding
export LANG=UTF8
#Prompt color
source ~/.bash/.git-prompt.sh
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n$ '
#Bash history controll
export HISTCONTROL=ignoredups:erasedups

##########################
### for each platforms ###
##########################

#Mac
if [ "$(uname)" == 'Darwin' ]; then
  #Dir color
  eval $(gdircolors ~/.iterm2/color/dircolor/dircolors-solarized/dircolors.ansi-universal)
  #Arduino
  alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
  #Color of ls command
  alias grep='grep --color'
  alias ls='gls -F --color=auto'
  alias la='gls -F --color=auto -a'
  alias ll='gls -F --color=auto -l'
  alias lal='gls -F --color=auto -la'
  #Use vim's less.sh instead of less command
  alias less="/usr/share/vim/vim74/macros/less.sh"
  :

#Linux
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  #Dir color(tmp)
  eval $(dircolors ~/.mintty/dircolors-solarized/dircolors.ansi-universal)
  #Color of ls command
  alias grep="grep --color"
  alias ls="ls -F --color=auto"
  alias la="ls -F --color=auto -a"
  alias ll="ls -F --color=auto -l"
  alias lal="ls -F --color=auto -la"
  #Use vim's less.sh instead of less command
  alias less="/usr/share/vim/vim74/macros/less.sh"
  :

#Git for Windows
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then 
  #Dir color
  eval $(dircolors ~/.mintty/color/dircolor/dircolors-solarized/dircolors.ansi-universal)
  #Color of ls command
  alias grep="grep --color"
  alias ls="ls -F --color=auto"
  alias la="ls -F --color=auto -a"
  alias ll="ls -F --color=auto -l"
  alias lal="ls -F --color=auto -la"
  #Use vim's less.sh instead of less command
  alias less="/usr/share/vim/vim80/macros/less.sh"
  #Cygstart
  alias open="cygstart"
  #Convert encoding ipconfig in windows
  alias ipconfig="ipconfig | nkf -w"
  :

#Other
else
  :

fi

