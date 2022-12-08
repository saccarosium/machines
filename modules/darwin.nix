{ pkgs, ... }:
let
  home = builtins.getEnv "HOME";
in
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment = {
    variables = {
      LANG = "en_US.UTF-8";
    };

    darwinConfig = "${home}/Repos/machines/modules/darwin.nix";
    systemPackages = with pkgs; [
      bashInteractive
      bash-completion
      nix-bash-completions
    ];
  };

  nix.package = pkgs.nix;
  services = {
    nix-daemon.enable = true;
  };

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        KeyRepeat = 2;
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        expose-animation-duration = 0.0;
        orientation = "left";
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = true;
      };
      alf = {
        stealthenabled = 1;
      };
      loginwindow = {
        GuestEnabled = false;
      };
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };
    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/core"
      "homebrew/services"
      "wez/wezterm"
    ];
    brews = [
      "bash"
    ];
    casks = [
      "anki"
      "brave-browser"
      "discord"
      "ferdium"
      "hammerspoon"
      "karabiner-elements"
      "keepassxc"
      "keepingyouawake"
      "little-snitch"
      "logisim-evolution"
      "mactex-no-gui"
      "nextcloud"
      "onlyoffice"
      "onyx"
      "pika"
      "protonvpn"
      "raspberry-pi-imager"
      "signal"
      "tor-browser"
      "via"
      "visual-studio-code"
      "wezterm"
    ];
  };
}
