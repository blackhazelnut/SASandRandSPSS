ex1<-read.table("directory/student.txt",header=T)
ex[1:10,]
attach(ex1)
t1<-table(drivelic,travel)
chisq.test(drivelic,travel)

chisq.test(table(drivelic,travel))
chisq.test(workhour,travel)
