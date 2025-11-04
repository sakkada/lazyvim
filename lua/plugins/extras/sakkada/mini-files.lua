return {
  -- desc = "Mini.files customization, preview window width",
  {
    "nvim-mini/mini.files",
    optional = true,
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_nofocus = 15,
        width_preview = 90,
      },
    },
  },
}
