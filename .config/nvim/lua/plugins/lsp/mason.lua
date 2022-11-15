local state, mason, mason_lsp, mason_null_ls
--------------------------------------------------------------------------------
-- https://github.com/williamboman/mason.nvim
--------------------------------------------------------------------------------
-- import plugin safely
state, mason = pcall(require, "mason")
if not state then
	return
end
--------------------------------------------------------------------------------
-- https://github.com/williamboman/mason-lspconfig.nvim
--------------------------------------------------------------------------------
-- import plugin safely
state, mason_lsp = pcall(require, "mason-lspconfig")
if not state then
	return
end
--------------------------------------------------------------------------------
-- https://github.com/jayp0521/mason-null-ls.nvim
--------------------------------------------------------------------------------
-- import plugin safely
state, mason_null_ls = pcall(require, "mason-null-ls")
if not state then
	return
end

mason.setup()

mason_lsp.setup({
	-- A list of servers to automatically install if they're not already
	-- installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
	-- This setting has no relation with the `automatic_installation` setting.
	ensure_installed = {
		"sumneko_lua",
		"tsserver",
		"cssls",
		"tailwindcss",
		"html",
		"rust_analyzer",
		"denols",
		"yamlls",
		"taplo",
		-- "sqlls",
		"jdtls",
		"jsonls",
		"dockerls",
		"bashls",
		"csharp_ls",
		"angularls",
		"gopls",
		"graphql",
		"prismals",
		"vimls",
		"emmet_ls",
	},
	-- Whether servers that are set up (via lspconfig) should be automatically
	-- installed if they're not already installed.
	-- This setting has no relation with the `ensure_installed` setting.
	-- Can either be:
	--   - false: Servers are not automatically installed.
	--   - true: All servers set up via lspconfig are automatically installed.
	--   - { exclude: string[] }: All servers set up via lspconfig, except the
	--       ones provided in the list, are automatically installed.
	--       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	automatic_installation = false,
})

mason_null_ls.setup({
	ensure_installed = {
		"deno_fmt",
		"prettier",
		"stylua",
		"eslint_d",
		-- "sql_formatter",
		-- "sqlfluff", -- requires pip3 to install via Mason
	},
	automatic_installation = false,
})
