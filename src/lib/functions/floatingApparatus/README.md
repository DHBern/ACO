# Comments on Conventions

### Measuring Offsets and Overlaps

- .offsetTop and .style.top are measured relative to the next _positioned_ parent. So make sure that this is the parent column.
- .top is fixed at the reference height in the text while for the offset transform.translateY is used.
- .offsetTop and .transform.translateY return a snapshot of a potentially moving element. Hence, they are unreliable together with css-transitions. As a workaround the offset is also stored in an additional attribute "instantTranslateY" which can be read from at any time.

# Comments on Maintainance

- Make sure to sync constants with +page.svelte
