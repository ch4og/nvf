{pkgs, ...}: {
  config.vim = {
    statusline.lualine.enable = true;
    telescope.enable = true;
    comments.comment-nvim.enable = true;
    filetree.neo-tree.enable = true;
    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
    presence.neocord.enable = true;
    binds.whichKey.enable = true;
    notes.todo-comments.enable = true;
    ui = {
      noice.enable = true;
      colorizer.enable = true;
    };
    # visuals.indent-blankline = {
    #   enable = true;
    #   setupOpts = {
    #     scope.exclude.language = ["dashboard"];
    #     indent.tab_char = "|";
    #   };
    # };
    git.gitsigns.enable = true;
    autopairs.nvim-autopairs.enable = true;
    # notes.obsidian.enable = true;
    utility = {
      vim-wakatime.enable = true;
      surround.enable = true;
      preview.glow = {
        enable = true;
      };
      motion.leap.enable = true;
      images.image-nvim = {
        enable = true;
        setupOpts = {
          backend = "kitty";
          integrations.markdown = {
            # clearInInsertMode = true;
            # onlyRenderAtCursor = true;
            downloadRemoteImages = true;
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; {
      dashboard-nvim = {
        package = dashboard-nvim;
        setup = builtins.readFile ./dashboard-nvim.lua;
      };
      vim-suda = {
        package = vim-suda;

        setup = "vim.g.suda_smart_edit = 1";
      };
      supermaven-nvim = {
        package = supermaven-nvim;
        setup = "require(\"supermaven-nvim\").setup({keymaps = {accept_suggestion = \"<C-space>\"} })";
      };
      bullets-vim = {
        package = bullets-vim;
      };
      img-clip-nvim = {
        package = img-clip-nvim;
      };
      headlines-nvim = {
        package = headlines-nvim;
        setup = ''
          vim.cmd [[highlight Headline1 guibg=#1e2718]]
          vim.cmd [[highlight Headline2 guibg=#21262d]]
          vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
          vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

          require("headlines").setup {
            org = {
              headline_highlights = { "Headline1", "Headline2" },
            },
          }'';
      };
    };
  };
}
