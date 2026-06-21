from manim import *

class ShowWriteReversed(Scene):
    def construct(self):
        text = open("/etc/nixos/NNC/utils/manim/write/text.txt", "r", encoding="utf-8").read();
        font_size = open("/etc/nixos/NNC/utils/manim/write/font_size.txt", "r", encoding="utf-8").read();
        text_c = Text(text, font = "Stretch Pro", font_size=font_size);
        self.play(Write(text_c, reverse=False, remover=True));
        self.play(Unwrite(text_c))
        


