## Requirements

* Ubuntu >= 20.04

## Setup
```sh
make prerequisites-install
make ohmyzsh-install
make asdf-install
make docker-install
make docker-compose-install
make nvim-install
make dotfiles-install
```

### VIM

#### Main

* Switch ctrl and caps lock
* Use <kbd>ctrl + [</kbd> instead of <kbd>esc</kdb>

#### Moving between visible buffers

* `ctrl h` - move left or open new left split
* `ctrl l` - move right or open new right split
* `ctrl k` - move up or open new top split
* `ctrl j` - move down or open new bottom split
* `<leader> b` - show buffer list

#### File Tree

* `<leader><leader>` - toggle filetree

#### Searching

* `<leader> o` - fuzzy search (files under git)
* `<leader> ff` - fuzzy search (all files)
* `<leader> fa` - fuzzy search (content in files)
* `<leader> fc` - fuzzy search (commits in files)

#### Code editing and navigation

* `gcc` - toggle commenting
* `gj` - navigate through blocks of code - (), {}, [], etс
* `gf` - open a file corresponding to a word under the cursor
* `gd` - go to definition
* `]r` and `[r` - go through linter errors
* `<leader>y` & `<leader>p` Copy text to system clipboard
