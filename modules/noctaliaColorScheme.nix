{
  flake.homeModules.general =

    let
      colors = {
        base00 = "#11121d";
        base01 = "#1A1B2A";
        base02 = "#212234";
        base03 = "#282c34";
        base04 = "#4a5057";
        base05 = "#a0a8cd";
        base06 = "#a0a8cd";
        base07 = "#a0a8cd";
        base08 = "#ee6d85";
        base09 = "#f6955b";
        base0A = "#d7a65f";
        base0B = "#95c561";
        base0C = "#38a89d";
        base0D = "#7199ee";
        base0E = "#a485dd";
        base0F = "#773440";
      };

      theme = {
        dark = {
          mPrimary = colors.base0B;
          mOnPrimary = colors.base00;

          mSecondary = colors.base0D;
          mOnSecondary = colors.base00;

          mTertiary = colors.base08;
          mOnTertiary = colors.base00;

          mError = colors.base08;
          mOnError = colors.base00;

          mSurface = colors.base00;
          mOnSurface = colors.base05;

          mSurfaceVariant = colors.base02;
          mOnSurfaceVariant = colors.base0B;

          mOutline = colors.base04;
          mShadow = colors.base00;

          mHover = colors.base01;
          mOnHover = colors.base05;

          terminal = {
            background = colors.base00;
            foreground = colors.base05;

            cursor = colors.base05;
            cursorText = colors.base00;

            selectionBg = colors.base05;
            selectionFg = colors.base00;

            normal = {
              black = colors.base00;
              red = colors.base08;
              green = colors.base0B;
              yellow = colors.base0A;
              blue = colors.base0D;
              magenta = colors.base0E;
              cyan = colors.base0C;
              white = colors.base05;
            };

            bright = {
              black = colors.base04;
              red = colors.base08;
              green = colors.base0B;
              yellow = colors.base0A;
              blue = colors.base0D;
              magenta = colors.base0E;
              cyan = colors.base0C;
              white = colors.base07;
            };
          };
        };

        light = {
          mPrimary = colors.base0B;
          mOnPrimary = colors.base07;

          mSecondary = colors.base0D;
          mOnSecondary = colors.base07;

          mTertiary = colors.base08;
          mOnTertiary = colors.base07;

          mError = colors.base08;
          mOnError = colors.base07;

          mSurface = colors.base07;
          mOnSurface = colors.base00;

          mSurfaceVariant = colors.base01;
          mOnSurfaceVariant = colors.base00;

          mOutline = colors.base0B;
          mShadow = colors.base03;

          mHover = colors.base02;
          mOnHover = colors.base00;

          terminal = {
            background = colors.base07;
            foreground = colors.base00;

            cursor = colors.base00;
            cursorText = colors.base07;

            selectionBg = colors.base00;
            selectionFg = colors.base07;

            normal = {
              black = colors.base07;
              red = colors.base08;
              green = colors.base0B;
              yellow = colors.base0A;
              blue = colors.base0D;
              magenta = colors.base0E;
              cyan = colors.base0C;
              white = colors.base00;
            };

            bright = {
              black = colors.base03;
              red = colors.base08;
              green = colors.base0B;
              yellow = colors.base0A;
              blue = colors.base0D;
              magenta = colors.base0E;
              cyan = colors.base0C;
              white = colors.base00;
            };
          };
        };
      };
    in
    {
      home.file.".config/noctalia/palettes/TokyoDarkTerminal.json".text = builtins.toJSON theme;
    };
}
