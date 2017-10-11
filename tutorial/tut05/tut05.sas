qn3. Determining whether or not a particular debate btw two candidates was effective changing viewrs's preferences for the candidates.


data tut5_3male;
 input before $ after $ outcome $;
 datalines;
 A A 67
 A B 28
 B A 46
 B B 54
 ;
 
proc freq data=tut5_3male;
  title = "NcMear's test";
  tables before * after / agree;
  weight outcome;
run;


data tut5_3female;
 input before $ after $ outcome $
 datalines;
 A A 58 
 A B 42
 B A 37
 B B 61
 ;
 
proc freq data=tut5_3female;
  title="NcMear's test";
  tables before * after / agree;
  weight outcome;
run;
  
