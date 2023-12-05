set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" set hlsearch on by default and not helps with v:hlsearch at all
set incsearch
set number
set relativenumber
set ruler

set hidden
set wildmenu
set wildmode=list:longest
" set wildoptions=pum
" set pumblend=10
set visualbell
set cursorline
set ttyfast
set laststatus=2

set ignorecase
set smartcase
set gdefault

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=3
set colorcolumn=80
set textwidth=0

set list
" set listchars=tab:▸\ ,trail:·

set completeopt=menu,menuone,noselect " from nvim-cmp




call plug#begin('~/.local/share/nvim/site/plugged')
" colorscheme:
Plug 'w0ng/vim-hybrid'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim'

" ThePrimeagen
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'neovim/nvim-lspconfig'

Plug 'mbbill/undotree'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'

" nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" cmp+vnsip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'terrortylor/nvim-comment'

Plug 'folke/which-key.nvim'

Plug 'Eandrju/cellular-automaton.nvim'

Plug 'kylechui/nvim-surround'

Plug 'ggandor/leap.nvim'

Plug 'sotte/presenting.vim'

call plug#end()


highlight Normal guibg=none


let mapleader = " "

" highlight under cursor
nnoremap <leader>h <cmd>let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

" leader write and close
noremap <leader>e <cmd>close<cr>
noremap <leader>s <cmd>update<cr>

" harpoon
noremap <leader>a <cmd>lua require("harpoon.mark").add_file()<cr>
noremap <leader>t <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
noremap <leader>1 <cmd>lua require("harpoon.ui").nav_file(1)<cr>
noremap <leader>2 <cmd>lua require("harpoon.ui").nav_file(2)<cr>
noremap <leader>3 <cmd>lua require("harpoon.ui").nav_file(3)<cr>
noremap <leader>4 <cmd>lua require("harpoon.ui").nav_file(4)<cr>
noremap <leader>5 <cmd>lua require("harpoon.ui").nav_file(5)<cr>

" next diagnostics
noremap <leader>nw <cmd>lua vim.diagnostic.goto_next()<cr>
noremap <leader>pw <cmd>lua vim.diagnostic.goto_prev()<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>rr <cmd>Telescope resume<cr>
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>lua require("telescope.builtin").find_files({["search_dirs"]={"ads", "junk/alb82", "logos", "yabs", "sandbox/projects", "contrib/python", "yt/python/yt/wrapper"}})<cr>
nnoremap <leader>fa <cmd>lua require("telescope.builtin").find_files({["search_dirs"]={"ads", "junk/alb82", "logos"}})<cr>
nnoremap <leader>fg <cmd>lua require("telescope.builtin").live_grep({["search_dirs"]={"ads", "junk/alb82", "logos"}})<cr>
nnoremap <leader>gyt <cmd>lua require("telescope.builtin").grep_string({["search_dirs"]={"yt/python/yt/wrapper"}})<cr>
nnoremap <leader>gyq <cmd>lua require("telescope.builtin").grep_string({["search_dirs"]={"yql/library"}})<cr>
nnoremap <leader>grec <cmd>lua require("telescope.builtin").grep_string({["search_dirs"]={"library/python/reactor/client"}})<cr>
nnoremap <leader>gd <cmd>lua require("telescope.builtin").grep_string({["search_dirs"]={"ads", "junk/alb82", "logos"}})<cr>
nnoremap <leader>f/ <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>
" nnoremap <leader>fr <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fh <cmd>Telescope harpoon marks<cr>
" nnoremap <leader>fhe <cmd>Telescope help_tags<cr>
nnoremap <leader>fdir <cmd>Telescope file_browser<cr>
nnoremap <leader>fdef <cmd>lua require("telescope.builtin").lsp_definitions()<cr>


" lsp
lua << EOF
    local custom_lsp_attach = function(client)
      -- See `:help nvim_buf_set_keymap()` for more information
      vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
      vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
      -- ... and other keymappings for LSP

      -- Use LSP as the handler for omnifunc.
      --    See `:help omnifunc` and `:help ins-completion` for more information.
      vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- For plugins with an `on_attach` callback, call them here. For example:
      -- require('completion').on_attach()
    end

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig').pylsp.setup{
        on_attach = custom_lsp_attach,
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        ignore = {'E501'} -- E501: line too long
                    }
                }
            }
        },
        flags = {
            allow_incremental_sync = false,
            debounce_text_changes = 500,
        },
    }

    require'lualine'.setup()

    require('telescope').setup{
      defaults = {
          file_sorter = require('telescope.sorters').get_fzy_sorter,
          prompt_prefix = ' > ',
          color_devicons = true,

          file_ignore_patterns = { "^search/", "/cache", "ads/pytorch/packages" },
          -- vimgrep_arguments = {
              -- "rg",
              -- "--color=never",
              -- "--no-heading",
              -- "--with-filename",
              -- "--line-number",
              -- "--column",
              -- "--smart-case",
          -- }
      },
      extensions = {
          fzy_native = {
              override_generic_sorter = false,
              override_file_sorter = true,
          }
      }
    }
    require('telescope').load_extension('fzy_native')
    require("telescope").load_extension('harpoon')


-- Setup nvim-cmp.
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer',
        option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
        }
      },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      {   name = 'buffer',
          max_item_count = 20
      }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      {   name = 'path',
          max_item_count = 20
      }
    }, {
      {   name = 'cmdline',
          max_item_count = 20
      }
    })
  })



  require('nvim_comment').setup{}
  -- gc{motion} - to comment/uncomment


  require'lualine'.setup{
    sections = {
        lualine_b = {
            {'diagnostics', sources={'nvim_lsp'}},
            'diff',
            'branch', 
        },
        lualine_c = {{'filename', path=1}},
    },
    inactive_sections = {
        lualine_c = {{'filename', path=1}},
    },
  }

  require("which-key").setup {}

  require("nvim-surround").setup({})

  require("leap").add_default_mappings()

  --require("gruvbox").setup({
  require("tokyonight").setup({
      contrast = "soft", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = true,
      transparent_mode = false,
  })
  --vim.cmd("colorscheme gruvbox")
  vim.cmd("colorscheme tokyonight")

  vim.filetype.add({
    filename = { ["ya.make"] = "yamake" }
  }) -- use with ~/.config/nvim/syntax/yamake.vim from arcadia

EOF
