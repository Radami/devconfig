#Aliases 
alias ls='ls -GFh'
alias lsa='ls -a'
alias gvim='mvim'

#Exports

##### PATH
PATH=$PATH/Library/Frameworks/Python.framework/Versions/2.7/bin
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.4/bin
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH

###### Prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export CLICOLOR=1
# Set default colors
export LSCOLORS=ExFxBxDxCxegedabagacad

return_prompt() {
   GIT_BRANCH=$(parse_git_branch)
   if [[ -n $GIT_BRANCH && $GIT_BRANCH == "(master)" ]]; then 
        PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[1;31m\] \$(parse_git_branch)\[\033[00m\] $ "
    else
        PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[1;30m\] \$(parse_git_branch)\[\033[00m\] $ "
    fi
}
export PROMPT_COMMAND=return_prompt

test -r /sw/bin/init.sh && . /sw/bin/init.sh
