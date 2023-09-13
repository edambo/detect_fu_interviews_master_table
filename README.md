# DETECT Follow-up Interviews Master Descriptive Tables

This repository is contains the code for the DETECT follow-up interviews master descriptive tables. The tables are currently published online as a [Quarto book](https://quarto.org/docs/books/) project. 

## Rendering

We can render the files by clicking the Render button in RStudio. To render the HTML and PDF files at the same time, type `quarto render` into the terminal. 

````
```{bash}
quarto render
```
````

## Publishing to GitHub pages

The DETECT follow-up interviews master descriptive tables are currently published online as a [Quarto book](https://quarto.org/docs/books/) project. They are hosted by GitHub Pages using the methods described in [this article](https://quarto.org/docs/publishing/github-pages.html).

To publish updates to the book:

1. Make sure to commit and push all changes on the main branch.   
2. From the main branch, type `quarto publish gh-pages` in the terminal.   
3. Click "Yes" when asked if we want to update the site or not.   
4. Quarto will publish the book to the `gh-pages` branch.   

````
```{bash}
quarto publish gh-pages
```
````
