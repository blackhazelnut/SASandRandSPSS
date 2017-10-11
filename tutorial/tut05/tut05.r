ex1<-read.table("directory/student.txt",header=T)
ex[1:10,]
attach(ex1)
t1<-table(drivelic,travel)
chisq.test(drivelic,travel)

chisq.test(table(drivelic,travel))
chisq.test(workhour,travel)


#qn3
#tut 5

#qn 3a
#given: 
#       Gender      Preference before debate        Preference After debate
#                                                   Candidate A     Candidate B
#       Male        Candidate A                     67              28
#                   Candidate B                     46              54
#
#       Female      Candidate A                     58              42
#                   Candidate B                     37              61
#
#
        
#task:  for each gender grp test if debate btw two candidates was 
#       effective in changing viewers' preferences for the candidates
data<-matrix(c(67,28,46,54), nr=2, byrow=T, dimnames = list('Before' = c("A","B"), "After" = c("A","B")))
data
mcnemar.test(data)

data<-matrix(c(58,42,37,61), nr=2,byrow=T, dimnames = list('Before' = c("A","B"), "After" = c("A","B")))
data
mcnemar.test(data)
