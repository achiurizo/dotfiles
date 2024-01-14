return { 
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require('mini.align').setup()
        require('mini.comment').setup()
        require('mini.completion').setup()
        require('mini.surround').setup()
        require('mini.trailspace').setup()
    end,
}
