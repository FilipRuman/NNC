import { makeScene2D, LezerHighlighter, Layout, lines, Img, Txt } from '@motion-canvas/2d';
import { createRef, waitFor, all } from '@motion-canvas/core';

import { CodeWindow } from '../components/CodeWindow';
import { Panel } from '../components/Panel';
import { MyStyle } from '../components/TextStyle';


import { parser as rust_parser } from '@lezer/rust';
const RustHighlighter = new LezerHighlighter(rust_parser, MyStyle);
import { parser as c_parser } from '@lezer/cpp';
const CHighlighter = new LezerHighlighter(c_parser, MyStyle);
import backgroundImage from '../Background.jpg';



// fontFamily="FiraCode Nerd Font"

export default makeScene2D(function*(view) {



        const leftWindow = createRef<CodeWindow>();
        const rightWindow = createRef<CodeWindow>();
        const width = 1800;
        const height = 650 * 2;
        const fontSize = 40;
        const titleFontSize = 50;

        view.add(
                <Img
                        src={backgroundImage}
                        size={view.size()}
                        zIndex={-100}
                />

        );
        const box = new Panel({
                width: 800,
                height: 500,
        });
        box.position([0, 800]);


        view.add(box);

        box.content().add(
                <Txt
                        text="Hello World"
                        fontSize={48}
                        fill="white"
                />,
        );

        view.add(
                <Layout
                        layout
                        direction="row"
                        gap={40}
                        alignItems="start"
                        fontFamily="FiraCode Nerd Font"
                        y={-300}
                        x={0}
                >
                        <CodeWindow
                                ref={leftWindow}
                                highlighter={CHighlighter}
                                titleFontSize={titleFontSize}
                                title="decompiled.c"
                                width={width}
                                height={height}
                                fontSize={fontSize}
                                code={`
  time = time((time_t *)0x0);
  time = (uint)time;
  srand(time);
  for (i = 0; i < (long)file_len; i = i + 1) {
    random_num = rand();
    *(byte *)((long)file_buffer + i) =
        *(byte *)((long)file_buffer + i) ^ (byte)random_num;
    // file_buffer[i] ^=  (byte)random_num
    rand_2 = rand();
    rand_2 = rand_2 & 7;
    // random_num &=  7

    *(byte *)((long)file_buffer + i) =
        *(byte *)((long)file_buffer + i) << (sbyte)rand_2 |
        *(byte *)((long)file_buffer + i) >> 8 - (sbyte)rand_2;
    // file_buffer[i] = file_buffer[i].rotate_right((byte)rand_2)
  };
`}
                        />

                        <CodeWindow
                                ref={rightWindow}
                                highlighter={RustHighlighter}
                                titleFontSize={titleFontSize}
                                title="decryptor.rs"
                                height={height}
                                width={width}
                                fontSize={fontSize}
                                code={`\
use libc::{rand, srand};
use std::fs::read;

fn main() {
    let contents = read("../flag.enc").unwrap();
    let time = u32::from_le_bytes(contents[0..4].try_into().unwrap());
    println!("time: {time}");
    let mut output = vec![];

    unsafe {
        srand(time);
    }
    for byte in contents[4..contents.len()].into_iter() {
        let rand_1 = unsafe { rand() };
        let rand_2 = unsafe { rand() } & 7;
        let rot = byte.rotate_right(rand_2 as u32);
        let dec = rot ^ (rand_1 as u8);
        output.push(dec);
    }
    println!("{}", String::from_utf8(output).unwrap());
}
`}
                        />
                </Layout>,
        );

        const leftRef = leftWindow().code();
        const rightRef = rightWindow().code();
        yield* all(
                leftRef.selection([lines(2, 5), lines(9, 10)], 0.8),
                rightRef.selection([lines(5), lines(8, 14)], 0.8),
        );
        yield* waitFor(1);
        yield* all(
                leftRef.selection(lines(6, 7), 0.8),
                rightRef.selection(lines(16), 0.8),
        );
        yield* waitFor(1);

        yield* all(
                leftRef.selection(lines(13, 16), 0.8),
                rightRef.selection(lines(15), 0.8),
        );
        yield* waitFor(1);






});
