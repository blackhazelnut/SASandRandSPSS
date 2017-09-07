#-------------------------1-------------------------
#1. Create an R data frame “htwt2” by importing 
#the “tut2htwtfixed.txt” file into the R.

varnames <- c("id","gender","height","weight","siblings")
htwt2 <- read.fwf("tut2htwtfixed.txt",width=c(3,1,3,2,1),col.names = varnames)
attach(htwt2) #put to dataframe
htwt2

#-------------------------2-------------------------
#2. Based on “htwt2”, create an R data frame “htwt2m” 
# which contains the data for all
#the male subjects. How many males are there in the data frame “htwt2”?

htwt2m <- htwt2[gender=="M",]
htwt2m

#-------------------------3-------------------------
#3. Import “tut2test.csv” into the R. 
#Merge the two datasets “htwt2” and “tut2test”. 
#Let us call this new R data frame “htwttest2”. 
#Identify individuals whose height is greater than 182 cm.  
#What are the test scores of subjects whose height is greater than 182 cm?
#all=T to merge diff rows of two set of data
#                  id   test
# tut2test --- 1   201   67

#     id gender height weight siblings
#1   201      M    173     65        1
  
tut2test <- read.csv("tut2test.csv")
htwttest2<-merge(tut2test,htwt2,by="id",all=T)

htwttest2[htwttest2$height>182,'test']

#-------------------------4-------------------------
#4. Suppose that there was an error in the 
#weight of the Subject 210 in the text file.
#Obtain a new R data frame “htwttest2remo” by removing the record
#related to the Subject 210 from the data frame “htwttest2”.

htwttest2remo<-htwttest2[htwttest2$id!=210,]
htwttest2remo

#-------------------------5-------------------------
#5. After checking with the Subject 210, 
#we found out that his actual weight should be
#68 kg instead of 88 kg. 
#Modify the R data frame “htwttest2” by rectifying the mistake.

htwttest2[10,"weight"]<-68 #[obs s/n, var to change] 
htwttest2

#-------------------------6-------------------------
#6. Who is the second tallest female in this group and 
#what are her height, weight, and test score?

htemp<-htwttest2[order(height),]
htemp<-htemp[htemp$gender=="F",]
htemp[2:2,] #[row,col] aka [1:2,1:2] 1:2 from row 1 to row 2 inclusive or col 1 ...

#-------------------------7-------------------------
#7. Create a new variable called “grade” using the following rules: 
#(1) grade = “A” if test ≥ 80, 
#(2) grade = “B” if 70 ≤ test < 80, 
#(3) grade = “C” if 60 ≤ test < 70, 
#(4) grade = “D” if 50 ≤ test < 60 and 
#(5) grade = “F” if test < 50.
#How many subjects who have “A” grade are there?

attach(htwttest2)
htwttest2$grade[test>=80]<-"A"
htwttest2$grade[test>=70 & test<80]<-"B"
htwttest2$grade[test>=60 & test<70]<-"C"
htwttest2$grade[test>=50 & test<60]<-"D"
htwttest2$grade[test<50]<-"F"

scoreA<-htwttest2[htwttest2$grade=="A",]
scoreA
nrxow(scoreA)


#-------------------------8-------------------------
xC1<-c(1,1,1,1,1)
xC2<-c(1,3,4,7,11)

x<-cbind(xC1,xC2)
y<-c(4,6,13,15,18)


resultA <- x %*% t(x) 

resultB <- t(x) %*% y

finalResult <- solve(resultA) %*% resultB

#-------------------------9-------------------------
#x =  2x   -    x
#n    n-1       n-2 (subscript)

recursive.seq <- function(x) {
  if(x==1) return (0)
  else if(x==2) return (1)
  else (2 * (recursive.seq(x-1)) - (recursive.seq(x-2)))
}

recursive.seq(28)

sum<-0
for(i in 1:10)
{
  sum<-sum+recursive.seq(i)
}
sum

#-------------------------10-------------------------
# The function “cenmom” finds the mean, the 2nd, 3rd & 4th central moments
cenmom<-function(x){
  n<-length(x)
  s<-numeric(4)
  meanResult<-mean(x)
  value<-1/n
  
  summationC2<-0
  summationC3<-0
  summationC4<-0
  for(i in 1:n)
  {
    summationC2<-summationC2 + `^` (x[i]-meanResult,2)
    summationC3<-summationC3 + `^` (x[i]-meanResult,3)
    summationC4<-summationC4 + `^` (x[i]-meanResult,4)
  }
  
  resultC2<-value * summationC2
  resultC3<-value * summationC3
  resultC4<-value * summationC4
  
 return [meanResult,resultC2,resultC3,resultC4]
 #return s
}

cenmom(htwt2)











