-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/pedro/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/pedro/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/pedro/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/pedro/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/pedro/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ayu-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/ayu-vim"
  },
  ["editorconfig-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/editorconfig-vim"
  },
  ["flutter-tools.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/flutter-tools.nvim"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    config = { "require('config._formatter')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "require('config.statusline')" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/gruvbox"
  },
  ["gruvbox-material"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/gruvbox-material"
  },
  ["gv.vim"] = {
    commands = { "GV" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/gv.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2s\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\1\tchar\b▏\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lexima.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/lexima.vim"
  },
  ["lsp-colors.nvim"] = {
    config = { "require('lsp-colors').setup{}" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\2�\3\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\15symbol_map\1\0\25\tText\b\rFunction\b\rOperator\b\nColor\b\nClass\bﴯ\vModule\b\rConstant\b\rProperty\bﰠ\vMethod\b\15EnumMember\b\tUnit\b塞\14Interface\b\vStruct\bפּ\rVariable\b\fSnippet\b\vFolder\b\nEvent\b\nField\bﰠ\18TypeParameter\5\tFile\b\nValue\b\16Constructor\b\tEnum\b\fKeyword\b\14Reference\b\1\0\1\vpreset\rcodicons\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["material.nvim"] = {
    config = { "require('config._material')" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nginx.vim"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nginx.vim"
  },
  ["nord.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/nord.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "require('config.bufferline')" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('colorizer').setup {'css', 'javascript', 'vim', 'lua', 'html'}" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/pedro/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "require('config.compe')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\2s\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "require('config._lsp')" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-nonicons"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nvim-nonicons"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/oceanic-next"
  },
  ["oceanic-next-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/oceanic-next-vim"
  },
  ["onedark.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  sonokai = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/sonokai"
  },
  ["telescope.nvim"] = {
    config = { "require('config._telescope')" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tender.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/tender.vim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\2�\1\0\0\5\0\n\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\1\6\0'\2\a\0'\3\b\0005\4\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\21<cmd>Trouble<cr>\15<leader>xx\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["typescript-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/typescript-vim"
  },
  ["venn.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/venn.nvim"
  },
  ["vim-dadbod"] = {
    commands = { "DB" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUI" },
    loaded = false,
    needs_bufread = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-jsdoc"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-jsdoc"
  },
  ["vim-jsx-typescript"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-jsx-typescript"
  },
  ["vim-prettier"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    config = { "vim.g.startuptime_tries = 10" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-styled-components"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-styled-components"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-ultest"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-ultest"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    after_files = { "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ/after/plugin/vsnip_integ.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  },
  vimwiki = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pedro/.local/share/nvim/site/pack/packer/opt/vimwiki"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require('config.bufferline')
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('config._lsp')
time([[Config for nvim-lspconfig]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
require('config._material')
time([[Config for material.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2s\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\1\tchar\b▏\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\2�\3\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\15symbol_map\1\0\25\tText\b\rFunction\b\rOperator\b\nColor\b\nClass\bﴯ\vModule\b\rConstant\b\rProperty\bﰠ\vMethod\b\15EnumMember\b\tUnit\b塞\14Interface\b\vStruct\bפּ\rVariable\b\fSnippet\b\vFolder\b\nEvent\b\nField\bﰠ\18TypeParameter\5\tFile\b\nValue\b\16Constructor\b\tEnum\b\fKeyword\b\14Reference\b\1\0\1\vpreset\rcodicons\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\2�\1\0\0\5\0\n\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\1\6\0'\2\a\0'\3\b\0005\4\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\21<cmd>Trouble<cr>\15<leader>xx\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require('config.statusline')
time([[Config for galaxyline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('config._telescope')
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\2s\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file GV lua require("packer.load")({'gv.vim'}, { cmd = "GV", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DB lua require("packer.load")({'vim-dadbod'}, { cmd = "DB", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'vim-prettier', 'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-prettier'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType less ++once lua require("packer.load")({'vim-prettier'}, { ft = "less" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'vimwiki'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'vim-jsdoc', 'typescript-vim', 'vim-jsx-typescript', 'nvim-ts-autotag', 'vim-styled-components'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'vim-prettier'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'vim-prettier'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType ts ++once lua require("packer.load")({'vim-jsdoc', 'typescript-vim', 'vim-jsx-typescript', 'nvim-ts-autotag', 'vim-styled-components'}, { ft = "ts" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'vim-prettier', 'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-prettier', 'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-prettier'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType graphql ++once lua require("packer.load")({'vim-prettier'}, { ft = "graphql" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'vim-jsdoc', 'typescript-vim', 'vim-jsx-typescript', 'nvim-ts-autotag', 'vim-styled-components'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'flutter-tools.nvim'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'vim-jsdoc', 'typescript-vim', 'vim-jsx-typescript', 'nvim-ts-autotag', 'vim-styled-components'}, { ft = "tsx" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'lsp_signature.nvim', 'vim-jsdoc', 'venn.nvim', 'lexima.vim', 'nvim-compe', 'editorconfig-vim', 'vim-vsnip', 'vim-vsnip-integ'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/lua.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/lua.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/lua.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/php.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/php.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/php.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/ruby.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/ruby.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/ruby.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/svelte.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/svelte.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/svelte.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/xml.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/xml.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/xml.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-jsx-typescript/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-jsx-typescript/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/pedro/.local/share/nvim/site/pack/packer/opt/vim-jsx-typescript/ftdetect/typescript.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
