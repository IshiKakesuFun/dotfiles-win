local state, lspconfig, cmp_nvim_lsp, typescript, u
--------------------------------------------------------------------------------
-- https://github.com/neovim/nvim-lspconfig
--------------------------------------------------------------------------------
-- import plugin safely
state, lspconfig = pcall(require, "lspconfig")
if not state then
	return
end
--------------------------------------------------------------------------------
-- https://github.com/hrsh7th/cmp-nvim-lsp
--------------------------------------------------------------------------------
-- import plugin safely
state, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not state then
	return
end
--------------------------------------------------------------------------------
-- https://github.com/jose-elias-alvarez/typescript.nvim
--------------------------------------------------------------------------------
-- import plugin safely
state, typescript = pcall(require, "typescript")
if not state then
	return
end

-- import modul safely
state, u = pcall(require, "core.utils")
if not state then
	return
end

-- enable keybinds for available LSP servers
local on_attach = function(client, bufnr)
	-- normal
	u.set_buf_keymap(bufnr, "n", { noremap = true, silent = true }, {
		{ "gf", "<cmd>Lspsaga lsp_finder<CR>" }, -- show definition, references
		{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" }, -- go to declaration
		{ "gd", "<cmd>Lspsaga peek_definition<CR>" }, -- see definition and make edits in window
		{ "gi", "<cmd>lua vim.lsp.buf.implemetation()<CR>" }, -- go to implemetation
		{ "<Leader>ca", "<cmd>Lspsaga code_action<CR>" }, -- see available code actions
		{ "<Leader>rn", "<cmd>Lspsaga rename<CR>" }, -- smart rename
		{ "<Leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>" }, -- show diagnostics for line
		{ "<Leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>" }, -- show diagnostics for cursor
		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>" }, -- jump to previous diagnostic in buffer
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>" }, -- jump to next diagnostic in buffer
		{ "K", "<cmd>Lspsaga hover_doc<CR>" }, -- show documentation for what is under cursor
		{ "<Leader>o", "<cmd>LSoutlineToggle<CR>" }, -- toggle outline on the right hand
		{ "<leader>f", ":lua vim.lsp.buf.format({ async = true })<CR>" }, -- formating on demand
	})

	if client.name == "tsserver" then
		-- normal
		u.set_buf_keymap(bufnr, "n", { noremap = true, silent = true }, {
			{ "<Leader>rf", "<cmd>TypescriptRenameFile<CR>" }, -- rename file and update imports
			{ "<Leader>oi", "<cmd>TypescriptOrganizeImports<CR>" }, -- organize imports (not in youtube nvim video)
			{ "<Leader>ru", "<cmd>TypescriptRemoveUnused<CR>" }, -- remove unused variables (not in youtube nvim video)
		})
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = {
	Error = "", -- 0xf188
	Warn = "", -- 0xf421
	Info = "", -- 0xf41b
	Hint = "", -- 0xf400
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		root_dir = lspconfig.util.root_pattern("package.json"),
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure deno server
lspconfig["denols"].setup({
	root_dir = lspconfig.util.root_pattern("deno.json"),
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"html",
		"typescriptreact",
		"javascriptreact",
		"css",
		"sass",
		"scss",
		"less",
		"svelte",
	},
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[VIMRUNTIME_LUA] = true,
					[CONFIG_LUA] = true,
				},
			},
		},
	},
})
