#!/usr/bin/bash

if [ -e .bash_aliases ];then
    source .bash_aliases
fi

export HISTIGNORE="&:?:??:history:fc *:pwd:clear: *"
