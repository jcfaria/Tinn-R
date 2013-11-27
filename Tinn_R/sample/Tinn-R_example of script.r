# ===================================//==========================================
#  Mail: <<< joseclaudio.faria@gmail.com >>> <<< phgrosjean@sciviews.org >>>
#  More: <<< http://zoonek2.free.fr/UNIX/48_R/all.html >>>
# ===================================//==========================================

# help.start() start the html interface to on-line help (using a web browser available at
# your machine). You should briefly explore the features of this facility with the mouse.
# Iconify the help window and move on to the next part.

x <- rnorm(50)
x

y <- rnorm(50)
y
# Generate two pseudo-random normal vectors of x and y coordinates

x11(w=4,
    h=4)

bringToTop(s=T)

plot(x,
     y)
# Plot the points in the plane. A graphics window will appear automatically

ls()
# See which R objects are now in the R workspace

rm(x, y)
# Remove objects no longer needed. (Clean up)

x <- 1:20
# Make x=(1, 2, . . . , 20)

w <- 1 + sqrt(x)/2
# A ‘weight’ vector of standard deviations

dummy <- data.frame(x=x,
                    y=x + rnorm(x) * w)
# Dummy Make a data frame of two columns, x and y, and look at it

fm <- lm(y ~ x,
         data=dummy)

summary(fm)
# Fit a simple linear regression of y on x and look at the analysis

fm1 <- lm(y ~ x, 
          data=dummy,
          weight=1/w^2)

summary(fm1)
# Since we know the standard deviations, we can do a weighted regression

lrf <- with(dummy,
            lowess(x,
                   y))
# Make a nonparametric local regression function

with(dummy,
     plot(x,
          y))
# Standard point plot

lines(x,
      lrf$y)
# Add in the local regression

abline(0,
       1,
       lty=3)
# The true regression line: (intercept 0, slope 1)

abline(coef(fm))
# Unweighted regression line

abline(coef(fm1),
       col="red")
# Weighted regression line

plot(fitted(fm),
     resid(fm),
     xlab="Fitted values",
     ylab="Residuals",
     main="Residuals vs Fitted")
# A standard regression diagnostic plot to check for heteroscedasticity. Can you see it?

qqnorm(resid(fm),
       main="Residuals Rankit Plot")
# A normal scores plot to check for skewness, kurtosis and outliers. (Not very useful here)

rm(w, fm, fm1, lrf, x, dummy)
# Clean up again

graphics.off()
# Close graphics

# q() Quit the R program. You will be asked if you want to save the R workspace, and for an
# exploratory session like this, you probably do not want to save it.
