/* 1. Create SAS datasets “htwt” and “test” by 
importing the “tut1htwt.csv” file and
“tut1test.csv” respectively into the SAS.
[Note: The “.csv” files use a semicolon “;” 
as the separator instead of a comma
“,”.]*/

data htwt;
	infile "/folders/myfolders/tut1_thissem/tut1htwt.csv" firstobs=2 dlm=";";
	input id $ gender $ height $ weight $ siblings $;
run;
data test;
	infile "/folders/myfolders/tut1_thissem/tut1test.csv" firstobs=2 dlm=";";
	input id $ test $;
run;

/* proc print data=htwt; */
/* proc print data=test; */

/* 2. Based on “htwt”, create a SAS dataset “htwtf” 
which contains the data for all the
female subjects. 
How many females are there in the dataset “htwt”?*/

data htwtf;
	set htwt;
	if(gender="F")then output;
	proc sql;
 		select count(*) as num_of_female from htwtf;
run;

/* proc print data=htwtf; */

/*3. Merge the two datasets “htwt” and “test”. 
Let us call this new SAS dataset “htwttest”. 
Identify individuals who are taller than 183 cm by creating a
relevant SAS data set. 
What are the test scores of subjects who are taller than
183 cm?*/

proc sort data=htwt;
	by id;
proc sort data=test;
	by id;

data htwttest;
	merge htwt test;
run;

proc print data=htwttest;

data height_more_than_183;
	set htwttest;
	if(height>183) then output;
	keep id test;
run;

/* proc print data=height_more_than_183; */


/*4. Create a SAS dataset “htwtfixed” by importing
 the fixed format text file “tut1htwtfixed.txt” 
 into the SAS.*/

data htwtfixed;
	infile '/folders/myfolders/tut1_thissem/tut1htwtfixed.txt' firstobs=2;
	input id $3. gender $1. height $3.  weight $2. siblings $1.;
run;

/* proc print data= htwtfixed; */

/*5. Suppose that there was an error in the weight
 of the Subject 356 in the text file.
Obtain a new SAS dataset “htwtfixedremo” by removing
 the record related to the Subject 356 from the SAS 
 dataset “htwtfixed” .*/

data htwtfixedremo;
	set htwtfixed;
	if(id='356')then delete;
run;
/* proc print data=htwtfixedremo; */

/*6. Who is the second tallest female in this group
 and what are her height, weight, and test score?*/

data secondtallestfemale;
	set htwttest;
	if (gender='F') then output;	
	keep height weight test;
	proc sort data=secondtallestfemale out=secondtallestfemale;
		by descending height;
	proc sql;
		create table resultOfQnSix as
		select * from secondtallestfemale (obs=2)
	quit;
	
run;

data outdata;
   	set resultOfQnSix;
	by descending height;
	if(_n_=1) then delete;
run;

proc print data= outdata;

/*7. Create a new variable called “grade” in 
the data set “htwttest” using the
following rule: 
(1) grade = “A” if test ≥ 80, 
(2) grade = “B” if 70 ≤ test < 80, 
(3) grade = “C” if 60 ≤ test < 70, 
(4) grade = “D” if 50 ≤ test < 60 and 
(5) grade = “F” if test < 50.
How many male students get a “F” grade?*/

data addgrade;
	set htwttest;
	if test>=80 then grade='A';
	else if test>=70 then grade='B';
	else if test>=60 then grade='C';
	else if test>=50 then grade='D';
	else if test<50 then grade='F';
	
	if(gender="M" and grade="F")then output;
run;

proc print data=addgrade; 

/*(a) Write a SAS program to create a SAS data 
set from the above table using do loops. 
How many variables are there in your SAS data set?
What are these variables?*/

data tablea;
	do Batch=1 to 3;
		do Treatment=1 to 4;
			input value @@;
			output;
		end;
	end;
datalines;
303 311 289 270
242 290 259 263
289 282 277 257
run;

proc print data=tablea;

/*(b) Repeat part (a) without using any do loops.
(Hint: How many variables are there in the input
 statements?)*/	

data tableb;
	input Treatment1 Treatment2 Treatment3 Treatment4;
	datalines;
	303 311 289 270
	242 290 259 263
	289 282 277 257
run;

proc print data=tableb;

/*Write a SAS program to create a SAS data set 
from the table below using do loops.*/	

data tablec;
	do Batch=1 to 3;
		do Treatment=1 to 4;
			input value @@;
			output;
		end;
	end;
datalines;
303 311 289 270
242 "" 259 263
289 282 277 257
run;

proc print data=tablec;






	
