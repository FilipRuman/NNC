from manim import *

class CodeWindow(VGroup):
    def __init__(
        self,
        title="src/main.ts",
        content="console.log('Hello World');",
        width=8,
        height=4.5,
        **kwargs
    ):
        super().__init__(**kwargs)

        # Window background
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


        # Title bar
        title_bar_height = 0.6
        
        title_bar = RoundedRectangle(
            width=width,
            height=title_bar_height,
            corner_radius=0.2,  # same radius as window
            fill_color="#2d2d2d",
            fill_opacity=1,
            stroke_width=0,
        )
        
        # Slight overlap removes any visible seam
        title_bar.move_to(
            window.get_top() + DOWN * (title_bar_height / 2 - 0.01) 
        )

        # Traffic-light buttons
        red = Dot(radius=0.08, color="#ff5f57")
        yellow = Dot(radius=0.08, color="#ffbd2e")
        green = Dot(radius=0.08, color="#28c840")

        buttons = VGroup(red, yellow, green).arrange(
            RIGHT, buff=0.12
        )

        buttons.move_to(
            title_bar.get_left() + RIGHT * 0.45
        )

        # Window title
        title_text = Text(
            title,
            font_size=26,
            font="FiraCode Nerd Font",
            color="#cfcfcf",
        )

        title_text.move_to(
            title_bar.get_center()
        )

        # Code/content area
        code_text = Text(
            content,
            font_size=20,
            color=WHITE,
            font="FiraCode Nerd Font",
            line_spacing=0.8,
        )

        code_text.align_to(window.get_left(), LEFT)
        code_text.shift(RIGHT * 0.35)

        content_top = title_bar.get_bottom() + DOWN * 0.25
        code_text.align_to(content_top, UP)

        self.add(
            window,
            title_bar,
            buttons,
            title_text,
            code_text,
        )

        self.window = window
        self.title_text = title_text
        self.code_text = code_text
        self.red_button = red



class DefaultTemplate(Scene):
    def construct(self):
        window = CodeWindow(
            title=open("/etc/nixos/NNC/utils/manim/notes/title.txt", "r", encoding="utf-8").read(),
            content=open("/etc/nixos/NNC/utils/manim/notes/text.txt", "r", encoding="utf-8").read(),
            width=8,
            height=4.5,
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
        
        # macOS-style close animation
        close_point = window.red_button.get_center()
        
        self.play(
            window.animate.scale(
                0.01,
                about_point=close_point,
            ).set_opacity(0),
            run_time=0.18,
            rate_func=rush_into,
        )
        
        # Move pointer back up
        self.play(
            pointer.animate.move_to(UP * 4.5),
            run_time=0.4,
            rate_func=smooth,
        )
        
        self.play(FadeOut(pointer), run_time=0.1)


