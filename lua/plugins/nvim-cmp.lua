return {
  "hrsh7th/nvim-cmp",
  -- optional = true,
  dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        sources = {
            { name = "nvim_lsp" },  -- Primary source for Pyright
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
        -- formatting = {
        --     format = lspkind.cmp_format({
        --         mode = "symbol_text",
        --         maxwidth = 50,
        --         ellipsis_char = "...",
        --         show_labelDetails = true,
        --     }),
        -- },
    })
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
end,
  -- stylua: ignore
  keys = {
    { "<C-j>", function() require("luasnip").jump(1) end, mode = {"i", "s" } },
    { "<C-l>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}
