from manim import *

class DefaultTemplate(Scene):
    def construct(self):
        logo = SVGMobject("/etc/nixos/NNC/utils/manim/logo/logo.svg")
        logo.scale_to_fit_width(config.frame_width * 0.8)
        logo.scale_to_fit_height(config.frame_height * 0.8)
        logo.move_to(ORIGIN)
        self.play(DrawBorderThenFill(logo))
