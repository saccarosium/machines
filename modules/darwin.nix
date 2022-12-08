{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bashInteractive
    bash-completion
    nix-bash-completions
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  nix.package = pkgs.nix;
  environment.darwinConfig = "/Users/sacca/Repos/machines/modules/darwin.nix";

  system.defaults.NSGlobalDomain.KeyRepeat = 8;
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
  system.defaults.NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

  system.defaults.alf.stealthenabled = 1;

  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-delay = 0.0;
  system.defaults.dock.autohide-time-modifier = 0.0;
  system.defaults.dock.expose-animation-duration = 0.0;
  system.defaults.dock.orientation = "left";

  system.defaults.loginwindow.GuestEnabled = false;

  homebrew.enable = true;
  homebrew.onActivation.cleanup = "uninstall";
  homebrew.onActivation.upgrade = true;
  homebrew.brews = [ "bash" ];
  homebrew.casks = [
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
}
