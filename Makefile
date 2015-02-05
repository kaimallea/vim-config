all:
	# Create neccesary bundle folder if it doesn't already exists
	[ -d ~/.vim/bundle ] || mkdir -p ~/.vim/bundle

	# Backup existing .vimrc if one exists
	[ ! -f ~/.vimrc ] || mv ~/.vimrc vimrc.backup

	# Clone Vundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	# Copy .vimrc
	cp vimrc.source ~/.vimrc

	# Update Bundles
	env GIT_SSL_NO_VERIFY=true vim +PluginInstall +qall

	$(MAKE) -f Makefile youcompleteme

youcompleteme:
	sudo apt-get install -y build-essential cmake python-dev
	cd ~/.vim/bundle/YouCompleteMe; ./install.sh

clean:
	# Cleanup what was created
	rm -rf ~/.vim/bundle/Vundle.vim
	[ ! -f vimrc.backup ] || cp vimrc.backup ~/.vimrc
