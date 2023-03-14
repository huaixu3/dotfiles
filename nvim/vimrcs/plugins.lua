-- =============================
-- lualine config 
-- =============================
local lualine = require('lualine')
local config = {
    options = {
        icons_enabled = false,
        --theme = 'tokyonight',
        component_separators = { left = '|', right = '/'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {''},
        lualine_y = {'encoding',  'filetype'},
        lualine_z = {'location','progress'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = '#ffffff', gui = 'bold' },
}

lualine.setup(config)
-- ====================================
-- lsp config
-- ====================================
--require("nvim-lsp-installer").setup {
--    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
--}

require("mason").setup({
    -- install_root_dir = path.concat { vim.fn.stdpath "config", "lsp_servers" },
    install_root_dir =  vim.fn.stdpath "config".."/lsp_servers" ,
    PATH = "prepend",
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
})
--require("nvim-lspconfig").setup {}
--use {'neovim/nvim-lspconfig'}
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.tsserver.setup{}
--require'lspconfig'.typescriptlanguageserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.vuels.setup{}
require'lspconfig'.gopls.setup{}

-- ====================================
-- cmp config
-- ====================================

-- cmp
local cmp = require'cmp'

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<tab>'] =cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        --{ name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'buffer' },
        { name = 'path' }
    })
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    },{
        { name = 'buffer' },
    })
})
--Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    },{
        { name = 'cmdline' }
    })
})

-- ========================================================================
-- theme
-- ========================================================================
-- 配置主题颜色模式为 
require("tokyonight").setup({
  -- use the night style
  style = "storm",
  -- disable italic for functions
  styles ={
    comments ={ italic =true  },
    keywords ={ italic =true ,bold=true },
    sidebars = "dark"
  },
  dim_inactive = true
})
-- Lua
vim.cmd[[colorscheme tokyonight-storm]]

-- ========================================================================
-- Treesitter 代码高亮 增量选择
-- ========================================================================
require('nvim-treesitter.configs').setup({                                               
    -- 支持的语言
    ensure_installed = {"html", "css", "vim", "lua", "javascript", "typescript", "c", "cpp", "python","markdown"},
    -- 启用代码高亮
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    --启用增量选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    },
    -- 启用基于 Treesitter 的代码格式化(=)
    indent = {
        enable = true
    },
})
-- 开启代码折叠
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不折叠
vim.wo.foldlevel = 99
-- ========================================================================
-- terminal
-- ========================================================================
require("toggleterm").setup({
    open_mapping = [[<m-t>]],
    -- 打开新终端后自动进入插入模式
    start_in_insert = true,
    -- 在当前buffer的下方打开新终端
    direction = 'horizontal'
})
-- require("toggleterm").setup({
--     open_mapping = [[<d-t>]],
--     -- 打开新终端后自动进入插入模式
--     start_in_insert = true,
--     -- 在当前buffer的下方打开新终端
--     direction = 'horizontal'
-- })

-- ========================================================================
-- end
-- ========================================================================
vim.opt.conceallevel=0
