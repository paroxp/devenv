{ config, pkgs, lib, ... }:

let cfg = config.localConfiguration; in lib.mkIf (cfg.desktopEnvironment.kde.enable) {
  # Open ports for KDE Connect
  networking.firewall.allowedTCPPorts = [
                        1714 1715 1716 1717 1718 1719
    1720 1721 1722 1723 1724 1725 1726 1727 1728 1729
    1730 1731 1732 1733 1734 1735 1736 1737 1738 1739
    1740 1741 1742 1743 1744 1745 1746 1747 1748 1749
    1750 1751 1752 1753 1754 1755 1756 1757 1758 1759
    1760 1761 1762 1763 1764
  ];
  networking.firewall.allowedUDPPorts = [
                        1714 1715 1716 1717 1718 1719
    1720 1721 1722 1723 1724 1725 1726 1727 1728 1729
    1730 1731 1732 1733 1734 1735 1736 1737 1738 1739
    1740 1741 1742 1743 1744 1745 1746 1747 1748 1749
    1750 1751 1752 1753 1754 1755 1756 1757 1758 1759
    1760 1761 1762 1763 1764
  ];

  environment.systemPackages = with pkgs; [
    arc-kde-theme
    ark
    bluedevil
    digikam5
    dolphin
    gwenview
    kdeApplications.dolphin-plugins
    kdeApplications.print-manager
    kdeApplications.spectacle
    kdeconnect
    kdeFrameworks.kconfig
    kdeFrameworks.kconfigwidgets
    kdeplasma-addons
    kgpg
    konsole
    okular
    pinentry_qt5
    simple-scan
    yakuake
  ];

  services.xserver.desktopManager.plasma5.enable = true;
}
