return {

  "preservim/nerdcommenter",
  keys = {
    { "<leader>kc", ":call NERDComment(0, 'sexy')<CR>", { noremap = true, silent = true } },
    { "<leader>ku", ":call NERDComment(0, 'uncomment')<CR>", { noremap = true, silent = true } },
    { "<leader>kt", ":call NERDComment(0, 'toggle')<CR>", { noremap = true, silent = true } },
  },
  init = function()
    vim.cmd("let g:NERDCreateDefaultMappings = 0")
  end,
}
