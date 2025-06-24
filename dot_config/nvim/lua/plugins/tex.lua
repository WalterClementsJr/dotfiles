return {
  "lervag/vimtex",
  tag = "v2.16",
  lazy = false,
  init = function()
    vim.g.tex_conceal = "abdmg"
    vim.g.vimtex_view_method = "zathura"
  end,
}
