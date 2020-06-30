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

##### VENV
function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

return_prompt() {
   GIT_BRANCH=$(parse_git_branch)
   if [[ -n $GIT_BRANCH && $GIT_BRANCH == "(master)" ]]; then 
	PS1="\$(virtualenv_info)\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[1;31m\] \$(parse_git_branch)\[\033[00m\] $ "
   else
	PS1="\$(virtualenv_info)\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[1;30m\] \$(parse_git_branch)\[\033[00m\] $ "
   fi
}
export PROMPT_COMMAND=return_prompt

test -r /sw/bin/init.sh && . /sw/bin/init.sh

