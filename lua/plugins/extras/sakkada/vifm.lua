return {
  {
    "vifm/vifm.vim",
    cmd = { "EditVifm", "Vifm", "PeditVifm", "SplitVifm", "VsplitVifm", "DiffVifm", "TabVifm" },
    ft = { "vifm" },
    init = function()
      vim.g.vifm_replace_netrw = 1
      vim.g.vifm_embed_split = false
      if vim.env.lines ~= nil then
        vim.env.lines = vim.env.lines - 3 -- Found experimentally (2 fails with multiple tabs)
      end

      -- Vifm (set not in lazy keys due to error in vifm.vim plugin: drop on line 33 raises E565)
      vim.keymap.set("n", "<leader>vv", ":Vifm<cr>", { desc = "Open Vifm in current file realted directory" })
      vim.keymap.set("n", "<leader>vc", ":Vifm .<cr>", { desc = "Open Vifm in vim CWD directory" })
    end,
  },
}
