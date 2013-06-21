#!/bin/sh

STEP1=1
STEP2=1
STEP3=1


STARTDIR=`pwd`

if [ "$STEP1" = 1 ]; then
	echo ""
	echo "#####"
	echo "##### START STEP1 #####"
	echo "##### synboric link (.vimrc .vim/)"
	echo "#####"

	cd ~/.dotfiles/ && \
	ln -s .vimrc .vim ../ 

	RET=$?
	if [ "$RET" != 0 ]; then
		echo "ERROR STEP 1"
		exit 1
	fi
fi


if [ "$STEP2" = 1 ]; then
	echo ""
	echo "#####"
	echo "##### START STEP2 #####"
	echo "##### copy (.bashrc .bash_profile)"
	echo "#####"

	cp .bashrc .bash_profile ../ && \
	sudo cp .bash_profile.root /root/.bash_profile && \
	sudo cp .bashrc.root /root/.bashrc 

	RET=$?
	if [ "$RET" != 0 ]; then
		echo "ERROR STEP 1"
		exit 1
	fi
fi

if [ "$STEP3" = 1 ]; then
	echo ""
	echo "#####"
	echo "##### START STEP3 #####"
	echo "##### INSTALL VIM 7.3"
	echo "#####"

	sudo yum -y remove vim vim-enhanced && \
	sudo yum -y install ncurses-devel && \
	mkdir install_vim7.3/ && \
	cd ./install_vim7.3/ && \
	wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2 && \
	wget ftp://ftp.jp.vim.org/pub/vim/extra/vim-7.2-extra.tar.gz && \
	wget ftp://ftp.vim.org/pub/vim/extra/vim-7.2-lang.tar.gz &&\
	tar jxvf vim-7.3.tar.bz2  && \
	tar zxvf vim-7.2-extra.tar.gz && \
	tar zxvf vim-7.2-lang.tar.gz && \
	mv vim72 vim73/ && \
	cd vim73/src && \
	./configure --enable-multibyte --with-features=huge --disable-selinux --prefix='/usr/local/vim-7.3' && \
	sudo make install && \
    cd ~/.dotfiles/ &&\
	rm -fr install_vim7.3

	RET=$?
	if [ "$RET" != 0 ]; then
		echo "ERROR STEP 1"
		exit 1
	fi
fi

echo ""
echo "##### setup end #####"
