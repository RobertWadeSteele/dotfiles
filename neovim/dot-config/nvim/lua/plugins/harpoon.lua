return {
  'ThePrimeagen/harpoon',
  opts = {},
  keys = {
    { "<leader>m",  function() require("harpoon.mark").add_file() end,        desc = "[M]ark file" },
    { "<leader>oh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "[O]pen [H]arpoon" },
    { "<M-h>",      function() require("harpoon.ui").nav_prev() end,          desc = "[H]arpoon Next" },
    { "<M-l>",      function() require("harpoon.ui").nav_next() end,          desc = "[H]arpoon Prev" },
    { "[h",         function() require("harpoon.ui").nav_prev() end,          desc = "[H]arpoon Next" },
    { "]h",         function() require("harpoon.ui").nav_next() end,          desc = "[H]arpoon Prev" },
  },
}
