return {
  "nickjvandyke/opencode.nvim",
  dependencies = {
    -- O LazyVim já tem o snacks.nvim, então apenas garantimos que ele esteja presente
    "folke/snacks.nvim",
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Sua configuração aqui (se necessário)
    }

    -- Necessário para o funcionamento de autoreload do plugin
    vim.o.autoread = true

    -- Atalhos recomendados pelo autor
    local opencode = require("opencode")

    vim.keymap.set({ "n", "x" }, "<C-a>", function() opencode.ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function() opencode.select() end, { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<C-.>", function() opencode.toggle() end, { desc = "Toggle opencode" })

    -- Operadores para adicionar código (usa expr = true para funcionar como operadores nativos)
    vim.keymap.set({ "n", "x" }, "go",  function() return opencode.operator("@this ") end,        { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n",          "goo", function() return opencode.operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

    -- Scroll dentro da janela do opencode
    vim.keymap.set("n", "<S-C-u>", function() opencode.command("session.half.page.up") end,   { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function() opencode.command("session.half.page.down") end, { desc = "Scroll opencode down" })

    -- Remapeia increment/decrement originais para + e - (já que C-a e C-x foram ocupados)
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
