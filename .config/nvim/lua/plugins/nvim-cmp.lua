--------------------------------------------------------------------------------
-- https://github.com/hrsh7th/nvim-cmp
--------------------------------------------------------------------------------
-- import plugin safely
local state, cmp = pcall(require, "cmp")
if not state then
	return
end

--------------------------------------------------------------------------------
-- https://github.com/L3MON4D3/LuaSnip
--------------------------------------------------------------------------------
-- import plugin safely
local state, luasnip = pcall(require, "luasnip")
if not state then
	return
end

--------------------------------------------------------------------------------
-- https://github.com/rafamadriz/friendly-snippets
--------------------------------------------------------------------------------
require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

--------------------------------------------------------------------------------
-- https://github.com/onsails/lspkind.nvim
--------------------------------------------------------------------------------
-- import lspkind plugin safely
local status, lspkind = pcall(require, "lspkind")
if not status then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  }, 
  mapping = cmp.mapping.preset.insert({ 
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item. 
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = false }), 
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- lsp
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'buffer' }, -- text within current buffer
    { name = 'path' }, -- file system paths
  }),
  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
