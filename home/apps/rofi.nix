{
  xdg.configFile = {
    "rofi/config.rasi".text = ''
      configuration {

        display-drun: "Applications:";

        display-window: "Windows:";

        drun-display-format: "{icon} {name}";

       font: "MesloLGM Nerd Font 14";
       show-icons: true;
       icon-theme: "Papirus";
       modi: "";
       /* modi: "window,run,drun";


        modi: "window,run,drun,emoji,calc"; */

      }



      @theme "/dev/null"



      * {

        bg: #11121D;

        bg-alt: #444b6a;



        fg: #FFFFFF;

        fg-alt: #787c99;
        align-self: center;


        background-color: @bg;



        border: 2px;

        margin: 0;

        padding: 0px;
         border-radius: 25px;
        spacing: 0;

      }



      window {

        width: 60%;
           transparency:                "real";
      }



      element {

        padding: 8 0;

        text-color: @fg-alt;

      }



      element selected {

        text-color: @fg;

      }



      element-text {


        background-color: inherit;
         text-align: center;
        text-color: inherit;

        vertical-align: 0.5;

      }



      element-icon {


        size: 30;


        size: 30;


        padding: 0 10 0 0;

      }



      entry {

        background-color: @bg-alt;

        padding: 12;
         text-align: center;
        text-color: @fg;

      }



      inputbar {

        children: [prompt, entry];

      }



      listview {

        padding: 8 12;

        background-color: @bg;
       justify-content: center;
        columns: 1;

        lines: 8;

      }



      mainbox {

        background-color: @bg;

        children: [inputbar, listview];

      }



      prompt {

        background-color: @bg-alt;

        enabled: false;

        padding: 0 0 0 0;

        text-color: @fg;

      }




    '';
  };
}
