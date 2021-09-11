prerequisites-install:
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(shell lsb_release -cs) main"
	apt-get update
	apt-get install -yy git curl zsh make htop ncdu tldr httpie exuberant-ctags terraform-ls

ohmyzsh-install:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

asdf-install:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

docker-install:
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh ./get_docker.sh
	sudo groupadd docker
	sudo usermod -aG docker $(USER)
	newgrp docker 

docker-compose-install:
	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

nvim-install:
	mkdir -p ~/.config/nvim
	ln -sf $(PWD)/home_folder/vimrc ~/.config/nvim/init.vim
	ln -sf $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json
	ln -snf $(PWD)/files/vim-ftplugins ~/.config/nvim/ftplugin

nvim-install:
	ln -s $(PWD)/home_folder/.config/nvim ~/.config/nvim | true

dotfiles-install:
	 docker run --rm -e RUNNER_PLAYBOOK=dotfiles.yml -v $(HOME):/host/home -v $(CURDIR):/runner/project ansible/ansible-runner
