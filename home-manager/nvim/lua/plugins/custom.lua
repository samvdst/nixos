return {
  -- disable the search treesitter command
  {
    "folke/flash.nvim",
    keys = function()
      return {}
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  -- wakatime plugin
  {
    "wakatime/vim-wakatime",
  },

  -- run a command like :markdownpreview to start a local webserver
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "maintained",
      -- ignore_install = { "bicep", "jsdoc", "groovy", "slint" },
    },
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "json-lsp",
        "rust-analyzer",
        "eslint-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     local Util = require("lazyvim.util")
  --     local colors = {
  --       [""] = Util.ui.fg("Special"),
  --       ["Normal"] = Util.ui.fg("Special"),
  --       ["Warning"] = Util.ui.fg("DiagnosticError"),
  --       ["InProgress"] = Util.ui.fg("DiagnosticWarn"),
  --     }
  --     table.insert(opts.sections.lualine_x, 2, {
  --       function()
  --         local icon = require("lazyvim.config").icons.kinds.Copilot
  --         local status = require("copilot.api").status.data
  --         return icon .. (status.message or "")
  --       end,
  --       cond = function()
  --         local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
  --         return ok and #clients > 0
  --       end,
  --       color = function()
  --         if not package.loaded["copilot"] then
  --           return
  --         end
  --         local status = require("copilot.api").status.data
  --         return colors[status.status] or colors[""]
  --       end,
  --     })
  --   end,
  -- },

  -- -- sourcegraph cody (alternative to copilot)
  -- {
  --   "sourcegraph/sg.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   config = function()
  --     require("sg").setup({})
  --   end,
  -- },

  -- -- GitHub Copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   opts = {
  --     suggestion = {
  --       auto_trigger = true,
  --       keymap = {
  --         accept = "<A-l>",
  --         prev = "<A-[>",
  --         next = "<A-]>",
  --         dismiss = "<C-]>",
  --       },
  --     },
  --     panel = {
  --       auto_refresh = false,
  --       keymap = {
  --         accept = "<CR>",
  --         jump_prev = "[[",
  --         jump_next = "]]",
  --         refresh = "gr",
  --         open = "<A-CR>",
  --       },
  --     },
  --     filetypes = {
  --       markdown = true,
  --       help = true,
  --     },
  --   },
  -- },

  -- -- copilot cmp source
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       dependencies = "copilot.lua",
  --       opts = {},
  --       config = function(_, opts)
  --         local copilot_cmp = require("copilot_cmp")
  --         copilot_cmp.setup(opts)
  --         require("lazyvim.util").lsp.on_attach(function(client)
  --           if client.name == "copilot" then
  --             copilot_cmp._on_insert_enter({})
  --           end
  --         end)
  --       end,
  --     },
  --   },
  -- },
}
