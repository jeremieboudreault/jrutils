***rjutils*** : Enhanced R functions
================================================================================

![](https://img.shields.io/badge/life_cycle-maturing-blue)
![](https://img.shields.io/badge/release_version-0.1-blue)
![](https://img.shields.io/badge/docs-0%25-red)
![](https://img.shields.io/badge/tests-0%25-black)

Welcome to `rjutils`, a collection of enhanced functions for `R`, notable :

* A custom `ggplot2` theme called `jtheme`
* Plotting function helpers for `ggplot2`
* Text modification function


Installation
--------------------------------------------------------------------------------

`rjutils` use the Source Sans Pro, which is an [open source font](https://fonts.google.com/specimen/Source+Sans+Pro#standard-styles) from Google. It needs to be installed on your system and in R. It is located in the `assets/` folder of the package. You will need the packages `extrafont` and `Rttf2pt1` in order to get the Source Sans Pro into R properly before you can use `rjutils`.

1. Install `ggplot2` and `extrafont` packages :

```r
install.packages("ggplot2")
install.packages("extrafont")
```

2. Install `Rttf2` using the `remotes` package :

```r
install.packages("remotes")
library(remotes)
remotes::install_version("Rttf2pt1", version = "1.3.8")
```

3. Import the Source Sans Pro font into R :

```r
extrafont::font_import(path = "assets/")
```

4. You can now install `rjutils` directly from GitHub :

```r
install.packages(
    ?????????
)
```

5. You can start using `rjutils`.

```r
library(rjutils)
```

---

Bugfixes
--------------------------------------------------------------------------------


### To-do

- Move all others functions to jtheme or jutils prior to article 3
- Ad rotate_x_lab_45 and _90 to the functions
- Test error message for save_plot()
- Remove w = h = for save_plot and save_ggplot. Replace by size = c(w, h)

### Work in progres : 

- **Remove warnings() when using jarrange** : Connot reproduce
- **50: In grid.Call(C_textBounds, as.graphicsAnnot(x$label),  ... : largeur de police inconnue pour le caractère 0x20** : Cannot reproduce

### Done : 

- Add facet title and size to params of `jtheme(facet_size = 10L, facet_face = "bold")`
- Added fast histogram `plot_hist(x, main, fill)`  in `plots.R`
- Added fast scatter plot `plot_scatter(x, y, main, col)` in `plots.R`
- Added empty plot in `plot_void()` in `plots.R`
- Added another palette of colors (rainbow) in `pal_rbow`
- Renamed `colors` palette to `pal_rdbu` and rearrange order of colors
