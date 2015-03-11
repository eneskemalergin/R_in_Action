# Author: Enes Kemal Ergin
# Chapter 3 : Getting Started with graphs (Last Update: 03/10/15)

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
# We can customize our graphs with using their parameters.(fonts, colors, axes, titles)

# one way to specifiy these options through the par() function
# the format is par(optionname = value, optionname = value, .....)

# Rather than open circles we use solid triangles as a plotting symbol.
# and uses dashed line rather than solid line.
opar <- par(no.readonly = TRUE) # Copies the current settings
par(lty = 2, pch = 17) # lty short for line type, symbol is pch
plot(dose, drugA, type = 'b')
par(opar)

# We can also use the following code for modifiying the graph
plot(dose, drugA, type = 'b', lty = 2, pch = 17)

# for plot modification index see the page 51.

# There are several color-related parameters in R
# col.axis > color for axis text
# col.lab > color for axis labels.
# col.main > color for titles
# col.sub > color for subtitles
# fg > the plot's foreground color
# bg > the plot's background color

'''
You can specify colors in R by index, name, hexadecimal, RGB, or HSV. For example,
col=1, col="white", col="#FFFFFF", col=rgb(1,1,1), and col=hsv(0,0,1) are
equivalent ways of specifying the color white.
'''
n <- 10
mycolors <- rainbow(n)
pie(rep(1, n), labels=mycolors, col=mycolors)

mygrays <- gray(0:n/n)
pie(rep(1, n), labels=mygrays, col=mygrays)


# Parameters controlling text size:
'''
- cex         Number indicating the amount by which plotted text should be scaled relative
to the default. 1=default, 1.5 is 50% larger, 0.5 is 50% smaller, etc.
- cex.axis    Magnification of axis text relative to cex.
- cex.lab     Magnification of axis labels relative to cex.
- cex.main    Magnification of titles relative to cex.
- cex.sub     Magnification of subtitles relative to cex.
'''

# All graphs created after 
par(font.lab=3, cex.lab=1.5, font.main=4, cex.main=2)

'''
- font          Integer specifying font to use for plotted text.. 1=plain, 2=bold, 3=italic,
              4=bold italic, 5=symbol (in Adobe symbol encoding).
- font.axis     Font for axis text.
- font.lab      Font for axis labels.
- font.main     Font for titles.
- font.sub      Font for subtitles.
- ps            Font point size (roughly 1/72 inch).
              The text size = ps*cex.
- family        Font family for drawing text. Standard values are serif, sans, and mono.
'''

# Graph and Margin dimensions
'''
- pin           Plot dimensions (width, height) in inches.
- mai           Numerical vector indicating margin size where c(bottom, left, top, right) is
              expressed in inches.
- mar           Numerical vector indicating margin size where c(bottom, left, top, right) is
              expressed in lines. The default is c(5, 4, 4, 2) + 0.1.
'''
# Entering our data as vectors
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# Save the current graphical parameter settings (restoration purposes)
opar <- par(no.readonly=TRUE)

# Modifies the graph parameters 2 inch wide 3 inc tall
par(pin=c(2, 3))

# lines will be twice th default width and symbols will be 1.5 times 
par(lwd=2, cex=1.5)

# text will be set to italic and scaled to 75%  
par(cex.axis=.75, font.axis=3)

# plotting with filled red circles and dashes 
plot(dose, drugA, type="b", pch=19, lty=2, col="red")

# plotting filled green diamonds with a blue border and a blue dashes.
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")

# Restoring all the changes to original parameter.
par(opar)

## Adding text, customized axes, and legends
# In mnay cases we can include axis and text options, as well as graphical parameters.

plot(dose, drugA, type = 'b',
     col = 'grey', lty = 3, pch = 10, lwd = 2,
     main = "Clinical Trials for Drug A",
     sub = "This is hypothetical data",
     xlab = "Dosage", ylab = "Drug Response",
     xlim = c(0,60), ylim = c(0,70))

'''
Some high-level plotting functions include default titles and labels. You
can remove them by adding ann=FALSE in the plot() statement or in a
separate par() statement.
'''

