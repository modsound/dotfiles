all: init brew nvim tig iterm2 defaults fish 

init:
	.bin/init.sh

brew:
	.bin/init_brew.sh

nvim:
	.bin/init_nvim.sh

tig:
	.bin/init_tig.sh

iterm2:
	/bin/init_iterm2.sh

defaults:
	/bin/init_defaults.sh

fish:
	.bin/init_fish.sh
