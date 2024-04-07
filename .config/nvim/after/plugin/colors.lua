function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end


-- local night_owl = require("night-owl")

---- 👇 Add your own personal settings here
----@param options Config|nil
--night_owl.setup({
--    -- These are the default settings
--    bold = true,
--    italics = true,
--    underline = true,
--    undercurl = true,
--    transparent_background = false,
--})

ColorMyPencils('cyberdream')
