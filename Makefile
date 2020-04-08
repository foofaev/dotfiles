nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/vimrc ~/.config/nvim/init.vim | true
	ln -s $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json | true

macos-prepare:
	brew install ripgrep fzf bat htop fd ncdu tldr httpie bash-completion
ubuntu-prepare:
	apt-get install ripgrep fzf bat htop fd ncdu tldr httpie bash-completion

font-install-linux:
	cp -R $(PWD)/files/font_jet_brains_mono/ ~/.fonts/
	sudo fc-cache -f -v

font-install-mac:
	cp -R $(PWD)/files/font_jet_brains_mono/ /System/Library/Fonts/
