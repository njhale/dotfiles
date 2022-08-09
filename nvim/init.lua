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
function vimremap(keymap, fn_name) bufsnoremap(keymap, '<cmd>lua vim.' .. fn_name .. '()<CR>') end

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
  'set title',
  'set ts=2 sts=2 sw=2 et ci',
  'set ttyfast',
  'set vb',
  'set virtualedit=all',
  'set visualbell',
  'set wrapscan',
  'set termguicolors',
  'set cpoptions+=_',
  'set syntax=on',
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
      'wbthomason/packer.nvim',
      'folke/which-key.nvim',
      'milkypostman/vim-togglelist',
      'ray-x/lsp_signature.nvim',
      'lukas-reineke/indent-blankline.nvim',
      'tpope/vim-commentary',
      'tpope/vim-repeat',
      'tpope/vim-sleuth',
      'tpope/vim-surround',
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
        'kyazdani42/nvim-web-devicons',
        config = exclude_on_bootstrap(function()
            require('nvim-web-devicons').setup()
        end),
      },
      {
        'kyazdani42/nvim-tree.lua',
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        requires = {'kyazdani42/nvim-web-devicons'},
        config = exclude_on_bootstrap(function()
          nnoremap('<c-n>', ':NvimTreeToggle<CR>')
          require('nvim-tree').setup({
            open_on_setup = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = true,
            view = {
              adaptive_size = true,
            },
            renderer = {
              indent_markers = {
                enable = true,
              },
            },
            update_focused_file = {
              enable = true,
              update_root = false,
              ignore_list = {},
            },
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
      {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = exclude_on_bootstrap(function()
          require('lualine').setup({
            options = {
              theme = 'tokyonight',
              -- globalstatus = true,
            },
            sections = {
              lualine_a = {'mode'},
              lualine_b = {'branch', 'diagnostics'},
              lualine_c = {'filename'},
              lualine_x = {'filetype', 'filesize'},
              lualine_y = {'progress'},
              lualine_z = {'location'},
            },
            extensions = {
              'nvim-tree',
              'quickfix',
            },
          })
        end)
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
          nnoremap('<leader>d', "<cmd>lua require('telescope.builtin').diagnostics()<cr>")
        end),
      },
      -- {
      --   'fatih/vim-go',
      --   config = exclude_on_bootstrap(function()
      --     vim.g.go_echo_go_info = 0 -- https://github.com/fatih/vim-go/issues/2904#issuecomment-637102187
      --     vim.g.go_fmt_command = 'gopls'
      --     vim.g.go_gopls_gofumpt = 1
      --   end),
      -- },
      {
        'nvim-treesitter/nvim-treesitter',
        config = exclude_on_bootstrap(function()
          require('nvim-treesitter.configs').setup({
            ensure_installed = { 'go' },
            auto_install = true,
            highlight = { enable = true },
          })
        end),
      },
      {
        'williamboman/mason.nvim',
        config = exclude_on_bootstrap(function()
          -- automatic LSP server installation for lspconfig (1/2 requirements)
          require('mason').setup()
        end)
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = exclude_on_bootstrap(function()
          -- automatic LSP server installation for lspconfig (2/2 requirements)
          require('mason-lspconfig').setup({
            automatic_installation = true,
          })
      end)
      },
      {
        'neovim/nvim-lspconfig',
        requires = {
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
        },
        config = exclude_on_bootstrap(function()
          local lspcfg = {
            gopls =            {binary = 'gopls',                    format_on_save = nil         },
            golangci_lint_ls = {binary = 'golangci-lint-langserver', format_on_save = nil         },
            pylsp =            {binary = 'pylsp',                    format_on_save = '*.py'      },
            pyright =          {binary = 'pyright',                  format_on_save = nil         },
            rust_analyzer =    {binary = 'rust-analyzer',            format_on_save = '*.rs'      },
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
            vimremap('gL', 'diagnostic.open_float')
          end

          local lsp = require('lspconfig')
          for srv, opts in pairs(lspcfg) do
            -- if vim.fn.executable(opts['binary']) then lsp[srv].setup({ on_attach = custom_lsp_attach }) end
            -- don't worry about the binary existing, it should be auto-installed by mason-lspconfig
            lsp[srv].setup({ on_attach = custom_lsp_attach })
          end
        end)
      },
      -- {
      --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      --   -- must be registered _after_ lspconfig
      --   config = exclude_on_bootstrap(function()
      --     require("lsp_lines").setup()
      --   end),
      -- },
    }
  end)
end

-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
  load_packer_config(true)
  require('packer').sync()
else
  load_packer_config(false)
end

