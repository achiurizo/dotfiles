return { 
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require('mini.align').setup()
        require('mini.comment').setup()
        require('mini.completion').setup()
        require('mini.surround').setup()
        require('mini.trailspace').setup()
        require('mini.hipatterns').setup({
					highlighters = {
						-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
						fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
						hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
						todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
						note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
						-- Highlight hex color strings (`#rrggbb`) using that color
						hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
					},
				})
    end,
}
