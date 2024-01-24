![chezmoi](https://img.shields.io/badge/chezmoi-enabled-blue)
![macos](https://img.shields.io/badge/macos-enabled-green)
![wsl](https://img.shields.io/badge/wsl-enabled-cyan)
![codespaces](https://img.shields.io/badge/codespaces-enabled-black)

Welcome to my dotfiles! These are my files that I run between mac OS, Ubuntu, WSL, and GitHub codespaces.

I use [Homebrew]() to manage dependencies across both systems and manage the deps within a [Brewfile]().


## Dispatch

| Command      | Description                          |
|--------------|--------------------------------------|
| '<leader>di' | Update file and run dispatch command |

## Mini

| Command             | Description                               |
|--------------       |--------------------------------------     |
| 'ga<char>'          | Aligns visual block with given <char>     |
| 'gc'                | Comments out visual block                 |
| 'sr<find><replace>' | Replace surrounding <find> with <replace> |
| '<leader>tw'        | Remove trailing whitespace                |

## LSP

| Command             | Description                               |
|--------------       |--------------------------------------     |
| 'gD'                | goto declaration                          |
| 'gd'                | goto definition                           |
| 'K'                 | hover                                     |
| 'gi'                | goto implementation                       |
| '<C-k>'             | goto signature help                       |
| '<space>wa'         | Add workspace folder                      |
| '<space>wr'         | Remove workspace folder                   |
| '<space>wl'         | List workspace folders                    |
| '<space>D'          | goto type definition                      |
| '<space>rn'         | run rename                                |
| '<space>ca'         | run code action                           |
| 'gr'                | goto references                           |
| '<space>f'          | run format                                |


## Rhubarb

| Command      | Description                          |
|--------------|--------------------------------------|
| '<leader>gB' | Open code in GitHub                  |


## Telescope

| Command      | Description                  |
|--------------|------------------------------|
| '<leader>ff' | Find files by name           |
| '<leader>fg' | Grep(rg) for contents        |
| '<leader>fb  | find active buffers          |
| '<leader>fh' | search vimdocs(help)         |
| '<leader>fm' | search all marks             |
| '<leader>gd' | search all LSP definitions   |
| '<leader>fd' | search diagnostics           |
| '<leader>ft' | search all tags(treesitter)  |
| '<leader>fc' | search colorschemes and pick |
