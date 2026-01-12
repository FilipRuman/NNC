{
  programs.waybar.enable = true;

  programs.waybar.style = ''
    @define-color white #A0A8CD;
    @define-color bar-bg #1a1b26;
    @define-color module-bg #11121D;
    @define-color baby-pink #FD7C94;
    @define-color green #98C379;
    @define-color vibrant-green #95C561;
    @define-color blue #648CE1;
    @define-color sun #DFAE67;
    @define-color red #EE6D85;
    @define-color purple #A485DD;
    @define-color dark-purple #9071C9;
    @define-color cyan #38A89D;
    @define-color firefox #fccb00;
    @define-color python #4584b6;
    @define-color git #e24329;
    @define-color catp #1e1e2e;
    @define-color grey #474853;

    @define-color white #A0A8CD;
    @define-color darker_black#0c0d18;
    @define-color black#11121D;
    @define-color black2#171823;
    @define-color one_bg#1d1e29;
    @define-color one_bg2#252631;
    @define-color one_bg3#252631;
    @define-color grey#474853;
    @define-color grey_fg#474853;
    @define-color grey_fg2#4e4f5a;
    @define-color light_grey#545560;
    @define-color red#ee6d85;
    @define-color baby_pink#fd7c94;
    @define-color pink#fe6D85;
    @define-color line#252631;
    @define-color green#98c379;
    @define-color vibrant_green#95c561;
    @define-color nord_blue#648ce1;
    @define-color blue#7199ee;
    @define-color yellow#d7a65f;
    @define-color sun#dfae67;
    @define-color purple#a485dd;
    @define-color dark_purple#9071c9;
    @define-color teal#519aba;
    @define-color orange#f6955b;
    @define-color cyan#38a89d;
    @define-color statusline_bg#161722;
    @define-color lightbg#2a2b36;
    @define-color pmenu_bg#ee6d85;
    @define-color folder_bg#7199ee;
    * {
      padding: 0px;
      margin: 0px;
      border-radius: 0px;
      font-family: "MesloLGM Nerd Font";
      font-size: 14px;
      font-weight: 800;
    }

    window#waybar {
      background: rgba(17, 18, 29, 0);
      color: @white;
      border-radius: 10;

    }


    #disk,
    #window,
    #mpris,
    #custom-spotify,
    #custom-updater,
    #memory,
    #network,
    #battery,
    #backlight,
    #pulseaudio,
    #clock,
    #custom-notification,
    #idle_inhibitor,
    #tray,
    #workspaces {
      background: @bar-bg;
      margin: 2px;
      padding: 2px;
      padding-left: 7px;
      padding-right: 7px;

      margin-top: 1px;
      margin-bottom: 1px;
      border-radius: 20px;
      padding: 2px 20px 2px 20px;
    }


    #custom-spotify {
      padding: 0 10 0 10px;
    }

    #workspaces {
      margin-left: 9px;
      background-color: @bar-bg;
      margin-top: 1px;
      margin-bottom: 1px;
      border-radius: 20px;

    }

    #window {
      background-color: @bar-bg;
      margin-top: 1px;
      margin-bottom: 1px;
      border-radius: 20px;
    }


    #custom-updater {
      color: @red;
    }

    #battery {
      color: @vibrant-green;

      /* background-color: @catp; */
      /* margin-top: 7px; */
      /* margin-bottom: 7px; */
      /* border-radius: 20px; */
    }

    @keyframes blink {
      to {
        background-color: #ffffff;
        color: #000000;
      }
    }

    #battery.critical:not(.connected) {
      background-color: #f53c3c;
      color: #ffffff;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #tray>.passive {
      -gtk-icon-effect: dim;
    }

    #tray>.needs-attention {
      -gtk-icon-effect: highlight;
      background-color: #eb4d4b;
    }

    #backlight {
      color: @sun;
      /* background-color: @catp; */
      /* margin-top: 7px; */
      /* margin-bottom: 7px; */
      /* border-radius: 20px; */
    }


    #network {
      color: @python;
    }


    #pulseaudio {
      /* padding-right: 0px; */
      /* background-color: @catp; */
      /* margin-top: 7px; */
      /* margin-bottom: 7px; */
      /* border-radius: 20px 0px 0px 10px; */
      /* margin-right: 0px; */
      color: @dark-purple;
    }

    #pulseaudio.microphone {
      /* padding-left: 0px; */

      /* background-color: @catp; */
      /* margin-top: 7px; */
      /* margin-bottom: 7px; */
      /* padding-left: 0px; */
      /* border-radius: 0px 10px 10px 0px; */
      color: @dark-purple;
    }

    #pulseaudio.microphone.source-muted {
      color: @module-bg;
      /* padding-left: 5px; */
      /* margin-left: 10px; */

      margin-top: 7px;
      margin-bottom: 7px;
    }

    #memory {
      color: @green;

      /* background-color: @sun; */
      /* margin-top: 10px; */
      /* margin-bottom: 10px; */
    }

    #bluetooth {
      color: @python;
    }

    #clock {
      color: @baby-pink;
      margin-right: 5px;
    }

    #disk {
      color: @cyan;
    }

    #tray {
      margin-right: 10px;
    }

    /* #window { */
    /*   color: @module-bg; */
    /*   background-color: @white; */
    /*   margin-top: 10px; */
    /*   margin-bottom: 10px; */
    /* } */

    #workspaces button {
      padding: 1px;
    }

    #workspaces button:nth-child(1) {
      color: @firefox;
    }

    #workspaces button:hover:nth-child(1) {
      color: @firefox;
    }

    #workspaces button.empty:nth-child(1) {
      color: @firefox;
    }

    #workspaces button.active:nth-child(1) {
      color: @firefox;

    }

    #workspaces button:nth-child(2) {
      color: @python;
    }

    #workspaces button:hover:nth-child(2) {
      color: @python;
    }

    #workspaces button.empty:nth-child(2) {
      color: @python;
    }

    #workspaces button.active:nth-child(2) {
      color: @python;
    }

    #workspaces button:nth-child(3) {
      color: @dark-purple;
    }

    #workspaces button:hover:nth-child(3) {
      color: @dark-purple;
    }

    #workspaces button.empty:nth-child(3) {
      color: @dark-purple;
    }

    #workspaces button.active:nth-child(3) {
      color: @dark-purple;
    }

    #workspaces button:nth-child(4) {
      color: @green;
    }

    #workspaces button:hover:nth-child(4) {
      color: @green;
    }

    #workspaces button.empty:nth-child(4) {
      color: @green;
    }

    #workspaces button.active:nth-child(4) {
      color: @green;
    }

    #workspaces button:nth-child(5) {
      color: @git;
    }

    #workspaces button:hover:nth-child(5) {
      color: @git;
    }

    #workspaces button.empty:nth-child(5) {
      color: @git;
    }

    #workspaces button.active:nth-child(5) {
      color: @git;
    }

    #workspaces button:nth-child(6) {
      color: @blue;
    }

    #workspaces button:hover:nth-child(6) {
      color: @blue;
    }

    #workspaces button.empty:nth-child(6) {
      color: @blue;
    }

    #workspaces button.active:nth-child(6) {
      color: @blue;
    }

    #workspaces button:nth-child(7) {
      color: @baby-pink;
    }

    #workspaces button:hover:nth-child(7) {
      color: @baby-pink;
    }

    #workspaces button.empty:nth-child(7) {
      color: @baby-pink;
    }

    #workspaces button.active:nth-child(7) {
      color: @baby-pink;
    }

    #workspaces button:nth-child(8) {
      color: @sun;
    }

    #workspaces button:hover:nth-child(8) {
      color: @baby-pink;
    }

    #workspaces button.empty:nth-child(8) {
      color: @baby-pink;
    }

    #workspaces button.active:nth-child(8) {
      color: @baby-pink;
    }

  '';
}
