{ pkgs, ... }:

{
  systemd.user.services."app-com.mitchellh.ghostty" = {
    Unit = {
      Description = "Ghostty";
      After = [ "graphical-session.target" "dbus.socket" ];
      Requires = "dbus.socket";
    };

    Service = {
      Type = "notify-reload";
      ReloadSignal = "SIGUSR2";
      BusName = "com.mitchellh.ghostty";
      ExecStart = "${pkgs.ghostty}/bin/ghostty --gtk-single-instance=true --initial-window=false";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}