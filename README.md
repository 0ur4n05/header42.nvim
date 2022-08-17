# 42header-neovim
42 header for neovim made with lua

## Why?
Simple reason is because the official vim header is really old, comments for your favorite language? FUCK YOU for just thinking about it.
Well i just wanted to make a lua version of the 42 header and fucking accept all the pull requests that i can get not just ignore them, not all 42 students use vscode i use neoivm.

ill give you reasons to use this project 
1. its made with lua
2. works on windows (i really had to do it and im sorry about it linux nerds)
3. includes your school not just made for 42 
4. i meaaaaaaan if you didnt use it ill come after you  

why not use it 
1. doesnt work on the classic vim or vi, who still uses vim and is vimscript a language ??
2. if youre afraid of getting a tig because the plugin isnt made by the 42 staff and if they spot you trust me you will get tiged 
3. give me another reason to not ? huh ? huh? 


## Requirements
This plugin only works in Neovim 0.7 or newer.

## Installation :
### vim-plug
<details>
```vimscript
Plug '0ur4n05/42header.nvim'
```
</details>
### packer
<details>
```lua
use {"0ur4n05/42header.nvim", tag = 'v2.*', config = function()
  require("toggleterm").setup()
end}
```
</details>

Add this to your shell config (.bashrc or .zshrc)

```sh
user42="your_login"
email42="school_email"
school42="school_name"				## example 42/1337
```

### Usage 
To add the header you can just `:42header` in normal mode 
Create keybinding by adding these lines to your vim init file

init.vim (vimscript users)
```
map <THE KEYBINDING YOU WANT> :42header<CR>
```

init.lua (lua users)
```
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<THE KEYBINDING YOU WANT>", ":42header<CR>",opts) 
```