x <- c(1:10) 
y <- x
z <- 10/x

opar <- par(no.readonly = TRUE)

par(mar = c(5, 4, 4, 8) + 0.1) # Increase Margins

# Plots x versus y
plot(x, y, type = "b",
     pch = 21, col = "red",
     yaxt = "n", lty =  3, ann = FALSE)

# Adds x versus 1/x line
lines(x, z, type = "b", pch = 22, col = "blue", lty = 2)

# Draws the axis according to x values
axis(2, at = x, labels = x, col.axis = "red", las = 2)

# Draws the axis according to z values
axis(4, at = z, labels = round(z, digits = 2), 
     col.axis = "blue", las = 2, cex.lab = 0.7, tck = -.01)

# Add titles and text
mtext("y=1/x", side = 4, line = 3, cex.lab = 1, las = 2, col = "blue")

# Adds titles
title("An Example of Creative Axes",
      xlab = "X values", 
      ylab = "Y=X")

# Restores to default.
par(opar)

# The abline() function is used to add reference line to our graph
abline(h = yvalues, v = xvalues)

# Data vectors:
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

opar <- par(no.readonly = TRUE)
par(lwd = 2, cex = 1.5, font.lab = 2)
plot(dose, drugA, type = "b", pch = 15,
     lty = 1, col = "red", ylim = c(0,60),
     main = "Drug A vs. Drug B", 
     xlab = "Drug Dosage", ylab = "Drug Responses")

# graphs the line according to drugB
lines(dose, drugB, type = "b", 
      pch = 17, lty = 2, col = "blue")

abline(h = c(30), lwd = 1.5, lty = 2, col = "gray")

library(Hmisc)
minor.tick(nx=2, ny=3, tick.ratio=0.5)

# Adds a legend.
legend("topleft", inset = .05, title = "Drug Type", c('A', 'B'),
       lty= c(1, 2), pch = c(15,17), col = c("red", "blue"))

par(opar)

# Text annotations
# Text can be added to graphs using the text() and mtext() functions

text(location, "text to place", pos, ...)
mtext("text to place", side, line = n, ...)

attach(mtcars)
plot(wt, mpg,
     main = "Milage vs. Car  Weight",
     xlab = "Weight", ylab = "Milage",
     pch = 18, col = "blue")

text(wt, mpg, 
     row.names(mtcars),
     cex = 0.6, pos = 4, col = "red")
detach(mtcars)

## Combining Graphs

# R makes it easy to combine several graphs into one overall graph
# par() or layout() function does the job for you...

# Creates four plots and arranges them into two rows and two columns
attach(mtcars)
opar <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
plot(wt, mpg, main = "Scatterplot of wt vs. mpg")
plot(wt, disp, main = "Scatterplot og wt vs. disp")
hist(wt, main = "Histogram of wt")
boxplot(wt, main = "Boxplot of wt")
par(opar)
detach(mtcars)


# Arranges 3 plots in 3 rows and 1 column
attach(mtcars)
opar <- par(no.readonly = TRUE)
par(mfrow = c(3,1))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

# layout() function has the form layout(mat) where mat is a matrix object
# specifiying the locations of the multiple plots to combine.

attach(mtcars)
layout(matrix(c(1,1,2,3), byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)
# optionally we can include widths and heights parameters.

## Creating a figure arrangement with fine control

opar <- par(no.readonly = TRUE)
# Sets up scatter plot
par(fig = c(0,0.8,0,0.8))
plot(mtcars$wt, mtcars$mpg,
     xlab = "Miles Per Gallon", 
     ylab = "Car Weight")
par(fig = c(0,0.8,0.55,1), new = TRUE)
# Adds box plot above
boxplot(mtcars$wt, horizontal = TRUE, axes = FALSE)

# Adds box plot to right
par(fig = c(0.65, 1, 0, 0.8), new = TRUE)
boxplot(mtcars$mpg, axes = FALSE)

mtext("Enhanced Scatterplot", side = 3, outer = TRUE, line = -3)
par(opar)


## End of the Section