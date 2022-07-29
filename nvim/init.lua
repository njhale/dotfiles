-- leader
vim.g.mapleader = ','

-- mapping functions
function nmap(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, {}) end
function vmap(lhs, rhs) vim.api.nvim_set_keymap('v', lhs, rhs, {}) end
function xmap(lhs, rhs) vim.api.nvim_set_keymap('v', lhs, rhs, {}) end
function snmap(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, { silent = true}) end
function nnoremap(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true }) end
function inoremap(lhs, rhs) vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true }) end
function bufsnoremap(lhs, rhs) vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, { noremap = true, silent = true }) end
function lspremap(keymap, fn_name) bufsnoremap(keymap, '<cmd>lua vim.lsp.' .. fn_name .. '()<CR>') end

-- misc global opts
local settings = {
  'set cursorline',
  'set completeopt-=preview',
  'set cpoptions=ces$',
  'set ffs=unix,dos',
  'set fillchars=vert:·',
  'set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo',
  'set guioptions-=T',
  'set guioptions-=m',
  'set hidden',
  'set hlsearch',
  'set ignorecase',
  'set lazyredraw',
  'set list listchars=tab:·\\ ,eol:¬',
  'set nobackup',
  'set noerrorbells',
  'set noshowmode',
  'set noswapfile',
  'set number',
  'set shellslash',
  'set showfulltag',
  'set showmatch',
  'set showmode',
  'set smartcase',
  'set synmaxcol=2048',
  -- 'set t_Co=256',
  'set title',
  'set ts=2 sts=2 sw=2 et ci',
  'set ttyfast',
  'set vb',
  'set virtualedit=all',
  'set visualbell',
  'set wrapscan',
  'set termguicolors',
  'set cpoptions+=_',
}
for _, setting in ipairs(settings) do vim.cmd(setting) end

-- clear hlsearch on redraw
nnoremap('<C-L>', ':nohlsearch<CR><C-L>')

-- clipboard
if vim.fn.has('unnamedplus') then vim.opt.clipboard = 'unnamedplus' else vim.opt.clipboard = 'unnamed' end

-- toggle paste and wrap
snmap('<leader>p', ':set invpaste<CR>:set paste?<CR>')
snmap('<leader>w', ':set invwrap<CR>:set wrap?<CR>')

-- strip trailing whitespace
nnoremap('<leader>sws', ':%s/\\s\\+$//e<CR>')

