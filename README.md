# 42header-neovim
42 header for neovim made with lua
![example](https://i.imgur.com/csSvrI3.png)

## How to use ?
So simple, there is two commands ":Header42" or F1 to insert the header and ":Update42" to update it (it does work automatically)

## Why?
Simple reason is because the official vim header is kinds old, headers for your favorite language? FUCK YOU for just thinking about it.
Well i just wanted to make a lua version of the 42 header, to get into vim plugin creation.

### Ill give you reasons to use this project 
	1. its made with lua
	2. works on windows (i really had to do it and im sorry about it linux nerds)		-- not tested yet
	3. includes your school not just made for 42 
	4. i meaaaaaaan if you didnt use it ill come after you and im not joking about it

### Why not use it 
	1. doesnt work on the classic vim or vi, who still uses vim and is vimscript a language anyways
	2. if youre afraid of getting a tig because the plugin isnt made by the 42 staff and if they spot you trust me you will get tiged 
	3. maybe you use vscode for some reason
	4. give me another reason to not ? huh ? huh? 

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

### Linux
Add this to your shell config (.bashrc or .zshrc)

```sh
export USER42="your_login"
export EMAIL42="school_email"
export SCHOOL42="school_name"				## example 42/1337 (optional)
```
### Windows
Open a powershell terminal and execute this as one command

```
set USER42="your_login"
set EMAIL42="school_email"
set SCHOOL42="school_name"				## example 42/1337
```

### Usage 
To add the header you can just `:header42` in normal mode 
Create keybinding by adding these lines to your vim init file

init.vim (vimscript users)
```
map <THE KEYBINDING YOU WANT> :header42<CR>
```

init.lua (lua users)
```
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<THE KEYBINDING YOU WANT>", ":header42<CR>",opts) 
```

