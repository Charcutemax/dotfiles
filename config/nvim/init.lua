require("milico")
require("config.lazy")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 
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
      'gdscript'
  },
  callback = function() vim.treesitter.start() end,
})
