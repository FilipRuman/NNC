import {Circle,Rect,Txt,Layout, makeScene2D, waitFor,Img,SVG,Code,lines} from '@motion-canvas/2d';
import {createRef,DEFAULT,waitFor,Reference} from '@motion-canvas/core';

import {Rect, Layout, Code, Txt} from '@motion-canvas/2d';
import {CodeWindow} from '../components/CodeWindow.tsx';



export default makeScene2D(function* (view) {

  view.fill('#242424'); // set the background of this scene

const leftWindow = createRef<CodeWindow>();
const rightWindow = createRef<CodeWindow>();

view.add(
  <Layout
    layout
    direction="row"
    gap={40}
    alignItems="start"
    y={0}
    x={100}
  >
    <CodeWindow
      ref={leftWindow}
      title="src/old.ts"
      width={650}
      height={600}
      fontSize={18}
      code={`\
function greet(name: string) {
  console.log("Hello " + name);
}
`}
    />

    <CodeWindow
      ref={rightWindow}
      title="src/new.ts"
      height={600}
      width={650}
      fontSize={18}
      code={`\
function greet(name: string) {
  console.log(\`Hello \${name}\`);
}
`}
    />
  </Layout>,
);

});
