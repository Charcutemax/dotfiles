return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local TS = require('nvim-treesitter')
        TS.setup({
            install_dir = vim.fn.stdpath('data') .. '/site',
            highlight = { enable = true },
            indent = { enable = true },
        })
        TS.install({
            'lua',
            'c',
            'rust',
            'haskell',
            'bash',
            'zsh',
            'fish',
            'python',
            'json',
            'xml',
            'gdscript',
            'markdown'
        })
    end
}
