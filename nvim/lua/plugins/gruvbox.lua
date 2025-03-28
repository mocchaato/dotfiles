return {
  { --gruvbox
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = ...,
    name = "gruvbox",
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
