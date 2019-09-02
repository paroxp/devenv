{ config, pkgs, ... }:

{
  services.accounts-daemon.enable = true;
  services.openssh.enable = true;
  services.pcscd.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization pkgs.libu2f-host ];
  services.gnome3 = {
    chrome-gnome-shell.enable = true;
    gnome-keyring.enable = true;
  };

  services.xserver = {
    enable = true;
    autorun = true;
    desktopManager = {
      gnome3.enable = true;
      xterm.enable = false;
    };
    displayManager = {
      gdm = {
        enable = true;
        wayland = false;
      };
    };
    layout = "us";
    videoDrivers = [ "nvidia" ];
    
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
          compton
          dunst
          feh
          ffmpeg
          i3lock
          lxappearance
          playerctl
          (polybar.override { i3GapsSupport = true; githubSupport = true; })
          (python3.withPackages (ps: with ps; [ python3Packages.dbus-python ]))
          rofi
          termite
      ];
      package = pkgs.i3-gaps;
    };
  };

  environment.shellInit = ''
    export GPG_TTY="$(tty)"
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  '';

  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}
