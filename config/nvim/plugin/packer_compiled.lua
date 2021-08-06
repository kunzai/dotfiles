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
local package_path_str = "/home/kunzai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/kunzai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/kunzai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/kunzai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kunzai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["calendar-vim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/calendar-vim"
  },
  chadtree = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["commented.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/commented.nvim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nord.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\2¬\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\31~/Nextcloud/org/refile.org\1\3\0\0\22~/Nextcloud/org/*\19~/my-orgs/**/*\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-instant-markdown"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/vim-instant-markdown"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  vimwiki = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\2\2¬\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\31~/Nextcloud/org/refile.org\1\3\0\0\22~/Nextcloud/org/*\19~/my-orgs/**/*\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