-- packer
function load_packer_config(bootstrap)
  function exclude_on_bootstrap(fn) if not bootstrap then return fn end end
  return require('packer').startup(function(use)
    use {
      'folke/which-key.nvim',
      'jjo/vim-cue',
      'milkypostman/vim-togglelist',
      'ray-x/lsp_signature.nvim',
      'tpope/vim-commentary',
      'tpope/vim-repeat',
      'tpope/vim-sleuth',
      'tpope/vim-surround',
      'vim-scripts/a.vim',
      'wbthomason/packer.nvim',

      {
        'tpope/vim-unimpaired',
        config = exclude_on_bootstrap(function()
          nmap('<Up>',    '[e')
          vmap('<Up>',    '[egv')
          nmap('<Down>',  ']e')
          vmap('<Down>',  ']egv')
          nmap('<Left>',  '<<')
          nmap('<Right>', '>>')
          vmap('<Left>',  '<gv')
          vmap('<Right>', '>gv')
        end),
      },
      {
        'folke/tokyonight.nvim',
        config = exclude_on_bootstrap(function()
          vim.g.tokyonight_style = 'storm'
          vim.g.tokyonight_italic_functions = true
          vim.cmd('colorscheme tokyonight')
        end),
      },
      {
        'norcalli/nvim-colorizer.lua',
        config = exclude_on_bootstrap(function()
          require('colorizer').setup()
        end),
      },
      {
        'fatih/vim-go',
        config = exclude_on_bootstrap(function()
          vim.g.go_echo_go_info = 0 -- https://github.com/fatih/vim-go/issues/2904#issuecomment-637102187
          vim.g.go_fmt_command = 'gopls'
          vim.g.go_gopls_gofumpt = 1
        end),
      },
      {'kyazdani42/nvim-tree.lua',
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        -- requires = {'kyazdani42/nvim-web-devicons'},
        config = exclude_on_bootstrap(function()
          -- require('nvim-web-devicons').setup()
          nnoremap('<c-n>', ':NvimTreeToggle<CR>')
          require('nvim-tree').setup({
            open_on_setup = true,
          })
        end),
      },
      {
        'nvim-treesitter/nvim-treesitter',
        config = exclude_on_bootstrap(function()
          require('nvim-treesitter.configs').setup({
            ensure_installed = 'all',
            auto_install = true,

            ignore_install = { "phpdoc" },
            disable = { "phpdoc" },
            highlight = { enable = true },
          })
        end),
      },
      {
        'ervandew/supertab',
        config = exclude_on_bootstrap(function()
          inoremap('<S-Tab>', '<C-v><Tab>')
          vim.g.SuperTabDefaultCompletionType = "<c-x><c-o>"
        end),
      },
      {'akinsho/bufferline.nvim',
        tag = "v2.*",
        -- requires = {'kyazdani42/nvim-web-devicons'},
        config = exclude_on_bootstrap(function()
          nnoremap('gb', ':BufferLinePick<CR>')
          require('bufferline').setup({
            options = {
              mode = 'buffers',
              numbers = 'buffer_id',
              offsets = {
                {
                  filetype = 'NvimTree',
                  text = 'File Explorer',
                  highlight = 'Directory',
                },
              },
              show_tab_inicators = false,
              show_buffer_icons = false,
              show_buffer_close_icons = false,
              separator_style = 'slant',
            },
          })
        end),
      },
      {
        'majutsushi/tagbar',
        config = exclude_on_bootstrap(function()
          snmap('<leader>o', ':TagbarToggle<CR>')
        end),
      },
      {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = exclude_on_bootstrap(function()
          nnoremap('<c-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
          nnoremap('<c-b>', "<cmd>lua require('telescope.builtin').buffers()<cr>")
          nnoremap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
          nnoremap('<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
          nnoremap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
          nnoremap('<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")
        end),
      },
      {
        'neovim/nvim-lspconfig',
        config = exclude_on_bootstrap(function()
          local lspcfg = {
            gopls =            {binary = 'gopls',                    format_on_save = nil         },
            golangci_lint_ls = {binary = 'golangci-lint-langserver', format_on_save = nil         },
            pylsp =            {binary = 'pylsp',                    format_on_save = '*.py'      },
            pyright =          {binary = 'pyright',                  format_on_save = nil         },
            rust_analyzer =    {binary = 'rust-analyzer',            format_on_save = '*.rs'      },
            clojure_lsp =      {binary = 'clojure-lsp',              format_on_save = '*.clj'     },
            yamlls =           {binary = 'yamlls',                   format_on_save = nil         },
            bashls =           {binary = 'bash-language-server',     format_on_save = nil         },
            dockerls =         {binary = 'docker-langserver',        format_on_save = 'Dockerfile'},
          }
          local lsp_keymaps = {
            {capability = 'declaration',      mapping = 'gd',    command = 'buf.declaration'     },
            {capability = 'implementation',   mapping = 'gD',    command = 'buf.implementation'  },
            {capability = 'goto_definition',  mapping = '<c-]>', command = 'buf.definition'      },
            {capability = 'type_definition',  mapping = '1gD',   command = 'buf.type_definition' },
            {capability = 'hover',            mapping = 'K',     command = 'buf.hover'           },
            {capability = 'signature_help',   mapping = '<c-k>', command = 'buf.signature_help'  },
            {capability = 'find_references',  mapping = 'gr',    command = 'buf.references'      },
            {capability = 'document_symbol',  mapping = 'g0',    command = 'buf.document_symbol' },
            {capability = 'workspace_symbol', mapping = 'gW',    command = 'buf.workspace_symbol'},
          }
          local custom_lsp_attach = function(client)
            require('lsp_signature').on_attach { hint_enable = false }
            local opts = lspcfg[client.name]

            -- autocomplete
            vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- format on save
            if opts['format_on_save'] ~= nil then
              vim.api.nvim_create_autocommand('BufWritePre', {
                pattern = opts['format_on_save'],
                callback = function(args) vim.lsp.buf.formatting_sync(nil, 1000) end
              })
            end

            -- conditional keymaps
            for _, keymap in ipairs(lsp_keymaps) do
              if client.resolved_capabilities[keymap.capability] then
                lspremap(keymap.mapping, keymap.command)
              end
            end

            -- unconditional keymaps
            lspremap('gl', 'diagnostic.show_line_diagnostics')
          end

          -- only setup lsp clients for binaries that exist
          local lsp = require('lspconfig')
          for srv, opts in pairs(lspcfg) do
            if vim.fn.executable(opts['binary']) then lsp[srv].setup({ on_attach = custom_lsp_attach }) end
          end
        end),
      },
      {'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        -- must be registered _after_ lspconfig
        config = exclude_on_bootstrap(function()
          require("lsp_lines").setup()
          vim.keymap.set(
            '',
            '<Leader>l',
            require('lsp_lines').toggle,
            { desc = 'Toggle lsp_lines' }
          )
        end),
      },
    }
  end)
end

-- bootstrap packer
local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  vim.fn.system('git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. packer_install_path)
  vim.cmd [[packadd packer.nvim]]
  load_packer_config(true)
  require('packer').sync()
else
  print('load_packer_config(false)')
  load_packer_config(false)
end


-- local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
-- if not packer_exists then
--   local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
--   vim.fn.system('git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
--   vim.cmd [[packadd packer.nvim]]
-- end

-- -- packer
-- local packer = require('packer').startup {
--   function(use)
--     use {'akinsho/bufferline.nvim',
--       tag = "v2.*",
--       requires = 'kyazdani42/nvim-web-devicons',
--       config = function()
--         require('bufferline').setup()
--       end,
--     }
--     }
--     use {'kyazdani42/nvim-tree.lua',
--       tag = 'nightly' -- optional, updated every week. (see issue #1193)
--       requires = {
--         'kyazdani42/nvim-web-devicons', -- optional, for file icons
--       },
--     use {'ervandew/supertab'}
--     use {'fatih/vim-go'}
--     use {'jjo/vim-cue'}
--     use {'folke/which-key.nvim'}
--     use {'folke/tokyonight.nvim'}
--     use {'majutsushi/tagbar'}
--     use {'milkypostman/vim-togglelist'}
--     use {'neovim/nvim-lspconfig'}
--     use {'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
--       config = function()
--         require("lsp_lines").setup()
--       end,
--     }
--     use {'norcalli/nvim-colorizer.lua'
--       config = function()
--         require('colorizer').setup()
--       end,
--     }
--     use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
--     use {'nvim-treesitter/nvim-treesitter',
--       run = function()
--         require('nvim-treesitter.install').update({ with_sync = true })
--       end,
--     }
--     use {'ray-x/lsp_signature.nvim'}
--     use {'tpope/vim-commentary'}
--     use {'tpope/vim-repeat'}
--     use {'tpope/vim-surround'}
--     use {'tpope/vim-unimpaired'}
--     use {'vim-scripts/a.vim'}
--     use {'wbthomason/packer.nvim', opt = true}
--   end,
-- }
-- if not packer_exists then packer.sync() end -- install on first run


-- vim.cmd[[colorscheme tokyonight]]
-- -- vim.g.tokyonight_transparent = true'

-- -- require('bufferline').setup()

-- -- setup colorizer
-- -- require('colorizer').setup()


-- -- vim-go
-- vim.g.go_echo_go_info = 0 -- https://github.com/fatih/vim-go/issues/2904#issuecomment-637102187
-- vim.g.go_fmt_command = 'gopls'
-- vim.g.go_gopls_gofumpt = 1

-- -- language server
-- local lspcfg = {
--   gopls =            {binary = 'gopls',                    format_on_save = nil         },
--   -- golangci_lint_ls = {binary = 'golangci-lint-langserver', format_on_save = nil         },
--   pylsp =            {binary = 'pylsp',                    format_on_save = '*.py'      },
--   pyright =          {binary = 'pyright',                  format_on_save = nil         },
--   rust_analyzer =    {binary = 'rust-analyzer',            format_on_save = '*.rs'      },
--   clojure_lsp =      {binary = 'clojure-lsp',              format_on_save = '*.clj'     },
--   yamlls =           {binary = 'yamlls',                   format_on_save = nil         },
--   bashls =           {binary = 'bash-language-server',     format_on_save = nil         },
--   dockerls =         {binary = 'docker-langserver',        format_on_save = 'Dockerfile'},
-- }
-- local lsp_keymaps = {
--   {capability = 'declaration',      mapping = 'gd',    command = 'buf.declaration'     },
--   {capability = 'implementation',   mapping = 'gD',    command = 'buf.implementation'  },
--   {capability = 'goto_definition',  mapping = '<c-]>', command = 'buf.definition'      },
--   {capability = 'type_definition',  mapping = '1gD',   command = 'buf.type_definition' },
--   {capability = 'hover',            mapping = 'K',     command = 'buf.hover'           },
--   {capability = 'signature_help',   mapping = '<c-k>', command = 'buf.signature_help'  },
--   {capability = 'find_references',  mapping = 'gr',    command = 'buf.references'      },
--   {capability = 'document_symbol',  mapping = 'g0',    command = 'buf.document_symbol' },
--   {capability = 'workspace_symbol', mapping = 'gW',    command = 'buf.workspace_symbol'},
-- }
-- local custom_lsp_attach = function(client)
--   require('lsp_signature').on_attach { hint_enable = false }
--   local opts = lspcfg[client.name]

--   -- autocomplete
--   vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- format on save
--   if opts['format_on_save'] ~= nil then
--     nvim_create_augroups({[client.name] = {{'BufWritePre', opts['format_on_save'], ':lua vim.lsp.buf.formatting_sync(nil, 1000)'}}})
--   end

--   -- conditional keymaps
--   for _, keymap in ipairs(lsp_keymaps) do
--     if client.resolved_capabilities[keymap.capability] then
--       lspremap(keymap.mapping, keymap.command)
--     end
--   end

--   -- unconditional keymaps
--   lspremap('gl', 'diagnostic.show_line_diagnostics')
-- end

-- -- only setup lsp clients for binaries that exist
-- local lsp = require('lspconfig')
-- for srv, opts in pairs(lspcfg) do
--   if vim.fn.executable(opts['binary']) then lsp[srv].setup({ on_attach = custom_lsp_attach }) end
-- end

-- -- Disable virtual_text since it's redundant due to lsp_lines
-- vim.diagnostic.config({
--   virtual_text = false,
-- })

-- -- productive arrow keys
-- nmap('<Up>',    '[e')
-- vmap('<Up>',    '[egv')
-- nmap('<Down>',  ']e')
-- vmap('<Down>',  ']egv')
-- nmap('<Left>',  '<<')
-- nmap('<Right>', '>>')
-- vmap('<Left>',  '<gv')
-- vmap('<Right>', '>gv')

-- -- clear hlsearch on redraw
-- nnoremap('<C-L>', ':nohlsearch<CR><C-L>')

-- -- telescope
-- nnoremap('<c-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
-- nnoremap('<c-b>', "<cmd>lua require('telescope.builtin').buffers()<cr>")
-- nnoremap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
-- nnoremap('<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
-- nnoremap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
-- nnoremap('<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- -- supertab
-- vim.g.SuperTabDefaultCompletionType = "<c-x><c-o>"
-- inoremap('<S-Tab>', '<C-v><Tab>')

-- -- clipboard
-- if vim.fn.has('unnamedplus') then vim.o.clipboard = 'unnamedplus' else vim.o.clipboard = 'unnamed' end

-- -- tags
-- snmap('<leader>o', ':TagbarToggle<CR>')

-- -- toggle paste and wrap
-- snmap('<leader>p', ':set invpaste<CR>:set paste?<CR>')
-- snmap('<leader>w', ':set invwrap<CR>:set wrap?<CR>')

-- -- strip trailing whitespace
-- nnoremap('<leader>sws', ':%s/\\s\\+$//e<CR>')
