return {
  "iagorrr/noctishc.nvim",
  lazy = false,
  name = "noctishc",
  config = function()
    vim.cmd.colorscheme "noctishc"
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#00FF00', bg = 'NONE' })
  end
}
