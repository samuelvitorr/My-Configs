return {

    -- Image.nvim usando ImageMagick do sistema (SEM luarocks)
    {
        "3rd/image.nvim",
        config = function()
            require("image").setup({
                backend = "kitty", -- ou "ueberzug" se não usar Kitty
                processor = "magick_cli", -- 🔥 usa ImageMagick do sistema

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
                },

                max_height_window_percentage = 50,
                window_overlap_clear_enabled = true,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs" },
                editor_only_render_when_focused = true,
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
            })
        end,
    },

    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            filesystem = {
                follow_current_file = { enabled = true },
                hijack_netrw_behavior = "open_current",
            },
        },
    },
}
