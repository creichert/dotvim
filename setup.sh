#!/bin/sh

if [ $HOME/bin ]; then
    $(exec ln -s ${PWD}/generate_tags ~/bin/generate_tags)
fi

$(exec ln -s ${PWD}/vimrc ${HOME}/.vimrc)

