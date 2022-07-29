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
local package_path_str = "/Users/njhale/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/njhale/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/njhale/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/njhale/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/njhale/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["a.vim"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/a.vim",
    url = "https://github.com/vim-scripts/a.vim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nË\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\4\23show_tab_inicators\1\20separator_style\nslant\28show_buffer_close_icons\1\22show_buffer_icons\1\1\0\2\rfiletype\rNvimTree\ttext\18File Explorer\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\nù\1\0\0\a\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0006\4\0\0'\6\1\0B\4\2\0029\4\b\0045\5\t\0B\0\5\1K\0\1\0\1\0\1\tdesc\21Toggle lsp_lines\vtoggle\14<Leader>l\5\bset\vkeymap\bvim\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nC\0\1\5\0\4\0\b6\1\0\0009\1\1\0019\1\2\0019\1\3\1+\3\0\0)\4Ë\3B\1\3\1K\0\1\0\20formatting_sync\bbuf\blsp\bvimÌ\3\1\1\v\2\25\00016\1\0\0'\3\1\0B\1\2\0029\1\2\0015\3\3\0B\1\2\1-\1\0\0009\2\4\0008\1\2\0016\2\5\0009\2\6\0029\2\a\2)\4\0\0'\5\b\0'\6\t\0B\2\4\0019\2\n\1\n\2\0\0X\2\nÄ6\2\5\0009\2\6\0029\2\v\2'\4\f\0005\5\r\0009\6\n\1=\6\14\0053\6\15\0=\6\16\5B\2\3\0016\2\17\0-\4\1\0B\2\2\4X\5\tÄ9\a\18\0009\b\19\0068\a\b\a\15\0\a\0X\b\4Ä6\a\20\0009\t\21\0069\n\22\6B\a\3\1E\5\3\3R\5ı6\2\20\0'\4\23\0'\5\24\0B\2\3\1K\0\1\0\0¿\1¿%diagnostic.show_line_diagnostics\agl\fcommand\fmapping\rlspremap\15capability\26resolved_capabilities\vipairs\rcallback\0\fpattern\1\0\0\16BufWritePre\28nvim_create_autocommand\19format_on_save\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim\tname\1\0\1\16hint_enable\1\14on_attach\18lsp_signature\frequireé\n\1\0\f\0'\0>5\0\1\0005\1\0\0=\1\2\0005\1\3\0=\1\4\0005\1\5\0=\1\6\0005\1\a\0=\1\b\0005\1\t\0=\1\n\0005\1\v\0=\1\f\0005\1\r\0=\1\14\0005\1\15\0=\1\16\0005\1\17\0=\1\18\0004\1\n\0005\2\19\0>\2\1\0015\2\20\0>\2\2\0015\2\21\0>\2\3\0015\2\22\0>\2\4\0015\2\23\0>\2\5\0015\2\24\0>\2\6\0015\2\25\0>\2\a\0015\2\26\0>\2\b\0015\2\27\0>\2\t\0013\2\28\0006\3\29\0'\5\30\0B\3\2\0026\4\31\0\18\6\0\0B\4\2\4H\a\fÄ6\t \0009\t!\t9\t\"\t9\v#\bB\t\2\2\15\0\t\0X\n\5Ä8\t\a\0039\t$\t5\v%\0=\2&\vB\t\2\1F\a\3\3R\aÚ2\0\0ÄK\0\1\0\14on_attach\1\0\0\nsetup\vbinary\15executable\afn\bvim\npairs\14lspconfig\frequire\0\1\0\3\15capability\21workspace_symbol\fcommand\25buf.workspace_symbol\fmapping\agW\1\0\3\15capability\20document_symbol\fcommand\24buf.document_symbol\fmapping\ag0\1\0\3\15capability\20find_references\fcommand\19buf.references\fmapping\agr\1\0\3\15capability\19signature_help\fcommand\23buf.signature_help\fmapping\n<c-k>\1\0\3\15capability\nhover\fcommand\14buf.hover\fmapping\6K\1\0\3\15capability\20type_definition\fcommand\24buf.type_definition\fmapping\b1gD\1\0\3\15capability\20goto_definition\fcommand\19buf.definition\fmapping\n<c-]>\1\0\3\15capability\19implementation\fcommand\23buf.implementation\fmapping\agD\1\0\3\15capability\16declaration\fcommand\20buf.declaration\fmapping\agd\rdockerls\1\0\2\19format_on_save\15Dockerfile\vbinary\22docker-langserver\vbashls\1\0\1\vbinary\25bash-language-server\vyamlls\1\0\1\vbinary\vyamlls\16clojure_lsp\1\0\2\19format_on_save\n*.clj\vbinary\16clojure-lsp\18rust_analyzer\1\0\2\19format_on_save\t*.rs\vbinary\18rust-analyzer\fpyright\1\0\1\vbinary\fpyright\npylsp\1\0\2\19format_on_save\t*.py\vbinary\npylsp\21golangci_lint_ls\1\0\1\vbinary\29golangci-lint-langserver\ngopls\1\0\0\1\0\1\vbinary\ngopls\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÄ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\1\18open_on_setup\2\nsetup\14nvim-tree\frequire\24:NvimTreeToggle<CR>\n<c-n>\rnnoremap\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n…\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\fdisable\1\2\0\0\vphpdoc\19ignore_install\1\2\0\0\vphpdoc\1\0\2\17auto_install\2\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  supertab = {
    config = { "\27LJ\2\nv\0\0\4\0\a\0\t6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0009\0\4\0'\1\6\0=\1\5\0K\0\1\0\15<c-x><c-o>\"SuperTabDefaultCompletionType\6g\bvim\15<C-v><Tab>\f<S-Tab>\rinoremap\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/supertab",
    url = "https://github.com/ervandew/supertab"
  },
  tagbar = {
    config = { "\27LJ\2\n=\0\0\4\0\3\0\0056\0\0\0'\2\1\0'\3\2\0B\0\3\1K\0\1\0\22:TagbarToggle<CR>\14<leader>o\nsnmap\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÉ\3\0\0\4\0\v\0\0256\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\0\0'\2\3\0'\3\4\0B\0\3\0016\0\0\0'\2\5\0'\3\2\0B\0\3\0016\0\0\0'\2\6\0'\3\a\0B\0\3\0016\0\0\0'\2\b\0'\3\4\0B\0\3\0016\0\0\0'\2\t\0'\3\n\0B\0\3\1K\0\1\0:<cmd>lua require('telescope.builtin').help_tags()<cr>\15<leader>fh\15<leader>fb:<cmd>lua require('telescope.builtin').live_grep()<cr>\15<leader>fg\15<leader>ff8<cmd>lua require('telescope.builtin').buffers()<cr>\n<c-b>;<cmd>lua require('telescope.builtin').find_files()<cr>\n<c-p>\rnnoremap\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd tokyonight_italic_functions\nstorm\21tokyonight_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-cue"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/vim-cue",
    url = "https://github.com/jjo/vim-cue"
  },
  ["vim-go"] = {
    config = { "\27LJ\2\nw\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\21go_gopls_gofumpt\ngopls\19go_fmt_command\20go_echo_go_info\6g\bvim\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-togglelist"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/vim-togglelist",
    url = "https://github.com/milkypostman/vim-togglelist"
  },
  ["vim-unimpaired"] = {
    config = { "\27LJ\2\nŒ\1\0\0\4\0\14\0!6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0'\2\1\0'\3\4\0B\0\3\0016\0\0\0'\2\5\0'\3\6\0B\0\3\0016\0\3\0'\2\5\0'\3\a\0B\0\3\0016\0\0\0'\2\b\0'\3\t\0B\0\3\0016\0\0\0'\2\n\0'\3\v\0B\0\3\0016\0\3\0'\2\b\0'\3\f\0B\0\3\0016\0\3\0'\2\n\0'\3\r\0B\0\3\1K\0\1\0\b>gv\b<gv\a>>\f<Right>\a<<\v<Left>\t]egv\a]e\v<Down>\t[egv\tvmap\a[e\t<Up>\tnmap\0" },
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/njhale/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nC\0\1\5\0\4\0\b6\1\0\0009\1\1\0019\1\2\0019\1\3\1+\3\0\0)\4Ë\3B\1\3\1K\0\1\0\20formatting_sync\bbuf\blsp\bvimÌ\3\1\1\v\2\25\00016\1\0\0'\3\1\0B\1\2\0029\1\2\0015\3\3\0B\1\2\1-\1\0\0009\2\4\0008\1\2\0016\2\5\0009\2\6\0029\2\a\2)\4\0\0'\5\b\0'\6\t\0B\2\4\0019\2\n\1\n\2\0\0X\2\nÄ6\2\5\0009\2\6\0029\2\v\2'\4\f\0005\5\r\0009\6\n\1=\6\14\0053\6\15\0=\6\16\5B\2\3\0016\2\17\0-\4\1\0B\2\2\4X\5\tÄ9\a\18\0009\b\19\0068\a\b\a\15\0\a\0X\b\4Ä6\a\20\0009\t\21\0069\n\22\6B\a\3\1E\5\3\3R\5ı6\2\20\0'\4\23\0'\5\24\0B\2\3\1K\0\1\0\0¿\1¿%diagnostic.show_line_diagnostics\agl\fcommand\fmapping\rlspremap\15capability\26resolved_capabilities\vipairs\rcallback\0\fpattern\1\0\0\16BufWritePre\28nvim_create_autocommand\19format_on_save\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim\tname\1\0\1\16hint_enable\1\14on_attach\18lsp_signature\frequireé\n\1\0\f\0'\0>5\0\1\0005\1\0\0=\1\2\0005\1\3\0=\1\4\0005\1\5\0=\1\6\0005\1\a\0=\1\b\0005\1\t\0=\1\n\0005\1\v\0=\1\f\0005\1\r\0=\1\14\0005\1\15\0=\1\16\0005\1\17\0=\1\18\0004\1\n\0005\2\19\0>\2\1\0015\2\20\0>\2\2\0015\2\21\0>\2\3\0015\2\22\0>\2\4\0015\2\23\0>\2\5\0015\2\24\0>\2\6\0015\2\25\0>\2\a\0015\2\26\0>\2\b\0015\2\27\0>\2\t\0013\2\28\0006\3\29\0'\5\30\0B\3\2\0026\4\31\0\18\6\0\0B\4\2\4H\a\fÄ6\t \0009\t!\t9\t\"\t9\v#\bB\t\2\2\15\0\t\0X\n\5Ä8\t\a\0039\t$\t5\v%\0=\2&\vB\t\2\1F\a\3\3R\aÚ2\0\0ÄK\0\1\0\14on_attach\1\0\0\nsetup\vbinary\15executable\afn\bvim\npairs\14lspconfig\frequire\0\1\0\3\15capability\21workspace_symbol\fcommand\25buf.workspace_symbol\fmapping\agW\1\0\3\15capability\20document_symbol\fcommand\24buf.document_symbol\fmapping\ag0\1\0\3\15capability\20find_references\fcommand\19buf.references\fmapping\agr\1\0\3\15capability\19signature_help\fcommand\23buf.signature_help\fmapping\n<c-k>\1\0\3\15capability\nhover\fcommand\14buf.hover\fmapping\6K\1\0\3\15capability\20type_definition\fcommand\24buf.type_definition\fmapping\b1gD\1\0\3\15capability\20goto_definition\fcommand\19buf.definition\fmapping\n<c-]>\1\0\3\15capability\19implementation\fcommand\23buf.implementation\fmapping\agD\1\0\3\15capability\16declaration\fcommand\20buf.declaration\fmapping\agd\rdockerls\1\0\2\19format_on_save\15Dockerfile\vbinary\22docker-langserver\vbashls\1\0\1\vbinary\25bash-language-server\vyamlls\1\0\1\vbinary\vyamlls\16clojure_lsp\1\0\2\19format_on_save\n*.clj\vbinary\16clojure-lsp\18rust_analyzer\1\0\2\19format_on_save\t*.rs\vbinary\18rust-analyzer\fpyright\1\0\1\vbinary\fpyright\npylsp\1\0\2\19format_on_save\t*.py\vbinary\npylsp\21golangci_lint_ls\1\0\1\vbinary\29golangci-lint-langserver\ngopls\1\0\0\1\0\1\vbinary\ngopls\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd tokyonight_italic_functions\nstorm\21tokyonight_style\6g\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÄ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\1\18open_on_setup\2\nsetup\14nvim-tree\frequire\24:NvimTreeToggle<CR>\n<c-n>\rnnoremap\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: supertab
time([[Config for supertab]], true)
try_loadstring("\27LJ\2\nv\0\0\4\0\a\0\t6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0009\0\4\0'\1\6\0=\1\5\0K\0\1\0\15<c-x><c-o>\"SuperTabDefaultCompletionType\6g\bvim\15<C-v><Tab>\f<S-Tab>\rinoremap\0", "config", "supertab")
time([[Config for supertab]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\nù\1\0\0\a\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0006\4\0\0'\6\1\0B\4\2\0029\4\b\0045\5\t\0B\0\5\1K\0\1\0\1\0\1\tdesc\21Toggle lsp_lines\vtoggle\14<Leader>l\5\bset\vkeymap\bvim\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n…\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\fdisable\1\2\0\0\vphpdoc\19ignore_install\1\2\0\0\vphpdoc\1\0\2\17auto_install\2\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-go
time([[Config for vim-go]], true)
try_loadstring("\27LJ\2\nw\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\21go_gopls_gofumpt\ngopls\19go_fmt_command\20go_echo_go_info\6g\bvim\0", "config", "vim-go")
time([[Config for vim-go]], false)
-- Config for: tagbar
time([[Config for tagbar]], true)
try_loadstring("\27LJ\2\n=\0\0\4\0\3\0\0056\0\0\0'\2\1\0'\3\2\0B\0\3\1K\0\1\0\22:TagbarToggle<CR>\14<leader>o\nsnmap\0", "config", "tagbar")
time([[Config for tagbar]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nË\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\4\23show_tab_inicators\1\20separator_style\nslant\28show_buffer_close_icons\1\22show_buffer_icons\1\1\0\2\rfiletype\rNvimTree\ttext\18File Explorer\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: vim-unimpaired
time([[Config for vim-unimpaired]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\4\0\14\0!6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0'\2\1\0'\3\4\0B\0\3\0016\0\0\0'\2\5\0'\3\6\0B\0\3\0016\0\3\0'\2\5\0'\3\a\0B\0\3\0016\0\0\0'\2\b\0'\3\t\0B\0\3\0016\0\0\0'\2\n\0'\3\v\0B\0\3\0016\0\3\0'\2\b\0'\3\f\0B\0\3\0016\0\3\0'\2\n\0'\3\r\0B\0\3\1K\0\1\0\b>gv\b<gv\a>>\f<Right>\a<<\v<Left>\t]egv\a]e\v<Down>\t[egv\tvmap\a[e\t<Up>\tnmap\0", "config", "vim-unimpaired")
time([[Config for vim-unimpaired]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÉ\3\0\0\4\0\v\0\0256\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\0\0'\2\3\0'\3\4\0B\0\3\0016\0\0\0'\2\5\0'\3\2\0B\0\3\0016\0\0\0'\2\6\0'\3\a\0B\0\3\0016\0\0\0'\2\b\0'\3\4\0B\0\3\0016\0\0\0'\2\t\0'\3\n\0B\0\3\1K\0\1\0:<cmd>lua require('telescope.builtin').help_tags()<cr>\15<leader>fh\15<leader>fb:<cmd>lua require('telescope.builtin').live_grep()<cr>\15<leader>fg\15<leader>ff8<cmd>lua require('telescope.builtin').buffers()<cr>\n<c-b>;<cmd>lua require('telescope.builtin').find_files()<cr>\n<c-p>\rnnoremap\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
