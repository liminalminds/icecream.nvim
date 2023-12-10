---@alias Variant "main" | "moon" | "dawn"
---@alias Color { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean }

local M = {}

---@class Options
M.options = {
	---Set the desired variant: "auto" will follow the vim background,
	---defaulting to "main" for dark and "dawn" for light. To change the dark
	---variant, use `options.dark_variant = "moon"`.
	---@type "auto" | Variant
	variant = 'main',

	---Set the desired dark variant: applies when `options.variant` is set to
	---"auto" to match `vim.o.background`.
	---@type Variant
	dark_variant = 'main',

	bold_vert_split = false,

	dim_nc_background = false,

	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	groups = {
		background = 'dark_chocolate',
		background_nc = 'chocolate',
		panel = 'light_chocolate',
		panel_nc = 'dark_chocolate',
		border = 'highlight_med',
		comment = 'brownie',
		link = 'vanilla_1',
		punctuation = 'brownie',
		error = 'strawberry',
		hint = 'vanilla_1',
		info = 'pistachio_2',
		warn = 'mango_1',
		git_add = 'pistachio_2',
		git_change = 'rose',
		git_delete = 'strawberry',
		git_dirty = 'rose',
		git_ignore = 'brownie',
		git_merge = 'vanilla_1',
		git_rename = 'bluemoon_2',
		git_stage = 'vanilla_1',
		git_text = 'rose',
		headings = {
			h1 = 'vanilla_1',
			h2 = 'pistachio_2',
			h3 = 'rose',
			h4 = 'mango_1',
			h5 = 'bluemoon_2',
			h6 = 'pistachio_2',
		},
	},

	---@type table<string, Color>
	highlight_groups = {},
}

---@param options Options|nil
function M.extend(options)
	M.options = vim.tbl_deep_extend('force', M.options, options or {})
end

return M
