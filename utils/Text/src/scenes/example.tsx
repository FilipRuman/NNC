import {Circle, makeScene2D, waitFor,Img,Svg,Code,lines} from '@motion-canvas/2d';
import {createRef,DEFAULT,waitFor} from '@motion-canvas/core';

export default makeScene2D(function* (view) {
  // Create your animations here

  const img = createRef<Svg>();
  const code = createRef<Code>();

 view.add(
        <Svg
                ref={img}
                src="./ad_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
        />,
    <Code
      ref={code}
      fontSize={28}
      offsetX={-1}
      x={-800}
      code={`\
function hello() {
  console.log('Hello');
}`}
    />,
  );


  // view.add(<Circle ref={circle} size={320} fill={'lightseagreen'} />);

  // yield* circle().scale(2, 2).to(1, 2);
  // yield* waitFor(3);
  // yield* circle().position.x(100, 2);

  // select all instances of "hello" (case-insensitive)
  yield* code().selection(code().findAllRanges(/hello/gi), 0.6);
  yield* waitFor(0.3);

  // select line 1
  yield* code().selection(lines(1), 0.6);
  yield* waitFor(0.3);

  // reset the selection
  yield* code().selection(DEFAULT, 0.6);
  yield* waitFor(0.3);


});
