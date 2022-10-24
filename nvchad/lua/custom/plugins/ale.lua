vim.api.nvim_exec([[
 let g:ale_fixers = {
   \ '*': ['remove_trailing_lines', 'trim_whitespaces'],
   \ 'javascript': ['eslint'],
   \ 'typescript': ['eslint'],
   \ 'json': ['jq'],
   \}
]], false)
