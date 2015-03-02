# Author: Enes Kemal Ergin
# Chapter 3 : Getting Started with graphs (Last Update: 03/01/15)

## Working with Graphs
# In a typical interactive sesion, you build a graph one statement at a time.

# attaches the data frame mtcars
attach(mtcars)

# opens a graphics window and generates a scatter plot between automobile weight
#   on the horiontal axis and miles per gallon on the vertical axis.
plot(wt, mpg)

# adds a line of best fit
abline(lm(mpg~wt))

# adds a title on my scatter plot.
title("Regression of MPG on Weight")

# detaches the data frame
detach(mtcars)
'''
This code does the same thing and save the plot as a pdf.
pdf("mygraph.pdf")
  attach(mtcars)
  plot(wt, mpg)
  abline(lm(mpg~wt))
  title("Regression of MPG on Weight")  
  detach(mtcars)
dev.off()
'''
# We can use following instead of pdf():
  # win.metafile() only for windows
  # png(), jpeg(), bmp(), tiff(), xfig(), postscript()

# How we can create more than one graph and still have access to each?

# First you can open a new graph window before creating a new graph:
dev.new()
  # statements to create graph 1
dev.new()
  # Statements to create graph 2
# If more continue.

# Creating some input for future data.frame
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

# line graph relating dose to response for drugA
plot(dose, drugA, type = "b")
# dose and DrugA stands for (x,y) coordinates respectively.
# type = "b" indicates that both points and lines should be plotted.

## Graphical Parameters

