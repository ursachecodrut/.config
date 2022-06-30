local comment = require('Comment')
local telescope = require('telescope')

-- Comments
comment.setup()

-- Telescope
telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    prompt_prefix = " ",
    prompt_position = "top",
    path_display = { "smart" },
  },
  pickers = {
    git_files = {
      layout_config = {
        preview_width = 0.6,
        prompt_position = "top"
      }
    },
    commands = {
      layout_config = {
        prompt_position = "top"
      }
    },
    git_status = {
      layout_config = {
        prompt_position = "top"
      }
    },
  },
}

telescope.load_extension('harpoon')
vim.cmd[[command! -nargs=0 GitFiles :Telescope git_files ]]
vim.cmd[[command! -nargs=0 Commands :Telescope commands ]]
vim.cmd[[command! -nargs=0 GitStatus :Telescope git_status ]]

-- Lualine
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local theme = require('lualine.themes.catppuccin')
theme.normal.c.bg = nil

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "coc" },
	sections = { "error", "warn", "info" },
	symbols = { error = " ", warn = " ", info = " " },
	colored = true,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	colored = false,
}

local location = {
	"location",
  fmt = function(str)
    return str .. " "
  end,
	padding = 0,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { "filetype" },
		lualine_c = { diff, diagnostics },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = { mode },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})