import { Rect, Layout, Node, LayoutProps } from '@motion-canvas/2d';
import { createRef } from '@motion-canvas/core';

export interface PanelProps {
        width?: number;
        height?: number;
        padding?: number;
        children?: Node[];
}

export class Panel extends Rect {
        public readonly content = createRef<Layout>();

        public constructor({
                width = 700,
                height,
                padding = 24,
                children = [],
        }: PanelProps) {
                super({
                        fill: '#1e1e1e',
                        stroke: '#ffffff08',
                        lineWidth: 1,
                        radius: 16,

                        width,
                        height,

                        clip: false,

                        shadowColor: '#00000099',
                        shadowBlur: 50,
                        shadowOffsetY: 16,
                });

                this.add(
                        <Layout
                                ref={this.content}
                                width={'100%'}
                                height={'100%'}
                                padding={padding}
                                justifyContent="center"
                                alignItems="center"
                        >
                                {children}
                        </Layout>,
                );
        }

        public addContent(...nodes: Node[]) {
                this.content().add(...nodes);
        }
}
