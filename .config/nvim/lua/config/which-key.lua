require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {
            min = 4,
            max = 25
        }, -- min and max height of the columns
        width = {
            min = 20,
            max = 50
        }, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}


-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {
    noremap = true,
    silent = true
})
vim.g.mapleader = ' '

-- explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

-- TODO create entire treesitter section

local mappings = {
    ["/"] = "Comment",
    ["x"] = "Close Buffer",
    ["e"] = "Explorer",
    ["f"] = "Find File",
    ["h"] = "No Highlight",
    -- TODO enable debuging for c and cpp programs
    -- utils.map('n', '<Leader>d', '<Cmd>call vimspector#Launch()<CR>')
    d = {
        name = "+Debug",
        b = {"<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint"},
        c = {"<cmd>call vimspector#Continue()<cr>", "Continue"},
        i = {"<cmd>call vimspector#StepInto()", "Step Into"},
        o = {"<cmd>call vimspector#StepOver()<cr>", "Step Over"},
        p = {"<cmd>call vimspector#Pause()<cr>", "Pause"},
        r = {"<cmd>call vimspector#Restart()<cr>", "Restart"},
        s = {"<cmd>:lua cPer.startDebuging()<cr>", "Start"},
        x = {"<cmd>call vimspector#Reset()<cr>", "close"}
    },
    g = {
        name = "+Git",
        j = {"<cmd>NextHunk<cr>", "Next Hunk"},
        k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
        p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
        s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
        u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"}
    },
    l = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
    },

    s = {
        name = "+Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"}
    },
    S = {
        name = "+Session",
        s = {"<cmd>SessionSave<cr>", "Save Session"},
        l = {"<cmd>SessionLoad<cr>", "Load Session"}
    },
    c={
        name="+c per",
        r={"<cmd>:lua cPer.runCode()<cr>","run c code"},
        d={"<cmd>Dox<cr>","insert doc block"},
        u={"<cmd>DoxUndoc<cr>","insert doc block"},


    },
    t = {
       name = '+terminal' ,
       o={'<cmd>FloatermNew --wintype=popup --height=6<cr>', 'terminal'},
       f ={'<cmd>FloatermNew fzf<cr>','fzf'},
       g={'<cmd>FloatermNew lazygit<cr>', 'git'},
      -- 'd' : [':FloatermNew lazydo<cr>cker'                        , 'docker'],
       n = {'<cmd>FloatermNew node<cr>', 'node'},
    --   N= { '<cmd>FloatermNew nnn' , 'nnn'},
       p={ '<cmd>FloatermNew python<cr>', 'python'},
       --r={ '<cmd>FloatermNew ranger', 'ranger'},
       t= {'<cmd>FloatermToggle<cr>','toggle'},
       y = {'<cmd>FloatermNew ytop<cr>','ytop'},
       --s= {'<cmd>FloatermNew ncdu','ncdu'},
       },
       w={
               name= "+window",
               s = "Split window",
               v = "Split window vertically",
               w = "Switch windows",
               q = "Quit a window",
               T = "Break out into a new tab",
               x = "Swap current with next",
               ["-"] = "Decrease height",
               ["+"] = "Increase height",
               ["<lt>"] = "Decrease width",
               [">"] = "Increase width",
               ["|"] = "Max out the width",
               ["="] = "Equally high and wide",
               h = "Go to the left window",
               l = "Go to the right window",
               k = "Go to the up window",
               j = "Go to the down window",
       },
       
}

local wk = require("which-key")
wk.register(mappings, opts)
