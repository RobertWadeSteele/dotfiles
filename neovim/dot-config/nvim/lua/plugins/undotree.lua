return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
  keys = {
    { "<leader>ou", function() require("undotree").toggle() end, desc = "[O]pen [U]ndotree" }
  },
}
