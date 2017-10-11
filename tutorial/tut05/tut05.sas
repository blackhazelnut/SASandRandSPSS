qn3. Determining whether or not a particular debate btw two candidates was effective changing viewrs's preferences for the candidates.

data tut5_3male;
  input group $ outcome $ count;
datalines;
Male AA 67
Male AB 28
Male BA 46 
Male BB 54
;

proc freq data=tut5_3male;
  tables group*outcome / chisq;
run;

data tut5_3female;
  input group $ outcome $ count;
datalines;
Female AA 58
Female AB 42
Female BA 37 
Female BB 61
;

proc freq data=tut5_3female;
  tables group*outcome / chisq;
run;
