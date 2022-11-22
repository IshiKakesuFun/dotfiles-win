local status, null_ls
--------------------------------------------------------------------------------
-- https://github.com/jose-elias-alvarez/null-ls.nvim
--------------------------------------------------------------------------------
status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.deno_fmt.with({
			-- only enable deno fmt if root has deno.json
			condition = function(utils)
				return utils.root_has_file("deno.json")
			end,
		}),
		formatting.prettier.with({
			condition = function(utils)
				return not utils.root_has_file("deno.json")
			end,
		}),
		formatting.stylua,
		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
			end,
		}),
	},
})
