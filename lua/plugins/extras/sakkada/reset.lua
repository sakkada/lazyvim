return {
  -- desc = "Mini.files customization, preview window width",
  { "nvim-mini/mini.pairs", enabled = false },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- Taken from https://github.com/folke/snacks.nvim/pull/421

      --- Toggle all terminal windows.
      --- If terminal windows exist:
      ---   - If any are open, close all open terminals
      ---   - If none are open, open all existing terminals
      --- If no terminals exist:
      ---   - Create a terminal window
      --- `cmd` ans `opts` are optional and will be used
      --- to create a terminal if needed.
      ---@param cmd? string | string[]
      ---@param opts? snacks.terminal.Opts
      function Snacks.terminal.toggle_all(cmd, opts)
        local terminals = Snacks.terminal.list()
        local existing_terminals = {}
        for _, term in pairs(terminals) do
          if term and term:buf_valid() then
            table.insert(existing_terminals, term)
          end
        end

        if #existing_terminals > 0 then
          local any_open = false
          for _, term in ipairs(existing_terminals) do
            if term:win_valid() then
              any_open = true
              break
            end
          end

          if any_open then
            for _, term in ipairs(existing_terminals) do
              term:hide()
            end
          else
            for _, term in ipairs(existing_terminals) do
              term:show()
            end
          end
        else
          Snacks.terminal.toggle(cmd, opts)
        end
      end
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        interactive = false, -- alias for auto_insert, start_insert, auto_close
        start_insert = true,
        win = {
          keys = {
            -- in nvim-data/lazy/LazyVim/lua/lazyvim/plugins/util.lua:
            --   nav_h, nav_j, nav_k, nav_l, hide_slash, hide_underscore
            -- in nvim-data/lazy/snacks.nvim/lua/snacks/terminal.lua:
            --   q, gf, term_normal
            nav_h = false,
            nav_j = false,
            nav_k = false,
            nav_l = false,
            hide_slash = false,
            hide_underscore = false,
            term_normal = false,
          },
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>/", false },  -- disable grep (root dir)
      { "<c-_><c-_>", function() Snacks.terminal.toggle(nil, { win = { height = 0.5 } }) end, desc = "Toggle terminal", mode = { "n", "t" } },
      { "<c-_><c-a>", function() Snacks.terminal.toggle_all(nil, { win = { height = 0.5 } }) end, desc = "Toggle all terminals", mode = { "n", "t" } },
      { "<c-_>1", "1<cmd>lua Snacks.terminal.toggle(nil, { win = { height = 0.5 } })<cr>", desc = "Toggle terminal 1" },
      { "<c-_>2", "2<cmd>lua Snacks.terminal.toggle(nil, { win = { height = 0.5 } })<cr>", desc = "Toggle terminal 2" },
      { "<c-_>3", "3<cmd>lua Snacks.terminal.toggle(nil, { win = { height = 0.5 } })<cr>", desc = "Toggle terminal 3" },
      { "<c-_>4", "4<cmd>lua Snacks.terminal.toggle(nil, { win = { height = 0.5 } })<cr>", desc = "Toggle terminal 4" },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
        format = {
          -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
          -- view: (default is cmdline view)
          -- opts: any options passed to the view
          -- icon_hl_group: optional hl_group for the icon
          -- title: set to anything or empty string to hide
          cmdline = { pattern = "^:", icon = ":", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
          filter = false,
          lua = false,
          help = false,
          input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
        },
      },
    },
  },
}
