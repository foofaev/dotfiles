ANSIBLE_PREFIX := docker run -v $(HOME):/host/home -v $(CURDIR):/dotfiles -w /dotfiles williamyeh/ansible:ubuntu18.04 ansible-playbook -i local -vv

all: nvim-install dotfiles-install

TAGS := all

dotfiles-install:
	$(ANSIBLE_PREFIX) dotfiles.yml

nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/vimrc2 ~/.config/nvim/init.vim | true
	ln -s $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json | true
	ln -s $(PWD)/files/alacritty.yml ~/.config/alacritty/alacritty.yml | true

macos-prepare:
	brew install ripgrep fzf bat htop fd ncdu tldr httpie bash-completion
ubuntu-prepare:
	apt-get install ripgrep fzf bat htop fd ncdu tldr httpie bash-completion

font-install-linux:
	cp -R $(PWD)/files/font_jet_brains_mono/ ~/.fonts/
	sudo fc-cache -f -v

font-install-mac:
	cp -R $(PWD)/files/font_jet_brains_mono/ /System/Library/Fonts/
