local M = {}

---@param options Options
function M._load(options)
	local h = require('util').highlight
	local p = require('palette')

	local groups = options.groups or {}
	local maybe = {
		dark_chocolate = (options.disable_background and p.none) or groups.background,
		light_chocolate = (options.disable_float_background and p.none) or groups.panel,
		italic = not options.disable_italics,
	}
	maybe.bold_vert_split = (options.bold_vert_split and groups.border)
		or p.none
	maybe.dim_nc_background = (
		options.dim_nc_background and groups.background_nc
	) or maybe.dark_chocolate

	local float_background = options.dim_nc_background
			and (options.disable_float_background and groups.panel_nc or groups.panel)
		or maybe.light_chocolate

	M.defaults = {
		['ColorColumn'] = { bg = p.bluemoon_1 },
		['Conceal'] = { bg = p.none },
		['CurSearch'] = { link = 'IncSearch' },
		['Cursor'] = { fg = p.vanilla_2, bg = p.highlight_high },
		['CursorColumn'] = { bg = p.highlight_low },
		-- CursorIM = {},
		['CursorLine'] = { bg = p.highlight_low },
		['CursorLineNr'] = { fg = p.vanilla_2 },
		['DarkenedPanel'] = { bg = maybe.light_chocolate },
		['DarkenedStatusline'] = { bg = maybe.light_chocolate },
		['DiffAdd'] = { bg = groups.git_add, blend = 20 },

		['DiffChange'] = { bg = p.bluemoon_1 },
		['DiffDelete'] = { bg = groups.git_delete, blend = 20 },
		['DiffText'] = { bg = groups.git_text, blend = 20 },
		['diffAdded'] = { link = 'DiffAdd' },
		['diffChanged'] = { link = 'DiffChange' },
		['diffRemoved'] = { link = 'DiffDelete' },
		['Directory'] = { fg = p.pistachio_2, bg = p.none },
		-- EndOfBuffer = {},
		['ErrorMsg'] = { fg = p.strawberry, bold = true },
		['FloatBorder'] = { fg = groups.border, bg = maybe.light_chocolate },
		['FloatTitle'] = { fg = p.browni},
		['FoldColumn'] = { fg = p.browni},
		['Folded'] = { fg = p.vanilla_2, bg = maybe.light_chocolate },
		['IncSearch'] = { fg = groups.background, bg = p.rose },
		['LineNr'] = { fg = p.browni},
		['MatchParen'] = { fg = p.vanilla_2, bg = p.highlight_med },
		['ModeMsg'] = { fg = p.subtle },
		['MoreMsg'] = { fg = p.vanilla_1 },
		['NonText'] = { fg = p.browni},
		['Normal'] = { fg = p.vanilla_2, bg = maybe.dark_chocolate },
		['NormalFloat'] = { fg = p.vanilla_2, bg = maybe.light_chocolate },
		['NormalNC'] = { fg = p.vanilla_2, bg = maybe.dim_nc_background },
		['NvimInternalError'] = { fg = '#ffffff', bg = p.strawberry },
		['Pmenu'] = { fg = p.subtle, bg = maybe.light_chocolate },
		['PmenuSbar'] = { bg = p.highlight_low },
		['PmenuSel'] = { fg = p.vanilla_2, bg = p.bluemoon_1 },
		['PmenuThumb'] = { bg = p.highlight_med },
		['Question'] = { fg = p.mango_1 },
		-- QuickFixLine = {},
		-- RedrawDebugNormal = {}
		['RedrawDebugClear'] = { fg = '#ffffff', bg = p.mango_1 },
		['RedrawDebugComposed'] = { fg = '#ffffff', bg = p.bluemoon_2 },
		['RedrawDebugRecompose'] = { fg = '#ffffff', bg = p.strawberry },
		['Search'] = { bg = p.highlight_med },
		['SpecialKey'] = { fg = p.pistachio_2 },
		['SpellBad'] = { sp = p.subtle, undercurl = true },
		['SpellCap'] = { sp = p.subtle, undercurl = true },
		['SpellLocal'] = { sp = p.subtle, undercurl = true },
		['SpellRare'] = { sp = p.subtle, undercurl = true },
		['SignColumn'] = {
			fg = p.vanilla_2,
			bg = (options.dim_nc_background and p.none) or maybe.dark_chocolate,
		},
		['Substitute'] = { fg = p.dark_chocolate, bg = p.strawberry },
		['StatusLine'] = { fg = p.subtle, bg = groups.panel },
		['StatusLineNC'] = { fg = p.brownie, bg = groups.panel_nc },
		['StatusLineTerm'] = { link = 'StatusLine' },
		['StatusLineTermNC'] = { link = 'StatusLineNC' },
		['TabLine'] = { fg = p.subtle, bg = groups.panel },
		['TabLineFill'] = { bg = groups.panel },
		['TabLineSel'] = { fg = p.vanilla_2, bg = p.bluemoon_1 },
		['Title'] = { fg = p.vanilla_2 },
		['VertSplit'] = { fg = groups.border, bg = maybe.bold_vert_split },
		['Visual'] = { bg = p.highlight_med },
		-- VisualNOS = {},
		['WarningMsg'] = { fg = p.mango_1 },
		-- Whitespace = {},
		['WildMenu'] = { link = 'IncSearch' },

		['Boolean'] = { fg = p.rose },
		['Character'] = { fg = p.mango_1 },
		['Comment'] = { fg = groups.comment, italic = maybe.italic },
		['Conditional'] = { fg = p.bluemoon_2 },
		['Constant'] = { fg = p.mango_1 },
		['Debug'] = { fg = p.rose },
		['Define'] = { fg = p.vanilla_1 },
		['Delimiter'] = { fg = p.subtle },
		['Error'] = { fg = p.strawberry },
		['Exception'] = { fg = p.bluemoon_2 },
		['Float'] = { fg = p.mango_1 },
		['Function'] = { fg = p.rose },
		['Identifier'] = { fg = p.rose },
		-- Ignore = {},
		['Include'] = { fg = p.bluemoon_2 },
		['Keyword'] = { fg = p.bluemoon_2 },
		['Label'] = { fg = p.pistachio_2 },
		['Macro'] = { fg = p.vanilla_1 },
		['Number'] = { fg = p.mango_1 },
		['Operator'] = { fg = p.subtle },
		['PreCondit'] = { fg = p.vanilla_1 },
		['PreProc'] = { fg = p.vanilla_1 },
		['Repeat'] = { fg = p.bluemoon_2 },
		['Special'] = { fg = p.rose },
		['SpecialChar'] = { fg = p.rose },
		['SpecialComment'] = { fg = p.vanilla_1 },
		['Statement'] = { fg = p.bluemoon_2 },
		['StorageClass'] = { fg = p.pistachio_2 },
		['String'] = { fg = p.mango_1 },
		['Structure'] = { fg = p.pistachio_2 },
		['Tag'] = { fg = p.pistachio_2 },
		['Todo'] = { fg = p.vanilla_1 },
		['Type'] = { fg = p.pistachio_2 },
		['Typedef'] = { link = 'Type' },
		['Underlined'] = { underline = true },

		['htmlArg'] = { fg = p.vanilla_1 },
		['htmlBold'] = { bold = true },
		['htmlEndTag'] = { fg = p.subtle },
		['htmlH1'] = { fg = groups.headings.h1, bold = true },
		['htmlH2'] = { fg = groups.headings.h2, bold = true },
		['htmlH3'] = { fg = groups.headings.h3, bold = true },
		['htmlH4'] = { fg = groups.headings.h4, bold = true },
		['htmlH5'] = { fg = groups.headings.h5, bold = true },
		['htmlItalic'] = { italic = maybe.italic },
		['htmlLink'] = { fg = groups.link },
		['htmlTag'] = { fg = p.subtle },
		['htmlTagN'] = { fg = p.vanilla_2 },
		['htmlTagName'] = { fg = p.pistachio_2 },

		['markdownDelimiter'] = { fg = p.subtle },
		['markdownH1'] = { fg = groups.headings.h1, bold = true },
		['markdownH1Delimiter'] = { link = 'markdownH1' },
		['markdownH2'] = { fg = groups.headings.h2, bold = true },
		['markdownH2Delimiter'] = { link = 'markdownH2' },
		['markdownH3'] = { fg = groups.headings.h3, bold = true },
		['markdownH3Delimiter'] = { link = 'markdownH3' },
		['markdownH4'] = { fg = groups.headings.h4, bold = true },
		['markdownH4Delimiter'] = { link = 'markdownH4' },
		['markdownH5'] = { fg = groups.headings.h5, bold = true },
		['markdownH5Delimiter'] = { link = 'markdownH5' },
		['markdownH6'] = { fg = groups.headings.h6, bold = true },
		['markdownH6Delimiter'] = { link = 'markdownH6' },
		['markdownLinkText'] = { fg = groups.link, sp = groups.link, underline = true },
		['markdownUrl'] = { link = 'markdownLinkText' },

		['mkdCode'] = { fg = p.pistachio_2, italic = maybe.italic },
		['mkdCodeDelimiter'] = { fg = p.rose },
		['mkdCodeEnd'] = { fg = p.pistachio_2 },
		['mkdCodeStart'] = { fg = p.pistachio_2 },
		['mkdFootnotes'] = { fg = p.pistachio_2 },
		['mkdID'] = { fg = p.pistachio_2, underline = true },
		['mkdInlineURL'] = { fg = groups.link, underline = true },
		['mkdLink'] = { link = 'mkdInlineURL' },
		['mkdLinkDef'] = { link = 'mkdInlineURL' },
		['mkdListItemLine'] = { fg = p.vanilla_2 },
		['mkdRule'] = { fg = p.subtle },
		['mkdURL'] = { link = 'mkdInlineURL' },

		['DiagnosticError'] = { fg = groups.error },
		['DiagnosticHint'] = { fg = groups.hint },
		['DiagnosticInfo'] = { fg = groups.info },
		['DiagnosticWarn'] = { fg = groups.warn },
		['DiagnosticDefaultError'] = { fg = groups.error },
		['DiagnosticDefaultHint'] = { fg = groups.hint },
		['DiagnosticDefaultInfo'] = { fg = groups.info },
		['DiagnosticDefaultWarn'] = { fg = groups.warn },
		['DiagnosticFloatingError'] = { fg = groups.error },
		['DiagnosticFloatingHint'] = { fg = groups.hint },
		['DiagnosticFloatingInfo'] = { fg = groups.info },
		['DiagnosticFloatingWarn'] = { fg = groups.warn },
		['DiagnosticSignError'] = { fg = groups.error },
		['DiagnosticSignHint'] = { fg = groups.hint },
		['DiagnosticSignInfo'] = { fg = groups.info },
		['DiagnosticSignWarn'] = { fg = groups.warn },
		['DiagnosticStatusLineError'] = { fg = groups.error, bg = groups.panel },
		['DiagnosticStatusLineHint'] = { fg = groups.hint, bg = groups.panel },
		['DiagnosticStatusLineInfo'] = { fg = groups.info, bg = groups.panel },
		['DiagnosticStatusLineWarn'] = { fg = groups.warn, bg = groups.panel },
		['DiagnosticUnderlineError'] = { sp = groups.error, undercurl = true },
		['DiagnosticUnderlineHint'] = { sp = groups.hint, undercurl = true },
		['DiagnosticUnderlineInfo'] = { sp = groups.info, undercurl = true },
		['DiagnosticUnderlineWarn'] = { sp = groups.warn, undercurl = true },
		['DiagnosticVirtualTextError'] = { fg = groups.error },
		['DiagnosticVirtualTextHint'] = { fg = groups.hint },
		['DiagnosticVirtualTextInfo'] = { fg = groups.info },
		['DiagnosticVirtualTextWarn'] = { fg = groups.warn },

		-- healthcheck
		['healthError'] = { fg = groups.error },
		['healthSuccess'] = { fg = groups.info },
		['healthWarning'] = { fg = groups.warn },

		-- Treesitter
		['@boolean'] = { link = 'Boolean' },
		['@character'] = { link = 'Character' },
		['@character.special'] = { link = '@character' },
		['@class'] = { fg = p.pistachio_2 },
		['@comment'] = { link = 'Comment' },
		['@conditional'] = { link = 'Conditional' },
		['@constant'] = { link = 'Constant' },
		['@constant.builtin'] = { fg = p.strawberry },
		['@constant.macro'] = { link = '@constant' },
		['@constructor'] = { fg = p.pistachio_2 },
		['@field'] = { fg = p.pistachio_2 },
		['@function'] = { link = 'Function' },
		['@function.builtin'] = { fg = p.strawberry },
		['@function.macro'] = { link = '@function' },
		['@include'] = { link = 'Include' },
		['@interface'] = { fg = p.pistachio_2 },
		['@keyword'] = { link = 'Keyword' },
		['@keyword.operator'] = { fg = p.subtle },
		['@label'] = { link = 'Label' },
		['@macro'] = { link = 'Macro' },
		['@method'] = { fg = p.rose },
		['@number'] = { link = 'Number' },
		['@operator'] = { link = 'Operator' },
		['@parameter'] = { fg = p.vanilla_1, italic = maybe.italic },
		['@preproc'] = { link = 'PreProc' },
		['@property'] = { fg = p.pistachio_2, italic = maybe.italic },
		['@punctuation'] = { fg = groups.punctuation },
		['@punctuation.bracket'] = { link = '@punctuation' },
		['@punctuation.delimiter'] = { link = '@punctuation' },
		['@punctuation.special'] = { link = '@punctuation' },
		['@regexp'] = { link = 'String' },
		['@repeat'] = { link = 'Repeat' },
		['@storageclass'] = { link = 'StorageClass' },
		['@string'] = { link = 'String' },
		['@string.escape'] = { fg = p.bluemoon_2 },
		['@string.special'] = { link = '@string' },
		['@symbol'] = { link = 'Identifier' },
		['@tag'] = { link = 'Tag' },
		['@tag.attribute'] = { fg = p.vanilla_1 },
		['@tag.delimiter'] = { fg = p.subtle },
		['@text'] = { fg = p.vanilla_2 },
		['@text.strong'] = { bold = true },
		['@text.emphasis'] = { italic = true },
		['@text.underline'] = { underline = true },
		['@text.strike'] = { strikethrough = true },
		['@text.math'] = { link = 'Special' },
		['@text.environment'] = { link = 'Macro' },
		['@text.environment.name'] = { link = 'Type' },
		['@text.title'] = { link = 'Title' },
		['@text.uri'] = { fg = groups.link },
		['@text.note'] = { link = 'SpecialComment' },
		['@text.warning'] = { fg = groups.warn },
		['@text.danger'] = { fg = groups.error },
		['@todo'] = { link = 'Todo' },
		['@type'] = { link = 'Type' },
		['@variable'] = { fg = p.vanilla_2, italic = maybe.italic },
		['@variable.builtin'] = { fg = p.strawberry },
		['@namespace'] = { link = '@include' },

		-- LSP Semantic Token Groups
		['@lsp.type.comment'] = {},
		['@lsp.type.enum'] = { link = '@type' },
		['@lsp.type.keyword'] = { link = '@keyword' },
		['@lsp.type.interface'] = { link = '@interface' },
		['@lsp.type.namespace'] = { link = '@namespace' },
		['@lsp.type.parameter'] = { link = '@parameter' },
		['@lsp.type.property'] = { link = '@property' },
		['@lsp.type.variable'] = {}, -- use treesitter styles for regular variables
		['@lsp.typemod.function.defaultLibrary'] = { link = 'Special' },
		['@lsp.typemod.variable.defaultLibrary'] = { link = '@variable.builtin' },

		-- LSP Injected Groups
		['@lsp.typemod.operator.injected'] = { link = '@operator' },
		['@lsp.typemod.string.injected'] = { link = '@string' },
		['@lsp.typemod.variable.injected'] = { link = '@variable' },

		-- nvim-treesitter Markdown Headings
		['@text.title.1.markdown'] = { link = 'markdownH1' },
		['@text.title.1.marker.markdown'] = { link = 'markdownH1Delimiter' },
		['@text.title.2.markdown'] = { link = 'markdownH2' },
		['@text.title.2.marker.markdown'] = { link = 'markdownH2Delimiter' },
		['@text.title.3.markdown'] = { link = 'markdownH3' },
		['@text.title.3.marker.markdown'] = { link = 'markdownH3Delimiter' },
		['@text.title.4.markdown'] = { link = 'markdownH4' },
		['@text.title.4.marker.markdown'] = { link = 'markdownH4Delimiter' },
		['@text.title.5.markdown'] = { link = 'markdownH5' },
		['@text.title.5.marker.markdown'] = { link = 'markdownH5Delimiter' },
		['@text.title.6.markdown'] = { link = 'markdownH6' },
		['@text.title.6.marker.markdown'] = { link = 'markdownH6Delimiter' },

		-- vim.lsp.buf.document_highlight()
		['LspReferenceText'] = { bg = p.highlight_med },
		['LspReferenceRead'] = { bg = p.highlight_med },
		['LspReferenceWrite'] = { bg = p.highlight_med },

		-- lsp-highlight-codelens
		['LspCodeLens'] = { fg = p.subtle }, -- virtual text of code len
		['LspCodeLensSeparator'] = { fg = p.highlight_high }, -- separator between two or more code len

		-- romgrk/barbar.nvim
		['BufferCurrent'] = { fg = p.text, bg = p.bluemoon_1 },
		['BufferCurrentIndex'] = { fg = p.vanilla_2, bg = p.bluemoon_1 },
		['BufferCurrentMod'] = { fg = p.pistachio_2, bg = p.bluemoon_1 },
		['BufferCurrentSign'] = { fg = p.subtle, bg = p.bluemoon_1 },
		['BufferCurrentTarget'] = { fg = p.mango_1, bg = p.bluemoon_1 },
		['BufferInactive'] = { fg = p.subtle },
		['BufferInactiveIndex'] = { fg = p.subtle },
		['BufferInactiveMod'] = { fg = p.pistachio_2 },
		['BufferInactiveSign'] = { fg = p.browni},
		['BufferInactiveTarget'] = { fg = p.mango_1 },
		['BufferTabpageFill'] = { fg = groups.background, bg = groups.background },
		['BufferVisible'] = { fg = p.subtle },
		['BufferVisibleIndex'] = { fg = p.subtle },
		['BufferVisibleMod'] = { fg = p.pistachio_2 },
		['BufferVisibleSign'] = { fg = p.browni},
		['BufferVisibleTarget'] = { fg = p.mango_1 },

		-- lewis6991/gitsigns.nvim
		['GitSignsAdd'] = { fg = groups.git_add, bg = groups.background },
		['GitSignsChange'] = { fg = groups.git_change, bg = groups.background },
		['GitSignsDelete'] = { fg = groups.git_delete, bg = groups.background },
		['SignAdd'] = { link = 'GitSignsAdd' },
		['SignChange'] = { link = 'GitSignsChange' },
		['SignDelete'] = { link = 'GitSignsDelete' },

		-- mvllow/modes.nvim
		['ModesCopy'] = { bg = p.mango_1 },
		['ModesDelete'] = { bg = p.strawberry },
		['ModesInsert'] = { bg = p.pistachio_2 },
		['ModesVisual'] = { bg = p.vanilla_1 },

		-- kyazdani42/nvim-tree.lua
		['NvimTreeEmptyFolderName'] = { fg = p.browni},
		['NvimTreeFileDeleted'] = { fg = p.strawberry },
		['NvimTreeFileDirty'] = { fg = p.rose },
		['NvimTreeFileMerge'] = { fg = p.vanilla_1 },
		['NvimTreeFileNew'] = { fg = p.pistachio_2 },
		['NvimTreeFileRenamed'] = { fg = p.bluemoon_2 },
		['NvimTreeFileStaged'] = { fg = p.vanilla_1 },
		['NvimTreeFolderIcon'] = { fg = p.subtle },
		['NvimTreeFolderName'] = { fg = p.pistachio_2 },
		['NvimTreeGitDeleted'] = { fg = groups.git_delete },
		['NvimTreeGitDirty'] = { fg = groups.git_dirty },
		['NvimTreeGitIgnored'] = { fg = groups.git_ignore },
		['NvimTreeGitMerge'] = { fg = groups.git_merge },
		['NvimTreeGitNew'] = { fg = groups.git_add },
		['NvimTreeGitRenamed'] = { fg = groups.git_rename },
		['NvimTreeGitStaged'] = { fg = groups.git_stage },
		['NvimTreeImageFile'] = { fg = p.vanilla_2 },
		['NvimTreeNormal'] = { fg = p.vanilla_2 },
		['NvimTreeOpenedFile'] = { fg = p.vanilla_2, bg = p.highlight_med },
		['NvimTreeOpenedFolderName'] = { link = 'NvimTreeFolderName' },
		['NvimTreeRootFolder'] = { fg = p.vanilla_1 },
		['NvimTreeSpecialFile'] = { link = 'NvimTreeNormal' },
		['NvimTreeWindowPicker'] = { fg = p.strawberry, bg = p.strawberry, blend = 10 },

		-- nvim-neo-tree/neo-tree.nvim
		['NeoTreeTitleBar'] = { fg = p.light_chocolate, bg = p.bluemoon_2 },
		['NeoTreeGitAdded'] = { fg = p.pistachio_2 },
		['NeoTreeGitModified'] = { fg = p.rose },
		['NeoTreeGitDeleted'] = { fg = p.strawberry },
		['NeoTreeGitRenamed'] = { fg = p.bluemoon_2 },
		['NeoTreeGitIgnored'] = { fg = p.browni},
		['NeoTreeGitUntracked'] = { fg = p.mango_1 },
		['NeoTreeGitConflict'] = { fg = p.vanilla_1 },

		-- folke/which-key.nvim
		['WhichKey'] = { fg = p.vanilla_1 },
		['WhichKeyGroup'] = { fg = p.pistachio_2 },
		['WhichKeySeparator'] = { fg = p.subtle },
		['WhichKeyDesc'] = { fg = p.mango_1 },
		['WhichKeyFloat'] = { bg = maybe.light_chocolate },
		['WhichKeyValue'] = { fg = p.rose },

		-- luka-reineke/indent-blankline.nvim
		['IndentBlanklineChar'] = { fg = p.brownie, nocombine = true },
		['IndentBlanklineSpaceChar'] = { fg = p.brownie, nocombine = true },
		['IndentBlanklineSpaceCharBlankline'] = { fg = p.brownie, nocombine = true },

		-- hrsh7th/nvim-cmp
		['CmpItemAbbr'] = { fg = p.subtle },
		['CmpItemAbbrDeprecated'] = { fg = p.subtle, strikethrough = true },
		['CmpItemAbbrMatch'] = { fg = p.vanilla_2, bold = true },
		['CmpItemAbbrMatchFuzzy'] = { fg = p.vanilla_2, bold = true },
		['CmpItemKind'] = { fg = p.subtle },
		['CmpItemKindClass'] = { fg = p.bluemoon_2 },
		['CmpItemKindFunction'] = { fg = p.rose },
		['CmpItemKindInterface'] = { fg = p.pistachio_2 },
		['CmpItemKindMethod'] = { fg = p.vanilla_1 },
		['CmpItemKindSnippet'] = { fg = p.mango_1 },
		['CmpItemKindVariable'] = { fg = p.vanilla_2 },

		-- TimUntersberger/neogit
		['NeogitDiffAddHighlight'] = { fg = p.pistachio_2, bg = p.highlight_med },
		['NeogitDiffContextHighlight'] = { bg = p.highlight_low },
		['NeogitDiffDeleteHighlight'] = { fg = p.strawberry, bg = p.highlight_med },
		['NeogitHunkHeader'] = { bg = p.highlight_low },
		['NeogitHunkHeaderHighlight'] = { bg = p.highlight_low },

		-- vimwiki/vimwiki
		['VimwikiHR'] = { fg = p.subtle },
		['VimwikiHeader1'] = { fg = groups.headings.h1, bold = true },
		['VimwikiHeader2'] = { fg = groups.headings.h2, bold = true },
		['VimwikiHeader3'] = { fg = groups.headings.h3, bold = true },
		['VimwikiHeader4'] = { fg = groups.headings.h4, bold = true },
		['VimwikiHeader5'] = { fg = groups.headings.h5, bold = true },
		['VimwikiHeader6'] = { fg = groups.headings.h6, bold = true },
		['VimwikiHeaderChar'] = { fg = p.bluemoon_2 },
		['VimwikiLink'] = { fg = groups.link, underline = true },
		['VimwikiList'] = { fg = p.vanilla_1 },
		['VimwikiNoExistsLink'] = { fg = p.strawberry },

		-- nvim-neorg/neorg
		['NeorgHeading1Prefix'] = { fg = groups.headings.h1, bold = true },
		['NeorgHeading1Title'] = { link = 'NeorgHeading1Prefix' },
		['NeorgHeading2Prefix'] = { fg = groups.headings.h2, bold = true },
		['NeorgHeading2Title'] = { link = 'NeorgHeading2Prefix' },
		['NeorgHeading3Prefix'] = { fg = groups.headings.h3, bold = true },
		['NeorgHeading3Title'] = { link = 'NeorgHeading3Prefix' },
		['NeorgHeading4Prefix'] = { fg = groups.headings.h4, bold = true },
		['NeorgHeading4Title'] = { link = 'NeorgHeading4Prefix' },
		['NeorgHeading5Prefix'] = { fg = groups.headings.h5, bold = true },
		['NeorgHeading5Title'] = { link = 'NeorgHeading5Prefix' },
		['NeorgHeading6Prefix'] = { fg = groups.headings.h6, bold = true },
		['NeorgHeading6Title'] = { link = 'NeorgHeading6Prefix' },
		['NeorgMarkerTitle'] = { fg = p.vanilla_2, bold = true },

		-- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
		['DefinitionCount'] = { fg = p.rose },
		['DefinitionIcon'] = { fg = p.rose },
		['DefintionPreviewTitle'] = { fg = p.rose, bold = true },
		['LspFloatWinBorder'] = { fg = groups.border },
		['LspFloatWinNormal'] = { bg = maybe.light_chocolate },
		['LspSagaAutoPreview'] = { fg = p.subtle },
		['LspSagaCodeActionBorder'] = { fg = groups.border },
		['LspSagaCodeActionContent'] = { fg = p.pistachio_2 },
		['LspSagaCodeActionTitle'] = { fg = p.mango_1, bold = true },
		['LspSagaCodeActionTruncateLine'] = { link = 'LspSagaCodeActionBorder' },
		['LspSagaDefPreviewBorder'] = { fg = groups.border },
		['LspSagaDiagnosticBorder'] = { fg = groups.border },
		['LspSagaDiagnosticHeader'] = { fg = p.mango_1, bold = true },
		['LspSagaDiagnosticTruncateLine'] = { link = 'LspSagaDiagnosticBorder' },
		['LspSagaDocTruncateLine'] = { link = 'LspSagaHoverBorder' },
		['LspSagaFinderSelection'] = { fg = p.mango_1 },
		['LspSagaHoverBorder'] = { fg = groups.border },
		['LspSagaLspFinderBorder'] = { fg = groups.border },
		['LspSagaRenameBorder'] = { fg = p.bluemoon_2 },
		['LspSagaRenamePromptPrefix'] = { fg = p.strawberry },
		['LspSagaShTruncateLine'] = { link = 'LspSagaSignatureHelpBorder' },
		['LspSagaSignatureHelpBorder'] = { fg = p.bluemoon_2 },
		['ReferencesCount'] = { fg = p.rose },
		['ReferencesIcon'] = { fg = p.rose },
		['SagaShadow'] = { bg = p.bluemoon_1 },
		['TargetWord'] = { fg = p.vanilla_1 },

		-- ray-x/lsp_signature.nvim
		['LspSignatureActiveParameter'] = { bg = p.bluemoon_1 },

		-- rlane/pounce.nvim
		['PounceAccept'] = { fg = p.strawberry, bg = p.highlight_high },
		['PounceAcceptBest'] = { fg = p.dark_chocolate, bg = p.mango_1 },
		['PounceGap'] = { link = 'Search' },
		['PounceMatch'] = { link = 'Search' },

		-- ggandor/leap.nvim
		['LeapMatch'] = { link = 'MatchParen' },
		['LeapLabelPrimary'] = { link = 'IncSearch' },
		['LeapLabelSecondary'] = { fg = p.dark_chocolate, bg = p.bluemoon_2 },

		-- phaazon/hop.nvim
		['HopNextKey'] = { fg = p.strawberry },
		['HopNextKey1'] = { fg = p.pistachio_2 },
		['HopNextKey2'] = { fg = p.bluemoon_2 },
		['HopUnmatched'] = { fg = p.highlight_high },

		-- nvim-telescope/telescope.nvim
		['TelescopeBorder'] = { fg = groups.border, bg = float_background },
		['TelescopeMatching'] = { fg = p.rose },
		['TelescopeNormal'] = { fg = p.subtle, bg = float_background },
		['TelescopePromptNormal'] = { fg = p.text, bg = float_background },
		['TelescopePromptPrefix'] = { fg = p.subtle },
		['TelescopeSelection'] = { fg = p.vanilla_2, bg = p.bluemoon_1 },
		['TelescopeSelectionCaret'] = { fg = p.rose, bg = p.bluemoon_1 },
		['TelescopeTitle'] = { fg = p.subtle },

		-- rcarriga/nvim-notify
		['NotifyINFOBorder'] = { fg = p.pistachio_2 },
		['NotifyINFOTitle'] = { link = 'NotifyINFOBorder' },
		['NotifyINFOIcon'] = { link = 'NotifyINFOBorder' },
		['NotifyWARNBorder'] = { fg = p.mango_1 },
		['NotifyWARNTitle'] = { link = 'NotifyWARNBorder' },
		['NotifyWARNIcon'] = { link = 'NotifyWARNBorder' },
		['NotifyDEBUGBorder'] = { fg = p.browni},
		['NotifyDEBUGTitle'] = { link = 'NotifyDEBUGBorder' },
		['NotifyDEBUGIcon'] = { link = 'NotifyDEBUGBorder' },
		['NotifyTRACEBorder'] = { fg = p.vanilla_1 },
		['NotifyTRACETitle'] = { link = 'NotifyTRACEBorder' },
		['NotifyTRACEIcon'] = { link = 'NotifyTRACEBorder' },
		['NotifyERRORBorder'] = { fg = p.strawberry },
		['NotifyERRORTitle'] = { link = 'NotifyERRORBorder' },
		['NotifyERRORIcon'] = { link = 'NotifyERRORBorder' },

		-- rcarriga/nvim-dap-ui
		['DapUIVariable'] = { link = 'Normal' },
		['DapUIValue'] = { link = 'Normal' },
		['DapUIFrameName'] = { link = 'Normal' },
		['DapUIThread'] = { fg = p.mango_1 },
		['DapUIWatchesValue'] = { link = 'DapUIThread' },
		['DapUIBreakpointsInfo'] = { link = 'DapUIThread' },
		['DapUIBreakpointsCurrentLine'] = { fg = p.mango_1, bold = true },
		['DapUIWatchesEmpty'] = { fg = p.strawberry },
		['DapUIWatchesError'] = { link = 'DapUIWatchesEmpty' },
		['DapUIBreakpointsDisabledLine'] = { fg = p.browni},
		['DapUISource'] = { fg = p.vanilla_1 },
		['DapUIBreakpointsPath'] = { fg = p.pistachio_2 },
		['DapUIScope'] = { link = 'DapUIBreakpointsPath' },
		['DapUILineNumber'] = { link = 'DapUIBreakpointsPath' },
		['DapUIBreakpointsLine'] = { link = 'DapUIBreakpointsPath' },
		['DapUIFloatBorder'] = { link = 'DapUIBreakpointsPath' },
		['DapUIStoppedThread'] = { link = 'DapUIBreakpointsPath' },
		['DapUIDecoration'] = { link = 'DapUIBreakpointsPath' },
		['DapUIModifiedValue'] = { fg = p.pistachio_2, bold = true },

		-- glepnir/dashboard-nvim
		['DashboardShortcut'] = { fg = p.strawberry },
		['DashboardHeader'] = { fg = p.bluemoon_2 },
		['DashboardCenter'] = { fg = p.mango_1 },
		['DashboardFooter'] = { fg = p.vanilla_1 },

		-- SmiteshP/nvim-navic
		['NavicIconsFile'] = { fg = p.dark_chocolate },
		['NavicIconsModule'] = { fg = p.rose },
		['NavicIconsNamespace'] = { fg = p.dark_chocolate },
		['NavicIconsPackage'] = { fg = p.dark_chocolate },
		['NavicIconsClass'] = { fg = p.pistachio_2 },
		['NavicIconsMethod'] = { fg = p.vanilla_1 },
		['NavicIconsProperty'] = { fg = p.pistachio_2 },
		['NavicIconsField'] = { fg = p.pistachio_2 },
		['NavicIconsConstructor'] = { fg = p.mango_1 },
		['NavicIconsEnum'] = { fg = p.mango_1 },
		['NavicIconsInterface'] = { fg = p.pistachio_2 },
		['NavicIconsFunction'] = { fg = p.bluemoon_2 },
		['NavicIconsVariable'] = { fg = p.vanilla_2 },
		['NavicIconsConstant'] = { fg = p.mango_1 },
		['NavicIconsString'] = { fg = p.mango_1 },
		['NavicIconsNumber'] = { fg = p.mango_1 },
		['NavicIconsBoolean'] = { fg = p.rose },
		['NavicIconsArray'] = { fg = p.mango_1 },
		['NavicIconsObject'] = { fg = p.mango_1 },
		['NavicIconsKey'] = { fg = p.vanilla_1 },
		['NavicIconsKeyword'] = { fg = p.bluemoon_2 },
		['NavicIconsNull'] = { fg = p.strawberry },
		['NavicIconsEnumMember'] = { fg = p.pistachio_2 },
		['NavicIconsStruct'] = { fg = p.pistachio_2 },
		['NavicIconsEvent'] = { fg = p.mango_1 },
		['NavicIconsOperator'] = { fg = p.subtle },
		['NavicIconsTypeParameter'] = { fg = p.pistachio_2 },
		['NavicText'] = { fg = p.subtle },
		['NavicSeparator'] = { fg = p.subtle },

		-- folke/noice.nvim
		['NoiceCursor'] = { fg = p.highlight_high, bg = p.vanilla_2 },

		-- echasnovski/mini.indentscope
		['MiniIndentscopeSymbol'] = { fg = p.highlight_med },
		['MiniIndentscopeSymbolOff'] = { fg = p.highlight_med },

		-- goolord/alpha-nvim
		['AlphaHeader'] = { fg = p.bluemoon_2 },
		['AlphaButtons'] = { fg = p.pistachio_2 },
		['AlphaShortcut'] = { fg = p.rose },
		['AlphaFooter'] = { fg = p.mango_1 },
	}

	vim.g.terminal_color_0 = p.bluemoon_1 -- black
	vim.g.terminal_color_8 = p.subtle -- bright black
	vim.g.terminal_color_1 = p.strawberry -- red
	vim.g.terminal_color_9 = p.strawberry -- bright red
	vim.g.terminal_color_2 = p.bluemoon_2 -- green
	vim.g.terminal_color_10 = p.bluemoon_2 -- bright green
	vim.g.terminal_color_3 = p.mango_1 -- yellow
	vim.g.terminal_color_11 = p.mango_1 -- bright yellow
	vim.g.terminal_color_4 = p.pistachio_2 -- blue
	vim.g.terminal_color_12 = p.pistachio_2 -- bright blue
	vim.g.terminal_color_5 = p.vanilla_1 -- magenta
	vim.g.terminal_color_13 = p.vanilla_1 -- bright magenta
	vim.g.terminal_color_6 = p.rose -- cyan
	vim.g.terminal_color_14 = p.rose -- bright cyan
	vim.g.terminal_color_7 = p.vanilla_2 -- white
	vim.g.terminal_color_15 = p.vanilla_2 -- bright white

	-- Set users highlight_group customisations.
	for group, opts in pairs(options.highlight_groups) do
		local default_opts = M.defaults[group]

		if (opts.inherit == nil or opts.inherit) and default_opts ~= nil then -- On merge.
			opts.inherit = nil -- Don't add this key to the highlight_group after merge.
			M.defaults[group] = vim.tbl_extend('force', default_opts, opts)
		else -- On overwrite.
			opts.inherit = nil -- Don't add this key to the highlight_group.
			M.defaults[group] = opts
		end
	end

	-- Set highlights.
	for group, color in pairs(M.defaults) do
		h(group, color)
	end
end

return M
