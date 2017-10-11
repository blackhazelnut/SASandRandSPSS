qn1.
a) give label to "gender", "drivelic" and "travel"
proc format;
 value $genderFmt "M" = "Male"
                  "F" = "Female"
                  Other = "Miscoded";
                  
 value $drivelicFmt "Y" = "Yes"
                    "N" = "No";
                    
 value $travelFmt "Y" = "Yes"
                  "N" = "No";
                  
data tut5_2q1;
 infile "~/student.txt" firstobs=2;
 input id $ gender $ workhour $ drivelic $ travel $;
 label gender = "Gender"
       drivelic = "Driving Licence";
 format gender $genderfmt.
        drivelic $drivelicfmt.
        travel $travelFmt.;
 run;
 
 b) Generate frequency counts
 
proc freq data = tut5_2q1;
	title "Gender";
	tables gender;
	
	title "Driving License";
	tables drivelic;
	
	title "Travel outside Asia";
	tables travel;
	
run;

c) Generate gender vs drivelic

proc freq data = tut5_2q1;
	title "gender vs drivelic";
	tables gender * drivelic;
run;

 d)
  i) the first grp includes all the students with 0 work hr is "(0hrs)none"
  ii)
  iii)
  proc format;
	value wkhrgpfmt 0 		= "(0hrs)none"
				 	1-19 	= "(1-19hrs)some"
				 	20-99   = "(20-99hrs)many"
				 	.		= "Did not put"
				 	Other   = "Out of Range"
				 	;
				 
e)
proc freq data=tut5_2q1;
	title "wkhrgp";
	tables workhour * travel;
	format workhour wkhrgpfmt.;
	
run;

 
 
 






qn2. compute chi-square statistic and test if quality of work is indpt of shift, alpha = 0.05

data tut5_2Shift;
 input conforming $ shift $ count;
 datalines;
 No Day 16
 No Evening 24
 Yes Day 654 
 Yes Evening 306
 ;
proc freq data = tut5_2Shift;
 title "Chi-square test";
 tables conforming * shift/ chisq;
 weight count;
run;
 






qn3. Determining whether or not a particular debate btw two candidates was effective changing viewrs's preferences for the candidates.


data tut5_3male;
 input before $ after $ outcome;
 datalines;
 A A 67
 A B 28
 B A 46
 B B 54
 ;
 
proc freq data=tut5_3male;
  title "NcMear's test";
  tables before * after / agree;
  weight outcome;
run;


data tut5_3female;
 input before $ after $ outcome;
 datalines;
 A A 58 
 A B 42
 B A 37
 B B 61
 ;
 
proc freq data=tut5_3female;
  title "NcMear's test";
  tables before * after / agree;
  weight outcome;
run;
  
