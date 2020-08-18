#!/usr/bin/bash

if [[ -r ~/.bash_aliases ]];then
    source ~/.bash_aliases
fi

export HISTIGNORE="&:?:??:history:fc *:pwd:clear: *"
