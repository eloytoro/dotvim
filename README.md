##(dot)vim
My personal vim configuration for a (sane) daily dose of code hacking
Special thanks to @tpope and @junegunn for their tools & contributions

If you don't know anything about Vim I advice you tackle **vimtutor** before installing anything else.

##Why?
Vim is borderline paleolithic, and over the years changes have been so minimal that most versions only change stuff from the developer's view. And the reason behind this might be that it's so customizable that any change that creates an impact across all vim users would unavoidably conflict with their current configuration.
For that and many other reasons Vim offers the worst out-of-the-box experience for all new users.
And this is why your .vimrc should be heavily packed with plugins, settings and eyecandy just like mine is.

##Don't panic
Most of these changes aim towards intuitive modern text edition.
These plugins were cherry-picked among the plenthora that exist out there and I use it for all my non-IDE related work.

##/plugin
My plugin folder contains some custom tools that add some functionalities that only exist in this repo

###hl.vim
:HL shows the current highlight keyword, useful for altering colorschemes

###objects.vim
Written by @junegunn
Adds lots of useful vim objects for quick editing
- **ii** / **ai** stands for inner indent and around indent
- **io** strict indent selection
- **ie** entire object (the whole document)
- **il** inner line
- **i\_** / **a\_** / **i.** / **a.** / **i,** / **a,** special character surroundings
- **]i** / **[i** transverses the document by indent level

###super-tab.vim (super-duper-tab)
Originally written by @junegunn
Adds tab completion to insert mode, compatible with Neocomplete expand tab key

###grep.vim
Performs a grep for the given word across the current proyect and places the results in the location-list
Use `:Grep <keyword>`

##Quickstart
Lets go over some of the most important additions

###vim-easyclip
This plugin changes entirely the way vim's clipboard and yank registers work to a more sane alternative.
If you're really interested in _why_ this is necessary I suggest you read it's documentation and/or watch the vimcast about yank registers
Bascially the `m` key now stands for "move" and it cuts text into the yank registers, whereas `d`, `c` and `x` will only delete text.
It also rebinds the `s` key to a new motion called "substitution" which replaces the given object with the yank register content.

###vim-easymotion
Besides it's common functionality (and the fact that my leader is bind to space) I replaced vim's search engine `/` with easymotion's. It might take some time to get used to pressing enter when you finish typing the query.

###CtrlP
Remaps `?` to function definition search across the file.

###vim-signature
Remaps `$` as the new mark motion key.

###git
All git commands were mapped to the `<leader>g` motion.
