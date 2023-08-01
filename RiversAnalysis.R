# Load libraries

library(ggplot2)

## Load in data (rivers vector of river lengths in R)

rivers

#Here we will create a usable data frame out of the  in list of numbers in the rivers data frame.

rr = data.frame(rivers)
View(rr)

#Next set up the basic ggplot to run a histogram to view the data in question.

ggplot (rr, aes (x = rivers)) + geom_histogram()

#Warning given to pick better value for binwidth. Let's try binwidth=100.

ggplot (rr, aes (x = rivers)) + geom_histogram(binwidth = 100)

#Now bins = 10

ggplot (rr, aes (x = rivers)) + geom_histogram(bins = 10)

#How about 20 bins?

ggplot (rr, aes (x = rivers)) + geom_histogram(bins = 20) 

#Each of the about has it's pros and cons. 
#I think 20 bins shows a much smoother progression of lengths and will stick with this for proceeding analysis.

#Now I will clean up my plot with labels and maybe add some color. Let's play around.

ggplot (rr, aes (x = rivers)) + 
  geom_histogram(bins = 20, color="blue4", fill="blue1") +
  ggtitle("River Length Comparison") + 
  xlab("Length") + ylab ("Number of Rivers")

#That looks very appropriate for rivers.

#Now let's take a look at a box plot of the data. We will use this to look for outliers.
#Based on the histogram I expect to see at least one (if not more) outlier.

d <- ggplot (rr, aes (x = " ", y = rivers)) 
d + geom_boxplot() + xlab("") + ggtitle("River Length Outliers")

#Visually I am seeing several outliers. But let's check the mathemathical way for fun.
#Math is fun!
#First we get the 1st and 3rd quartiles for our data.

summary(rr)

IQR = 680 - 310

#IQR is 370. Now multiply by 1.5

370 * 1.5

#This gives us 555. Now I'll add this to the 3rd quartile and subtract from the 1st quartile.

680 + 555
310 - 555

#These give us 1235 and -245 respectively. So any length over 1235 is an outlier. 
#We will ignore -245 because there cannot be rivers with negative lengths.

#Last, but not least, let's check for normal probability by running a QQ plot.
#Isn't statistics fun?

ggplot(rr, aes(sample=rivers)) + geom_qq() + ggtitle("River Length Distribution") 

#A quick "fat pencil test" shows that our data on river lengths is NOT normally distributed.
