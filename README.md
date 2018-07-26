# Files provided

The [schemes](https://github.com/graykimbrough/uncluttered-stata-graphs/tree/master/schemes) directory contains two schemes, a basic uncluttered scheme (`scheme-uncluttered.scheme`), and one that varies line patterns for better reproduction in black and white (`scheme-uncluttered_publication.scheme`). The publication scheme is based on the `uncluttered` scheme, which must be present for it to work.

The [examples](https://github.com/graykimbrough/uncluttered-stata-graphs/tree/master/examples) directory contains an example and its accompanying data. When the `uncluttered` scheme is in the correct directory, this program will produce a graph with labels to the right of each line.

# Basic setup

Place the .scheme file(s) in your Stata PERSONAL directory (if you don't know it, use the `sysdir` command), then close and reopen Stata. Change the currently used scheme to the basic uncluttered scheme using the command `set scheme uncluttered`, or change to the uncluttered publication scheme using `set scheme uncluttered_publication`.

Change to a scheme permanently (including after Stata is closed and reopened) with the `permanent` option:

```
set scheme uncluttered, permanent
```

# User settings and extensions

## Line and bar colors

Line and bar colors for both themes are specified in the `scheme-uncluttered.scheme` file.

Four colors are provided, but feel free to change these so that your graphs don't look exactly like the scheme author's graphs. Also add additional colors as needed, beginning with `p5`. Colors are most easily specified as quoted RGB values, e.g. `"24 105 109"`. Stata color names can also be used, e.g. `maroon`.

Jon Schwabish provides a [selection of resources](https://policyviz.com/better-presentations/design-resources/design-color-tools/) for selecting colors that work well together in the materials for his book [Better Presentations](https://policyviz.com/better-presentations/). One great set of tools is [Viz Palette](http://projects.susielu.com/viz-palette) in conjunction with [Colorgorical](http://vrl.cs.brown.edu/color).

## Graph font

To the best of my knowledge, the only way to set the font used for graphs is through Stata Preferences. In Mac OS X, the Font setting is found under Preferences -> Graph preferences -> Window. This setting appears to take effect permanently.

## Legends and axis titles

There does not appear to be a Stata scheme setting to turn off the display of either a legend or axis titles. The example program shows how to accomplish this with options to the `graph twoway` command.

# Resources

For an extended discussion of color themes and fonts for data visualizations, see [Better Presentations](https://policyviz.com/better-presentations/).
