{ pkgs, ... }:
{
  home.username = "avinash";
  home.homeDirectory = "/home/avinash";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [

    brave
    libreoffice
    obsidian
    whatsapp-electron
    zed-editor

    # AI
    opencode
    opencode-desktop

    # Cloud
    pcloud

    # Image Editing
    gimp
    inkscape
    imagemagick

    # Terminal Tools
    bat
    lazygit
    lazydocker

    # Video Editing
    handbrake
    obs-studio
    shotcut
  ];

  # Setup Programs
  programs.bash = {
    enable = true;
    initExtra = ''
    export DELTA_FEATURES=+side-by-side
    # Run fastfetch only in interactive sessions
    if [[ $- == *i* ]]; then
      fastfetch
    fi
    '';
  };
  programs.starship.enable = true;
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      safe = {
        directory = "/etc/nixos";
      };
      user.email = "avinash.ravishankar@outlook.com";
      user.name = "TheBarbellCoder";
    };
  };
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      decorations = {
        hunk-header-style = "file line-number syntax";
        hunk-header-decoration-style = "none";
      };
      features = "decorations";
    };
  };
  programs.helix = {
    enable = true;
    defaultEditor = true;

    themes = {
      transparent = {
        "inherits" = "everforest_dark";
        "ui.background" = { };
        "ui.gutter" = { };
        "ui.menu" = { };
        "ui.popup" = { };
      };
    };

    settings = {
      editor = {
        line-number = "relative";
        completion-replace = true;
        # rulers = [80];
        color-modes = true;
        popup-border = "all";
        inline-diagnostics = {
          cursor-line = "info"; # show warnings and errors on the cursorline inline
          other-lines = "disable"; # show warnings and errors on the cursorline inline
        };
      };
      theme = "transparent";
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
        }
      ];
    };
  };

  # setup Services
  services.dropbox.enable = true;
  services.ssh-agent.enable = true;
}
