-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("settings")
require("config.lsp_diagnostics")
require("config.diagnostics")
require("plugins.neotree")
require("config.theme")
require("lazy").setup({
  -- installer de dependências
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = { rocks = { "magick" } },
  },
  -- plugin image.nvim
  {
    "3rd/image.nvim",
    dependencies = { "vhyrro/luarocks.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty",         -- ou "ueberzug" se não usar Kitty
        processor = "magick_rock", -- ou "magick_cli"
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" },
          },
          neorg = { enabled = true, filetypes = { "norg" } },
          typst = { enabled = true, filetypes = { "typst" } },
          html = { enabled = false },
          css = { enabled = false },
        },
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false,
        tmux_show_only_in_active_window = false,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
      })
    end
  },
})

vim.api.nvim_create_user_command("ReloadConfig", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^config") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  print("Configuração recarregada!")
end, {})

