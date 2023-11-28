vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local jono_fugitive = vim.api.nvim_create_augroup("jono_fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = jono_fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- merge always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--merge'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);

        vim.keymap.set("n", "<leader>com", ":Git commit -am ", opts);

        -- diff branch to branch merging into into current branch
        vim.keymap.set("n", "<leader>dm", ":Git diff ", opts);
    end,
})
