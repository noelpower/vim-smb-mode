# vim-smb-mode
A plugin to make navigating around samba logs more useful. Inspired by Aurelien's emacs [smblog-mode](https://github.com/aaptel/smblog-mode)

# History
Although I am a vim user I am a very very poor and clueless one, I have to admit to using gvim mostly, I only know very basic vim shortcuts etc. However I know zero about emacs (and am too old to learn) I've seen Aureliens smblog-mode in action and it is incredibly useful. My employer [SUSE](https://www.suse.com/) encourages us to occasionally work on stuff to scratch an itch as part of [Hackweek](https://hackweek.suse.com/about) and one of the things I wanted to look at was how to better use vim and learn how to maybe get it to do some things that smblog-mode does.

# Features
Currently nothing much, as of right now all the plugin does is detect smbd log files and fold the log content based on the debug level of the messages. I hope to add some nice highlighting and some navigation features too (as I learn more)
Update:

## Settings

* `g:smblog_src_dir` Set this in your .vimrc to point to samba source directory (used by open debug file) Can be overwritten (see mappings below)
## Mappings

* `<leader>-`   Decreases debug level (and adjusts folding appropriately
* `<leader>+`   Increases debug level (and adjusts folding appropriately
* `<leader><cr>`Opens debug file at line
* `<leader>r`   Prompts for and overwrites current value of `g:smblog_src_dir`


# Installation
You need to have [pathogen](https://www.vim.org/scripts/script.php?script_id=2332) installed as the plugin is designed to work with it. Currently all you need to do is clone this repo under the `.vim/bundle` directory
