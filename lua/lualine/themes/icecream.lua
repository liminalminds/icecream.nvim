local colors = require('palette')

return {
	normal = {
		a = { bg = colors.mango_1, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.chocolate, fg = colors.raspberry_1 },
		c = { bg = colors.chocolate, fg = colors.raspberry_1 },
	},
	insert = {
		a = { bg = colors.pistachio_1, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.chocolate, fg = colors.raspberry_1 },
		c = { bg = colors.chocolate, fg = colors.raspberry_1 },
	},
	visual = {
		a = { bg = colors.blueberry_1, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.chocolate, fg = colors.raspberry_1 },
		c = { bg = colors.chocolate, fg = colors.raspberry_1 },
	},
	replace = {
		a = { bg = colors.raspberry_1, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.chocolate, fg = colors.raspberry_1 },
		c = { bg = colors.chocolate, fg = colors.raspberry_1 },
	},
	command = {
		a = { bg = colors.bluemoon_2, fg = colors.chocolate, gui = 'bold' },
		b = { bg = colors.chocolate, fg = colors.raspberry_1 },
		c = { bg = colors.chocolate, fg = colors.raspberry_1 },
	},
	inactive = {
		a = { bg = colors.chocolate, fg = colors.raspberry_1, gui = 'bold' },
		b = { bg = colors.chocolate, fg = colors.raspberry_1 },
		c = { bg = colors.chocolate, fg = colors.raspberry_1 },
	},
}
