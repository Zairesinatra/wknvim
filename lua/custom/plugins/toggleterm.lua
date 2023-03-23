return {
  'akinsho/toggleterm.nvim', version = "*", opts = {
    size = 10,
    open_mapping = [[<c-\>]],
    highlights = {
      -- highlights which map to a highlight group name and a table of it's values
      -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
      Normal = {
        guibg = "NONE",
      },
      NormalFloat = {
        link = 'Normal'
      },
      FloatBorder = {
        guifg = "#FFFFFF",
        guibg = "NONE",
      },
    },
    shade_terminals = false,
    float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'shadow',    -- like `size`, width and height can be a number or function which is passed the current terminal
    -- width = <value>,
    -- height = 10,
    -- winblend = 3,
  },
  } 
}
