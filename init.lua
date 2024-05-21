vim.opt.backup=false
vim.opt.expandtab=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
        {"ribru17/bamboo.nvim", lazy = false, priority = 1000,
        config = function()
            require("bamboo").setup {
            }
            require("bamboo").load()
        end}
    },
    performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
