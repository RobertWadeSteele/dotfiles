return {
  'folke/which-key.nvim',
  config = function()
    require("which-key").add({
      { "<leader>c", group = "[C]ode" },
      { "<leader>g", group = "[G]it" },
      { "<leader>h", group = "[H]arpoon" },
      { "<leader>r", group = "[R]un" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>l", group = "[L]SP"},
      { "<leader>",  desc = "VISUAL <leader>", mode = 'v' },
      { "<leader>h", desc = "Git [H]unk",      mode = 'v' }
    })
  end
}
