-- Built-in autocmds is loaded on the VeryLazy event
-- This module allow to define VimEnter events
-- If you need some other event handlers, just use built-in autocmds

-- Helper function to send an OSC 1337 SetUserVar escape sequence
-- https://wezterm.org/config/lua/pane/get_user_vars.html
local function set_wezterm_user_var(name, b64value)
  -- local escape_seq = string.format("\033]1337;SetUserVar=%s=%s\007", name, b64value)
  local escape_seq = string.format("\27]1337;SetUserVar=%s=%s\007", name, b64value)
  vim.cmd("call chansend(v:stderr, '" .. escape_seq .. "')")
end

local wezterm_group = vim.api.nvim_create_augroup("WezTermUserVar", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = wezterm_group,
  callback = function()
    set_wezterm_user_var("IS_NVIM", "dHJ1ZQ==") -- :echo -n true | base64
  end,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = wezterm_group,
  callback = function()
    set_wezterm_user_var("IS_NVIM", "ZmFsc2U=") -- :echo -n false | base64
  end,
})

return {
  -- desc = "Autocmds without lazy loading, e.g. for VimEnter event",
}
