import {Circle,Rect,Txt,Layout, makeScene2D, waitFor,Img,SVG,Code,lines} from '@motion-canvas/2d';
import {createRef,DEFAULT,waitFor,Reference} from '@motion-canvas/core';

import {Rect, Layout, Code, Txt} from '@motion-canvas/2d';

export interface CodeWindowProps {
  code: string;
  title?: string;
  fontSize?: number;
  titleFontSize?: number,

  width?: number;
}

export class CodeWindow extends Rect {
  public readonly code = createRef<Code>();

  public constructor({
    code,
    title = 'src/main.ts',
    fontSize= 24,
    titleFontSize = 28,
    width,
  }: CodeWindowProps) {
    super({
      fill: '#1e1e1e',
      radius: 16,
      layout: true,
      direction: 'column',
      width,
      clip: true,
      shadowBlur: 20,
      shadowColor: '#0008',
    });

    this.add(
      <>
        {/* Title Bar */}
        <Rect
          height={48}
          width={'100%'}
          fill="#2d2d2d"
          radius={[16, 16, 0, 0]}
          layout
          direction="row"
          alignItems="center"
          paddingLeft={16}
          gap={8}
        >
          <Circle size={12} fill="#ff5f57" />
          <Circle size={12} fill="#ffbd2e" />
          <Circle size={12} fill="#28c840" />

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
          fill="#1e1e1e"
        >
          <Code
            ref={this.code}
            code={code}
            fontSize={fontSize}
            fontFamily="FiraCode Nerd Font"
          />
        </Layout>
      </>,
    );
  }
}
