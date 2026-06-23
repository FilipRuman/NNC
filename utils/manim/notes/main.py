from manim import *
class CodeWindow(VGroup):
    def __init__(
        self,
        title="src/main.ts",
        content="console.log('Hello World');",
        **kwargs
    ):
        super().__init__(**kwargs)
        title_text = Text(
            title.strip(),
            font_size=26,
            font="FiraCode Nerd Font",
            color="#cfcfcf",
        )

        lines = content.rstrip("\n").split("\n")

        code_text = VGroup(*[
            Text(
                line,
                font_size=20,
                font="FiraCode Nerd Font",
                color=WHITE,
            )
            for line in lines
        ])

        code_text.arrange(
            DOWN,
            aligned_edge=LEFT,
            buff=0.08
        )
        title_bar_height = 0.6

        padding_x = 0.45
        padding_top = 0.25
        padding_bottom = 0.35

        content_width = max(
            line.width for line in code_text
        )

        width = max(
            title_text.width,
            content_width
        ) + padding_x * 2

        height = (
            title_bar_height
            + code_text.height
            + padding_top
            + padding_bottom
        )
        window = RoundedRectangle(
            width=width,
            height=height,
            corner_radius=0.2,
            fill_color="#1e1e1e",
            fill_opacity=1,
            stroke_color="#ffffff",
            stroke_opacity=0.08,
            stroke_width=1,
        )
        title_bar = RoundedRectangle(
            width=width,
            height=title_bar_height,
            corner_radius=0.2,
            fill_color="#2d2d2d",
            fill_opacity=1,
            stroke_width=0,
        )

        title_bar.move_to(
            window.get_top()
            + DOWN * (title_bar_height / 2 - 0.01)
        )
        red = Dot(
            radius=0.08,
            color="#ff5f57"
        )

        yellow = Dot(
            radius=0.08,
            color="#ffbd2e"
        )

        green = Dot(
            radius=0.08,
            color="#28c840"
        )

        buttons = VGroup(
            red,
            yellow,
            green
        ).arrange(
            RIGHT,
            buff=0.12
        )

        buttons.move_to(
            title_bar.get_left()
            + RIGHT * 0.45
        )
        title_text.move_to(
            title_bar.get_center()
        )
        code_text.align_to(
            window.get_left(),
            LEFT
        )

        code_text.shift(
            RIGHT * padding_x
        )

        code_text.align_to(
            title_bar.get_bottom()
            + DOWN * 0.25,
            UP
        )


        # ----------------------------
        # Add
        # ----------------------------

        self.add(
            window,
            title_bar,
            buttons,
            title_text,
            code_text,
        )


        # Public references
        self.window = window
        self.title_text = title_text
        self.code_text = code_text

        self.red_button = red
        self.yellow_button = yellow
        self.green_button = green
class DefaultTemplate(Scene):
    def construct(self):
        window = CodeWindow(
            title=open("/etc/nixos/NNC/utils/manim/notes/title.txt", "r", encoding="utf-8").read(),
            content=open("/etc/nixos/NNC/utils/manim/notes/text.txt", "r", encoding="utf-8").read(),
        )

        # Start above the screen
        final_pos = ORIGIN  

        window.move_to(final_pos + UP * 6)

        self.play(
            window.animate.move_to(final_pos),
            run_time=.4,
            rate_func=smooth,
        )
        self.wait(1)


        # Mouse pointer
        pointer = SVGMobject("/etc/nixos/NNC/utils/manim/notes/pointer.svg")
        pointer.scale(0.15)
        
        # Start above screen
        pointer.move_to(UP * 4.5)
        
        self.play(FadeIn(pointer), run_time=0.15)
        
        # Move to red button
        target = window.red_button.get_center() + DOWN * 0.03 + RIGHT * 0.03
        
        self.play(
            pointer.animate.move_to(target),
            run_time=0.5,
            rate_func=smooth,
        )
        
        # Click
        
        self.play(
            pointer.animate.scale(0.92),
            run_time=0.06,
        )
        
        self.play(
            pointer.animate.scale(1 / 0.92),
            run_time=0.08,
        )
        
        # close animation
        close_point = window.red_button.get_center()
        
        self.play(
            window.animate.scale(
                0.01,
                about_point=close_point,
            ).set_opacity(0),
            run_time=0.18,
            rate_func=rush_into,
        )
        
        self.play(
            pointer.animate.move_to(UP * 4.5),
            run_time=0.4,
            rate_func=smooth,
        )
        
        self.play(FadeOut(pointer), run_time=0.1)


