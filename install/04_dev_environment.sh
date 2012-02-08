#!/usr/bin/env bash

sudo apt-get install -y -q vim-nox ack-grep
pushd $HOME
git clone --recursive https://github.com/pix0r/dotvim \
	&& rm -f .vimrc .vim \
	&& ln -s dotvim/vimrc .vimrc \
	&& ln -s dotvim .vim
popd

