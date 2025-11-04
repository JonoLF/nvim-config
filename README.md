# Getting started
Cloning the repo:
```
mkdir -p ~/.config/nvim
cd ~/.config/nvim/
gh repo clone JonoLF/nvim-config
```
Setup steps:
```
./nvim_install &&\
./setup
```
> Note: requires the [GITHUB CLI](https://cli.github.com/)

> Note: having nerdfonts installed on your system will make things look much better, I recommend FiraCode

# Terminal setup

I use [kitty](https://sw.kovidgoyal.net/kitty/) which supports nerd fonts nicely. I might move to [ghostty](https://ghostty.org/) in the future.
My current `kitty.conf`:

```conf
font_family FiraCode Nerd Font
disable_ligatures never
background #1E1E2E
font_size 12.0
```

# Tmux setup
Everything is better with [tmux](https://github.com/tmux/tmux/wiki), here is my tmux setup, which just uses [catpuccin](https://github.com/catppuccin) to make things consistent with the actual nvim colours I have setup:

```conf
### GENERAL OPTIONS
bind c new-window   -c "#{pane_current_path}"
bind % split-window   -h -c "#{pane_current_path}"
bind '"' split-window -v -c "#{pane_current_path}"
set-window-option -g automatic-rename off
set-window-option -g mode-keys vi
set-option -sg escape-time 10
set-option -a terminal-features 'xterm-256color:RGB'
set-option -g focus-events on

### PLUGINS
set -g @plugin 'tmux-plugins/tpm'
## COLOURS
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'tmux-plugins/tpm'

run -b '~/.tmux/plugins/tpm/tpm'
```

# Plugins used
- [nvim-lspconfig](https://github.com/nvim-treesitter/nvim-treesitter-context)A
- [mason](https://github.com/mason-org/mason.nvim)
- [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [plenary](https://github.com/nvim-lua/plenary.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [catpuccin/nvim](https://github.com/catppuccin/nvim)
- [trouble](https://github.com/folke/trouble.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- [refactoring](https://github.com/ThePrimeagen/refactoring.nvim)
    - this one is still a work in progress, so still playing around with it
- [undotree](https://github.com/mbbill/undotree)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [zen-mode](https://github.com/folke/zen-mode.nvim)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [which-key](https://github.com/folke/which-key.nvim)
- [diffview](https://github.com/sindrets/diffview.nvim)
- [git-blame](https://github.com/f-person/git-blame.nvim)
- [neogit](https://github.com/NeogitOrg/neogit)
- [mini](https://github.com/nvim-mini/mini.nvim)
- [oil](https://github.com/stevearc/oil.nvim)
- [vimtex](https://github.com/lervag/vimtex)
