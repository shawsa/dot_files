#!/bin/bash

SRC=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

#FILE=.bashrc

ipython profile create vim

for FILE in .bashrc .toprc .vimrc .ipython/profile_vim/ipython_config.py .ipython/profile_vim/startup/imports.py
do
	if [[ -f ~/$FILE && ! -L ~/$FILE ]]; then
		echo "$FILE found, creating backup ~/$FILE.backup"
		mv ~/$FILE ~/$FILE.backup
	fi
	echo "Linking $SRC/$FILE to $~/$FILE"
	ln -fs $SRC/$FILE ~/$FILE
done
