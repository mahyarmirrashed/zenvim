# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin =
    src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    inherit (pkgs-locked) wrapNeovimUnstable neovimUtils;
  };

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins = with pkgs.vimPlugins; [
    # Plugins from nixpkgs go in here.
    # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=vimPlugins
    nvim-treesitter.withAllGrammars
    lze # https://github.com/BirdeeHub/lze
    lzextras # https://github.com/BirdeeHub/lzextras
    # >>> Editor
    auto-session # https://github.com/rmagatti/auto-session
    blink-cmp # https://github.com/Saghen/blink.cmp
    conform-nvim # https://github.com/stevearc/conform.nvim
    nvim-early-retirement # https://github.com/chrisgrieser/nvim-early-retirement
    nvim-lint # https://github.com/mfussenegger/nvim-lint
    nvim-lspconfig # https://github.com/neovim/nvim-lspconfig
    nvim-ts-autotag # https://github.com/windwp/nvim-ts-autotag
    trouble-nvim # https://github.com/folke/trouble.nvim
    # >>> Git integration
    gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim
    lazygit-nvim # https://github.com/kdheepak/lazygit.nvim
    # >>> Telescope and extensions
    telescope-nvim # https://github.com/nvim-telescope/telescope.nvim
    todo-comments-nvim # https://github.com/folke/todo-comments.nvim
    # >>> UI
    alpha-nvim # https://github.com/goolord/alpha-nvim
    famous-quotes-nvim # https://github.com/mahyarmirrashed/famous-quotes-nvim
    fidget-nvim # https://github.com/j-hui/fidget.nvim
    gruvbox-nvim # https://github.com/ellisonleao/gruvbox.nvim
    lualine-nvim # https://github.com/nvim-lualine/lualine.nvim
    no-neck-pain-nvim # https://github.com/shortcuts/no-neck-pain.nvim
    oil-nvim # https://github.com/stevearc/oil.nvim
    render-markdown-nvim # https://github.com/MeanderingProgrammer/render-markdown.nvim
    # >>> bleeding-edge plugins from flake inputs
    # (mkNvimPlugin inputs.wf-nvim "wf.nvim") # (example) keymap hints | https://github.com/Cassin01/wf.nvim
    (mkNvimPlugin inputs.auto-fix-return-nvim "auto-fix-return-nvim") # https://github.com/Jay-Madden/auto-fix-return.nvim
    (mkNvimPlugin inputs.checkmate-nvim "checkmate-nvim") # https://github.com/bngarren/checkmate.nvim
    (mkNvimPlugin inputs.freeze-nvim "freeze-nvim") # https://github.com/charm-and-friends/freeze.nvim
    (mkNvimPlugin inputs.helm-ls-nvim "helm-ls-nvim") # https://github.com/qvalentin/helm-ls.nvim
    (mkNvimPlugin inputs.lazydocker-nvim "lazydocker-nvim") # https://github.com/crnvl96/lazydocker.nvim
    ((mkNvimPlugin inputs.lazyjj-nvim "lazyjj-nvim").overrideAttrs {
      dependencies = [ plenary-nvim ];
    }) # https://github.com/swaits/lazyjj.nvim
    ((mkNvimPlugin inputs.schema-companion-nvim "schema-companion.nvim").overrideAttrs {
      dependencies = [ plenary-nvim ];
    }) # https://github.com/cenk1cenk2/schema-companion.nvim
    ((mkNvimPlugin inputs.search-and-replace-nvim "search-and-replace.nvim").overrideAttrs {
      dependencies = [ plenary-nvim ];
    }) # https://github.com/mahyarmirrashed/search-and-replace.nvim
    # >>> Miscellaneous
    better-escape-nvim # https://github.com/max397574/better-escape.nvim
    cloak-nvim # https://github.com/laytan/cloak.nvim
    comment-nvim # https://github.com/numToStr/Comment.nvim
    mini-surround # https://github.com/echasnovski/mini.surround
    nvim-autopairs # https://github.com/windwp/nvim-autopairs
    which-key-nvim # https://github.com/folke/which-key.nvim
    # >>> Plugin dependencies
    plenary-nvim
    nvim-web-devicons
    treesj
  ];

  extraPackages = with pkgs; [
    # >>> Language servers
    gopls
    helm-ls
    just-lsp
    lua-language-server
    nixd
    svelte-language-server
    tinymist
    typescript-language-server
    rust-analyzer
    yaml-language-server
    # >>> Linters
    hadolint
    # >>> Formatters
    gofumpt
    gotools
    jq
    nixfmt-rfc-style
    prettierd
    rustfmt
    shfmt
    stylua
    yamlfmt
    # >>> Dependencies
    cargo
    charm-freeze
    delta
    fd
    fzf
    lazydocker
    lazygit
    lazyjj
    ripgrep
    sad
  ];
in
{
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
    appName = "zenvim";
  };

  # This is meant to be used within a devshell.
  # Instead of loading the lua Neovim configuration from
  # the Nix store, it is loaded from $XDG_CONFIG_HOME/nvim-dev
  nvim-dev = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
    appName = "zenvim-dev";
    wrapRc = false;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
