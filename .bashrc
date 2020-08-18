#!/usr/bin/bash

if [[ -r ~/.bash_aliases ]];then
    source ~/.bash_aliases
fi

if [[ -r ~/.zbash ]]; then
	source ~/.zbash
fi

export HISTIGNORE="&:?:??:history:fc *:pwd:clear: *"
