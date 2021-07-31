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
  chadtree = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nord.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-commaround"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-commaround"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
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
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-prettier"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/kunzai/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'vim-prettier'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-prettier'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-prettier'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType phyton ++once lua require("packer.load")({'vim-prettier'}, { ft = "phyton" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'vim-prettier'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'vim-prettier'}, { ft = "dart" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]], false)
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]], true)
vim.cmd [[source /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]]
time([[Sourcing ftdetect script at: /home/kunzai/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
