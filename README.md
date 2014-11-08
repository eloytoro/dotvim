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
- ii / ai: stands for inner indent and around indent
- io: strict indent selection
- ie: entire object (the whole document)
- il: inner line
- i\_ / a\_ / i. / a. / i, / a,: special character surroundings
- ]i / [i: transverses the document by indent level
###super-tab.vim (super-duper-tab)
Originally written by @junegunn
Adds tab completion to insert mode, compatible with UltiSnips expand tab key
