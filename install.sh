#!/bin/bash

SRC=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

#FILE=.bashrc
for FILE in .bashrc .toprc .vimrc
do
	if [[ -f ~/$FILE && ! -L ~/$FILE ]]; then
		echo "$FILE found, creating backup ~/$FILE.backup"
		mv ~/$FILE ~/$FILE.backup
	fi
	echo "Linking $SRC/$FILE to $~/$FILE"
	ln -fs $SRC/$FILE ~/$FILE
done
