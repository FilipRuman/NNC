import { Circle, Rect, Txt, Layout, Code, LezerHighlighter } from '@motion-canvas/2d';
import { all, createRef } from '@motion-canvas/core';

export function* replaceAll(
        code: Code,
        regex: RegExp,
        replacement: string,
        duration = 0.6,
) {
        const ranges = code.findAllRanges(regex);

        yield* all(
                ...ranges.map(range =>
                        code.code.replace(range, replacement, duration),
                ),
        );
}
export interface CodeWindowProps {
        code: string;
        title?: string;
        fontSize?: number;
        titleFontSize?: number;
        width?: number;
        height?: number;
        highlighter?: LezerHighlighter,
}

export class CodeWindow extends Rect {
        public readonly code = createRef<Code>();

        public constructor({
                code,
                title = 'src/main.ts',
                fontSize = 24,
                titleFontSize = 28,
                width = 700,
                height,
                highlighter,
        }: CodeWindowProps) {
                super({
                        fill: '#1e1e1e',
                        stroke: '#ffffff08',
                        lineWidth: 1,
                        radius: 16,
                        layout: true,
                        direction: 'column',
                        width,
                        height,
                        clip: false,
                        shadowColor: '#00000099',
                        shadowBlur: 50,
                        shadowOffsetY: 16,
                });

                this.add(
                        <>
                                {/* Title Bar (fixed height) */}
                                <Rect
                                        height={48}
                                        width={'100%'}
                                        fill="#2d2d2d"
                                        radius={[16, 16, 0, 0]}
                                        layout
                                        direction="row"
                                        alignItems="center"
                                        paddingLeft={16}
                                        paddingTop={40}
                                        paddingBottom={40}
                                        gap={8}
                                >
                                        <Circle size={25} fill="#ff5f57" />
                                        <Circle size={25} fill="#ffbd2e" />
                                        <Circle size={25} fill="#28c840" />

                                        <Txt
                                                text={title}
                                                fill="#cfcfcf"
                                                fontSize={titleFontSize}
                                                marginLeft={12}
                                                fontFamily="FiraCode Nerd Font"
                                        />
                                </Rect>

                                {/* Editor Area */}
                                <Layout
                                        padding={24}
                                        grow={1}
                                        fill="#1e1e1e"
                                >
                                        <Code
                                                ref={this.code}
                                                highlighter={highlighter}
                                                code={code}
                                                fontSize={fontSize}
                                                fontFamily="FiraCode Nerd Font"
                                        />
                                </Layout>
                        </>,
                );
        }
}
