local function is_win()
  return package.config:sub(1, 1) == '\\'
end

local function get_path_separator()
  if is_win() then
    return '\\'
  end
  return '/'
end

local path_separador = get_path_separator()

return {
  'dmmulroy/tsc.nvim',
  config = function()
    require('tsc').setup({
      auto_open_qflist = true,
      auto_close_qflist = false,
      bin_path = 'node_modules' .. path_separador .. '.bin' .. path_separador .. 'tsc',
      enable_progress_notifications = false,
      hide_progress_notifications_from_history = true,
      spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
      pretty_errors = false,
    })
  end
}
