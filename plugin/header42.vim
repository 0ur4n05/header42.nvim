" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    header42.vim                                       :+:      :+:    :+:    "
"    Description:  A plugin that manage 42 headers    +:+ +:+         +:+      "
"    By: mlalama <mlalama@student.42.fr>            +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/08/17 02:54:08 by mlalama           #+#    #+#              "
"    Updated: 2022/08/17 03:28:11 by mlalama          ###   ########.fr        "
"                                                                              "
" **************************************************************************** "
"
" Maintainer:   0ur4n05 <https://github.com/0ur4n05/header42.nvim>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:header42")
    finish
endif
let g:loaded_exampleplugin = 1

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 Header42 lua require("header42").header42()
command! -nargs=0 Update42 lua require("header42").update42()
