ex5.2<-read.table("~/pythonproject/data/ex5/ex5_2.txt", header=T)
attach(ex5.2)
ex5.2ar<-ex5.2[risk==1,"preturn"] #just need value "preturn" other dont need

#"preturn" this is value
#preturn some var

ex5.2hr<-ex5.2[risk==2, "preturn"]

summary(ex5.2hr)

stem(ex5.2hr)

boxplot(preturn~risk)# there are four points outside the risk overlapping see IMAGE 2
#need to put label, return for y axis, and risk x axis
#or create legend 

par(mfrow=c(2,1)) #define parameters
hist(ex5.2ar, 
     include.lowest=TRUE, 
     freq=TRUE, 
     col="blue", 
     main=paste("Histogram of Return"), 
     sub=paste("Average Risk Funds"), 
     xlab="return", 
     ylab="frequency",axes=TRUE)


hist(ex5.2hr, 
     include.lowest=TRUE, 
     freq=TRUE, 
     col="blue", 
     main=paste("Histogram of Return"), 
     sub=paste("High Risk Funds"), 
     xlab="return", 
     ylab="frequency",axes=TRUE)

par(mfrow=c(1,1)) 
# this is a skewed to the right distribution for avg risk funds

# mid-term, second wk after recess term break, week 8
#held thursday during lecture hour.


htwt1-> read.table("~/pythonproject/data/ex5/htwt1.txt", header=T)
attach(htwt1) #computer will not recognize height weight....
#or dont use attach, you can specify htwt1$height, htwt1$weight
plot(height, weight, main="Plot of Weight by Height")
#in some situation you might wan to join the line

plot(height[gender=="M"], weight[gender=="M"],
main="Use gender to generate the plotting symbol",
ylab="Weight",xlab="Height",
xlim=c(150,190), ylim=c(40,80))
#if you dont specify the x domain, and y range,
#the R will optimize some points will go missing.
#see image 3

par(new=T) #in order to view two plots need this

plot(height[gender=="F"], weight[gender=="F"],
     main="",
     ylab="Weight",xlab="Height",
     xlim=c(150,190), ylim=c(40,80),
     axes=F, pch=0,col=2)
# ( pch ) point character = 0 means is a square in the display chart
# ( pch ) point character = 1 means is a circle in the display chart (DEFAULT)
# col=2 can try col="red"
# add your legend and specify where to put the legend and what is inside the legend
# range and domain same as the top graph, then can compare 

par(mfrow=c(2,1))
plot(height[gender=="M"], weight[gender=="M"],
     main="Use gender to generate the plotting symbol",
     ylab="Weight",xlab="Height",
     xlim=c(160,190), ylim=c(40,80))

plot(height[gender=="F"], weight[gender=="F"],
     main="",
     ylab="Weight",xlab="Height",
     xlim=c(160,190), ylim=c(40,80),
     axes=F, pch=0,col=2)
par(mfrow=c(2,1))



