# for prompt color
source ~/.bash/.git-prompt.sh
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\] $ '

# for dir color
eval $(gdircolors ~/.iterm2/color/dircolor/dircolors-solarized/dircolors.ansi-universal)

# for arduino
alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'

# for ls*
alias ls='gls --color=auto'
alias la='gls --color=auto -a'
alias ll='gls --color=auto -l'
alias lal='gls --color=auto -a -l'
alias lla='gls --color=auto -a -l'

