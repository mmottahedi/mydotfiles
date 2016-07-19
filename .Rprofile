if(interactive()){
       library(colorout)
       library(setwidth)
       #options(vimcom.verbose = 1) # optional
       #library(vimcom)
 }

# plotly setting

Sys.setenv("plotly_username" = "mmottahedi")
Sys.setenv("plotly_api_key" = "8wzne9bkig")

## Create a new invisible environment for all the functions to go in so it
## doesn't clutter your workspace.
.env <- new.env()

options("repos" = c(CRAN = "https://cran.cnr.berkeley.edu/"))

#single character shortcuts for summary() and head().
.env$s <- base::summary
.env$h <- utils::head
.env$len <- base::length

## Read data on clipboard.
#.env$read.cb <- function(...) {
#    ismac <- Sys.info()[1]=="Linux"
#  if (!ismac) read.table(file="clipboard", ...)
#    else read.table(pipe("pbpaste"), ...)
#}

## Attach all the variables above
attach(.env)

## .First() run at the start of every R session.
## Use to load commonly used packages?
#.First <- function() {
##	library(ggplot2)
##  library(data.table)
##  library(doMC)
##  library(doParallel)
#	cat("\nSuccessfully loaded .Rprofie at", date(), "\n")
#}

## .Last() run at the end of the session
#.Last <- function() {
#	# save command history here?
#	cat("\nGoodbye at ", date(), "\n")
#}
