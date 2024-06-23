local null_ls = require('null-ls')
local opts = {
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.mypy.with({
			extra_args = { '--python-executable', 'python' },
		}),
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.formatting.eslint_d,
	}
}
null_ls.setup(opts)
