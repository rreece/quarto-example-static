# quarto-example-static

My first example of using quarto, following the quarto
[Get Started](https://quarto.org/docs/get-started/hello/text-editor.html).

Unlike in my [quarto-example](https://github.com/rreece/quarto-example/)
that does the build in Github Actions, in this repo, I expect the user to
render the site statically and commit it, then Githb Actions just deploys
the pages to Github Pages.

You can see the rendered website here:        
<https://rreece.github.io/quarto-example-static/>


## Build

Just call

```
make
```

Preview the output:

```
open docs/index.html
```

When ready, commit to github:

```
git commit -a -m "update" ; git push origin mybranch
```


## See also

-   [quarto.org](https://quarto.org/)
-   [quarto example using math](https://github.com/quarto-dev/quarto-examples/tree/main/html-math)
-   [quarto using bibtex and CSL](https://github.com/quarto-dev/quarto-examples/tree/main/appendix-csl)
-   [quarto doc about github-pages](https://quarto.org/docs/publishing/github-pages.html)

