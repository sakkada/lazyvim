return {
  {
    "ellisonleao/gruvbox.nvim",
    config = true,
    opts = {
      undercurl = false,
      underline = false,
      bold = false,
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {
        Whitespace = { fg = "#3090f0" }, -- listchars: tab,trail,nbsp; (:h hl-Whitespace)
        NonText = { fg = "#f0a010" }, -- listchars: extends,precedes, ~(empty), showbreak, etc.; (:h hl-NonText)
        SpecialKey = { fg = "#30d090" }, -- \r (h hl-SpecialKey)
        FloatBorder = { fg = "#87796B", bg = "#3C3836" },
        FlashMatch = { fg = "#b8bb26" },
        FlashCurrent = { fg = "#FABD2F", bold = true },
        FlashLabel = { fg = "#30d090", bold = true },
      },
      dim_inactive = false,
      transparent_mode = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
