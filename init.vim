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
Plug 'gruvbox-community/gruvbox'

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
Plug 'kyazdani42/nvim-web-devicons'

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

call plug#end()


" colorscheme hybrid
colorscheme gruvbox
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

" Find files using Telescope command-line sugar.
nnoremap <leader>rr <cmd>Telescope resume<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fa <cmd>lua require("telescope.builtin").find_files({["search_dirs"]={"ads", "junk", "logos", "yabs"}})<cr>
nnoremap <leader>fg <cmd>lua require("telescope.builtin").live_grep({["search_dirs"]={"ads", "junk", "logos", "yabs"}})<cr>
nnoremap <leader>fk <cmd>lua require("telescope.builtin").live_grep({["search_dirs"]={"ads/bigkv"}})<cr>
nnoremap <leader>gd <cmd>lua require("telescope.builtin").grep_string({["search_dirs"]={"ads", "junk", "logos", "yabs"}})<cr>
nnoremap <leader>ffile <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>
nnoremap <leader>fr <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
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
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
        }
    }

    require'lualine'.setup()

    require('telescope').setup{
      defaults = {
          file_sorter = require('telescope.sorters').get_fzy_sorter,
          prompt_prefix = ' > ',
          color_devicons = true,

          file_ignore_patterns = { "^search/", },
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
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
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

EOF
