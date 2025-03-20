import { computePosition, offset, flip, shift } from '@floating-ui/dom';
import {detectOverflow} from '@floating-ui/dom';
import {autoPlacement} from '@floating-ui/dom';


export function updateFunctionFloatingPopover(elMark, elPopup) {
    
    // const middlewareOverflow = {
    //     name: 'middleware',
    //     async fn(state) {
    //       const overflow = await detectOverflow(state, {
    //         boundary: document.querySelector('.containerText'),
    //               });
    //       return {};
    //     },
    //   };

    return ()=>{
        computePosition(elMark, elPopup, {
            middleware: [autoPlacement({ allowedPlacements: ['top', 'bottom']}), offset(15), flip(), shift()],
            strategy: 'absolute'
        }).then(({ x, y }) => {
            elPopup.style.top = `${y}px`;
            elPopup.style.left = `${x}px`;
            elPopup.style.display = 'block';
        });
    }
};