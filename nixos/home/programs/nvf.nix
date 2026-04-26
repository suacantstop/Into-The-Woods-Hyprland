{ pkgs, lib, ... }:
let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  programs.nvf = {
    enable = true;

    settings.vim.extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      fd
    ];

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
        transparent = true;
      };

      luaConfigRC.clipboard = ''
        vim.opt.clipboard = "unnamedplus"
      '';

      luaConfigRC.customColors = ''
        vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
            vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
            vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
          end,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "NONE", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#${c.bg2}" })
            vim.api.nvim_set_hl(0, "Visual", { bg = "#${c.bg3}" })
            vim.api.nvim_set_hl(0, "Search", { fg = "#${c.bg0}", bg = "#${c.accentBlue}" })
            vim.api.nvim_set_hl(0, "IncSearch", { fg = "#${c.bg0}", bg = "#${c.accentViolet}" })
            vim.api.nvim_set_hl(0, "Comment", { fg = "#${c.fg1}", italic = true })
            vim.api.nvim_set_hl(0, "Function", { fg = "#${c.accentBlue}" })
            vim.api.nvim_set_hl(0, "Keyword", { fg = "#${c.accentViolet}" })
            vim.api.nvim_set_hl(0, "String", { fg = "#${c.accentGreen}" })
            vim.api.nvim_set_hl(0, "Type", { fg = "#${c.accentCyan}" })
            vim.api.nvim_set_hl(0, "Error", { fg = "#${c.danger}" })
          end,
        })

        vim.schedule(function()
          vim.cmd("doautocmd ColorScheme")
        end)
      '';

      luaConfigRC.extraPlugins = ''
        require("ibl").setup({ indent = { char = "│" }, scope = { enabled = true } })
        require("colorizer").setup()
        require("todo-comments").setup()
        require("trouble").setup()
        require("hop").setup()
      '';

      lineNumberMode = "relNumber";

      statusline.lualine = {
        enable = true;
        theme = "auto";
      };

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          close_if_last_window = true;
          enable_git_status = true;
          filesystem = {
            filtered_items = {
              hide_dotfiles = false;
            };
          };
          window = {
            width = 30;
          };
        };
      };

      telescope.enable = true;
      treesitter = {
        enable = true;
        fold = true;
        context.enable = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        lightbulb.enable = true;
      };

      autocomplete.nvim-cmp = {
        enable = true;
        setupOpts.sources = lib.mkForce [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      snippets.luasnip.enable = true;
      git = {
        enable = true;
        gitsigns.enable = true;
      };

      autopairs.nvim-autopairs.enable = true;
      comments.comment-nvim.enable = true;
      binds.whichKey.enable = true;

      startPlugins = with pkgs.vimPlugins; [
        indent-blankline-nvim
        nvim-colorizer-lua
        todo-comments-nvim
        trouble-nvim
        hop-nvim
      ];

      maps.normal = {
        "L" = { action = ":bnext<CR>"; desc = "Next buffer"; };
        "H" = { action = ":bprevious<CR>"; desc = "Prev buffer"; };
        "<leader>e" = { action = ":Neotree toggle<CR>"; silent = true; desc = "Toggle explorer"; };
        "<leader>ff" = { action = ":Telescope find_files<CR>"; };
        "<leader>w" = { action = ":w<CR>"; };
        "<leader>q" = { action = ":q<CR>"; };
        "<C-h>" = { action = "<C-w>h"; };
        "<C-j>" = { action = "<C-w>j"; };
        "<C-k>" = { action = "<C-w>k"; };
        "<C-l>" = { action = "<C-w>l"; };
      };

      maps.insert = {
        "jk" = { action = "<Esc>"; };
      };

      maps.visual = {
        "<leader>y" = { action = ''"+y''; };
      };
    };
  };
}
