-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `ultisnips` user.
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<Esc>'] = cmp.mapping.close(),
  },
  sources = {
    { name = 'nvim_lsp' }, -- For nvim-lsp
    { name = 'ultisnips' }, -- For ultisnips user.
    { name = 'path' }, -- for path completion
    { name = 'emoji', insert = true, } -- emoji completion
  },
  completion = {
    keyword_length = 1,
    completeopt = "menu,menuone,noinsert"
  },
  experimental = {
    ghost_text = false
  }
})