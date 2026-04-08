" IF KITTY OR TMUX IS USED:
let g:jukit_shell_command = 'ipython'
let g:jukit_terminal = 'tmux'
"
"   - Terminal to use. Can be one of '', 'kitty', 'vimterm', 'nvimterm' or 'tmux'. If '' is given then will try to detect terminal (though this might fail, in which case it simply defaults to 'vimterm' or 'nvimterm' - depending on the output of `has("nvim")`)
"
" let g:jukit_inline_plotting = 1
"    - Enable in-terminal-plotting. Only supported for kitty or tmux+iTerm2 -> BE SURE TO SPECIFY THE TERMINAL VIA `g:jukit_terminal`! (see variables in section 'Basic jukit options')
"    - Not working yet.
" - must run: pip install imgcat
" plotting code here: ~/.local/share/nvim/plugged/vim-jukit/autoload/jukit/
" and here: ~/.local/share/nvim/plugged/vim-jukit/helpers/imgcat/imgcat.py
"
" KITTY SETTINGS
" let g:jukit_terminal = 'kitty'
let g:jukit_inline_plotting = 1
"
" ###### Split layout
" ```vim
" You can define a custom split layout as a dictionary, the default is:
let g:jukit_layout = {
    \'split': 'horizontal',
    \'p1': 0.5,
    \'val': [
        \'file_content',
        \{
            \'split': 'vertical',
            \'p1': 0.5,
            \'val': ['output', 'output_history']
        \}
    \]
\}

" this results in the following split layout:
"  ______________________________________
" |                      |               |
" |                      |               |
" |                      |               |
" |                      |               |
" |                      |     output    |
" |                      |               |
" |                      |               |
" |    file_content      |               |
" |                      |_______________|
" |                      |               |
" |                      |               |
" |                      | output_history|
" |                      |               |
" |                      |               |
" |______________________|_______________|
"
" The positions of all 3 split windows must be defined in the dictionary, even if
" you don't plan on using the output_history split.
"
" dictionary keys:
" 'split':  Split direction of the two splits specified in 'val'. Either 'horizontal' or 'vertical'
" 'p1':     Proportion of the first split specified in 'val'. Value must be a float with 0 < p1 < 1
" 'val':    A list of length 2 which specifies the two splits for which to apply the above two options.
"           One of the two items in the list must be a string and one must be a dictionary in case of
"           the 'outer' dictionary, while the two items in the list must both be strings in case of
"           the 'inner' dictionary.
"           The 3 strings must be different and can be one of: 'file_content', 'output', 'output_history'
"
" To not use any layout, specify `let g:jukit_layout=-1`
" ```
