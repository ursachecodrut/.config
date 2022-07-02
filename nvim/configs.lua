local comment = require('Comment')
local telescope = require('telescope')
local treesitter = require('nvim-treesitter.configs')
local null_ls = require('null-ls')
local hop = require('hop')
local bufferline = require('bufferline')
local harpoon = require('harpoon')
local transparent = require('transparent')

-- Comments
comment.setup()

-- Hop
hop.setup()

-- Null ls
null_ls.setup({
    sources = { },
})

-- Bufferline
require("bufferline").setup {
  options = {
    separator_style = {"", ""},
    indicator_icon = "",
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false
  }
}

-- Harpoon
harpoon.setup({
    global_settings = {
        mark_branch = true
    }
})

-- Telescope
telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    prompt_prefix = " ",
    prompt_position = "top",
    path_display = { "smart" },
    file_ignore_patterns = { "node_modules" }
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
--
--
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

-- Treesitter
treesitter.setup({
    ensure_installed = { "typescript", "javascript", "lua" },

    sync_install = false,

    highlight = {
        enable = true,
        disable = { "c" },
        additional_vim_regex_highlighting = false,
    },
})
