-- Reset to blinking underline cursor when leaving Neovim
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  callback = function()
    vim.opt.guicursor = "a:hor20-blinkon250-blinkoff250"
  end,
})
