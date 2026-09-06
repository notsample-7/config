{ pkgs, lib, ... }:

let
  enableCustomIcons = false;
  icons = [
    {
      name = "github";
      url = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/github-light.svg";
      hash = "sha256-/z0Yv50GoifM/VVpdLL880T4Mz/lKGOlJcvV5D/eoAQ=";
    }
    {
      name = "youtube-music";
      url = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/youtube-music.svg";
      hash = "sha256-PZK9hQapa1ZvHKmVCWQhBy7d7wl6ydULUOrLctM9leQ=";
    }
    {
      name = "whatsapp";
      url = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/whatsapp.svg";
      hash = "sha256-Yp/4FGnBIAoAw85w2Cmuj6pIcvpPeG2tiQ1klmaV/UI=";
    }
    {
      name = "enteauth";
      url = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/ente-auth.svg";
      hash = "sha256-bW/IU1QbC6NwKZkVrvX9GnGPIa97ExOUo/9EDr99ITM=";
    }
    {
      name = "gmail";
      url = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/gmail.svg";
      hash = "sha256-3rk6+CjZExIr4mLNwHxcq2tWCajoLIhbfYQbc1+uFn4=";
    }
    {
      name = "proton-mail";
      url = "https://raw.githubusercontent.com/ente-io/ente/main/mobile/apps/auth/assets/custom-icons/icons/proton_mail.svg";
      hash = "sha256-cHJIZ/pJ3tLMFvB38xMV5F+JzQvErRD3BlQrIT9uvvo=";
    }
    {
      name = "protonvpn-logo";
      url = "https://raw.githubusercontent.com/ente-io/ente/main/mobile/apps/auth/assets/custom-icons/icons/proton_vpn.svg";
      hash = "sha256-HHG1cS/pvrFgWHFDHV2WfXWqw+MAzXZk7pfD9OcXAnc=";
    }
  ];
in
{
  xdg.dataFile = lib.mkIf enableCustomIcons (builtins.listToAttrs (map
    ({ name, url, hash }: {
      name = "icons/hicolor/256x256/apps/${name}.svg";
      value.source = pkgs.fetchurl { inherit url hash; };
    })
    icons));

  xdg.desktopEntries.emacs = {
    name = "Emacs";
    genericName = "Text Editor";
    comment = "Edit text";
    exec = "emacsclient -c %F";
    terminal = false;
    type = "Application";
    icon = "emacs";
    categories = [ "Development" "TextEditor" ];
    startupNotify = true;
  };

  xdg.desktopEntries.emacsclient = {
    name = "Emacs (Client)";
    noDisplay = true;
  };

  xdg.desktopEntries.youtube-music = {
    name = "YouTube Music";
    comment = "Listen to music on YouTube";
    exec = "chromium --profile-directory=Default --app=https://music.youtube.com";
    icon = "youtube-music";
    terminal = false;
    categories = [ "Audio" "Music" "Player" ];
    startupNotify = true;
    settings = {
      StartupWMClass = "chrome-music.youtube.com__-Default";
    };
  };

  xdg.desktopEntries.whatsapp = {
    name = "WhatsApp";
    comment = "Send and receive messages";
    exec = "chromium --profile-directory=Default --app=https://web.whatsapp.com";
    icon = "whatsapp";
    terminal = false;
    categories = [ "Network" "InstantMessaging" ];
    startupNotify = true;
    settings = {
      StartupWMClass = "chrome-web.whatsapp.com__-Default";
    };
  };

  xdg.desktopEntries.gmail = {
    name = "Gmail";
    comment = "Email that's intuitive, efficient, and useful";
    exec = "chromium --profile-directory=Default --app=https://mail.google.com";
    icon = "gmail";
    terminal = false;
    categories = [ "Network" "Email" "Office" ];
    startupNotify = true;
    settings = {
      StartupWMClass = "chrome-mail.google.com__-Default";
    };
  };

  xdg.desktopEntries.protonmail = {
    name = "Proton Mail";
    comment = "Secure, private email";
    exec = "chromium --profile-directory=Default --app=https://mail.proton.me";
    icon = "proton-mail";
    terminal = false;
    categories = [ "Network" "Email" "Office" ];
    startupNotify = true;
    settings = {
      StartupWMClass = "chrome-mail.proton.me__-Default";
    };
  };

  xdg.desktopEntries."proton.vpn.app.gtk" = {
    name = "Proton VPN";
    comment = "Proton VPN GUI client";
    exec = "protonvpn-app";
    icon = "protonvpn-logo";
    terminal = false;
    categories = [ "Network" ];
    settings = {
      StartupWMClass = ".protonvpn-app-wrapped";
    };
  };

  xdg.desktopEntries.btop = {
    name = "btop";
    genericName = "System Monitor";
    comment = "Resource monitor that shows usage and stats for processor, memory, disks, network and processes";
    icon = "btop";
    exec = "ghostty -e btop";
    terminal = false;
    categories = [ "System" "Monitor" "ConsoleOnly" ];
  };

  xdg.desktopEntries.LocalSend = {
    name = "LocalSend";
    genericName = "An open source cross-platform alternative to AirDrop";
    icon = "localsend";
    exec = "env GTK_CSD=0 localsend_app %U";
    terminal = false;
    categories = [ "GTK" "FileTransfer" "Utility" ];
    startupNotify = true;
    settings = {
      StartupWMClass = "localsend_app";
    };
  };

  xdg.desktopEntries.yazi = {
    name = "Yazi";
    comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
    icon = "yazi";
    exec = "ghostty -e yazi %f";
    terminal = false;
    categories = [ "System" "FileManager" "FileTools" "ConsoleOnly" ];
    mimeType = [ "inode/directory" ];
  };

  # Overrides dev.noctalia.Noctalia.desktop from the noctalia package
  xdg.desktopEntries."dev.noctalia.Noctalia" = {
    name = "Noctalia";
    genericName = "Website";
    comment = "Open the Noctalia project homepage";
    exec = "xdg-open https://noctalia.dev";
    icon = "noctalia";
    terminal = false;
    type = "Application";
    categories = [ "Network" ];
    startupNotify = false;
  };
}
