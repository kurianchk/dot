mk_auto(){
	curl -L http://ftpmirror.gnu.org/autoconf/autoconf-2.69.tar.gz autoconf.tar.gz
	tar -xvf autoconf.tar.gz
	cd autoconf*/
	./configure
	make
	make install
	cd ..
	rm -rf autconf
}

mk_gt(){
	curl -L https://github.com/git/git/archive/refs/tags/v2.40.1.zip -o git.zip
	unzip git.zip -d git
	cd git/*/
	make configure
	./configure
	make
	make install
}

mkvm(){
	if [ -z $1 ]
	then
		curl -L https://github.com/vim/vim/archive/refs/tags/v9.0.1506.zip -o vim.zip
	else
		curl -L $1 -o vim.zip
	fi
	unzip vim.zip -d vim
	cd vim/*/
	./configure  --with-features=huge \
		--enable-multibyte \
		--enable-rubyinterp \
		--enable-pythoninterp \
		--with-python-config-dir=/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11-config \
		--enable-perlinterp \
		--enable-luainterp \
		--enable-gui=gtk2 \
		--enable-cscope \
		--prefix=/usr/local
	make
	make install
}
