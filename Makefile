all: init brew nvim tig fish 

init:
	.bin/init.sh

brew:
	.bin/init_brew.sh

nvim:
	.bin/init_nvim.sh

tig:
	.bin/init_tig.sh

fish:
	.bin/init_fish.sh
