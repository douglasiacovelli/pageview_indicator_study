# Pageview indicator study

## Goal
In this repository I'm trying to replicate instagram's pageview indicator style.
Differently than [PageViewDotIndicator](https://github.com/douglasiacovelli/page_view_dot_indicator), which was implemented using a listview and therefore was more limited, this one I'm implementing using CustomPaint and ImplicitAnimations.

## Learnings
- It's a lot more math than I was expecting
- ImplicitlyAnimatedWidget was the way to create a widget that animated on its own upon changing the currentPosition
- I needed a function to get the distance between the currentPosition and current dot (i) being drawn translated into:

  ```dart
  // This returns how close it is the dot from the currentPosition (selected dot).

  // e.g.: currPos = 1.7 and i = 1
  // 1 - 1.7 = 0.7 (abs) => 1 - 0.7 = 0.3 (that's how close)

  // e.g.: currPos = 1.7 and i = 2
  // 2 - 1.7 = 0.3 => 1 - 0.3 = 0.7 (which means this must have more of the selected color than the dot 1)
  return 1 - (i - currentPosition).abs();
  ```
- Implicitly animated widgets are not as hard to implement, and it works as follows:
  - As the state of the widget changes, it will trigger the animation to start, and then you'll need a tween to translate from the previous value to the target one, which will trigger the build method for each iteration
  - Because of this, the outer widget can receive discret values (0, 1, 2), while the inner widget (painter), can receive continuous (0.1, 0.2, 0.3...) translated by the tween.
