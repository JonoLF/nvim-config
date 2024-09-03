local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    use{
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = {
            {
                'nvim-lua/plenary.nvim',
                'nvim-treesitter/nvim-treesitter',
                'nvim-tree/nvim-web-devicons'
            }
        }
    }
    --use {
    --    "nvim-telescope/telescope-file-browser.nvim",
    --    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    --}
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                background = {
                    light = "mocha",
                    dark = "mocha",
                },
                transparent_background = false,
                term_colors = true,
                no_italic = false,
                no_bold = false,
                no_underline = false,
                styles = {
                    comments = {"italic"},
                    conditionals = {},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                default_integrations = true,
                integrations = {
                    treesitter = true,
                    treesitter_context = true,
                    telescope = {
                        enabled = true,
                    },
                    harpoon = true,
                    markdown = true,
                    mason = true,
                    cmp = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    lsp_trouble = true,
                    which_key = true,
                    diffview = true,
                },
            })
        end
    })
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })


    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = {
            {"nvim-lua/plenary.nvim"}, 
        }
    }
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("nvim-treesitter/nvim-treesitter-context");
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
        }
    }

    use("folke/zen-mode.nvim")
    use("tpope/vim-repeat")
    --use{
    --    "ggandor/leap.nvim",
    --    requires = {
    --        {"tpope/vim-repeat"},
    --    },
    --    config = function()
    --        require("leap")
    --        vim.keymap.set({'n'}, '<leader>gs', '<Plug>(leap-from-window)')
    --        vim.keymap.set({'n'}, '<leader>s', '<Plug>(leap-forward)')
    --        vim.keymap.set({'n'}, '<leader>S', '<Plug>(leap-backward)')
    --    end
    --}
    use({
        "kylechui/nvim-surround",
        -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
    }
    use "sindrets/diffview.nvim" 
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use("f-person/git-blame.nvim")
    use{"stevearc/dressing.nvim"}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            --"ibhagwan/fzf-lua",              -- optional
        },
        config = true
    }
    use({
        "stevearc/oil.nvim",
    })
end)

