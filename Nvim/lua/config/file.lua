vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- https://neovim.io/doc/user/lua.html#vim.filetype.add()
vim.filetype.add({
  pattern = {
    ["/home/samuel/.confing/fish/*"] = "sh",
    ["/home/samuel/.config/kitty/*"] = "sh",
  },
})
