
proc format;
	value $risk '1' ='Average Risk'
				'2' = 'High Risk';

data ex5_2;
	infile "/folders/myfolders/lectExample5/ex5_2.txt";

input preturn risk $;
	label preturn = 'Return Percentage';
	format risk $risk.;
	
	/*risk is defined as char
	if i dont defined it as char
	do i still need to put $*/
	
proc univariate data=ex5_2;
	/*sas adjust the mid-points to 
		ctrl number of bars, 120/50 
		gt 8 space, 
		required 9 mid points*/
		
	/*need to figure out 
	the number of midpoints
	*/
	
	/*around 8-15, and depends on situat
	*/
	histogram preturn/ midpoints = -30 to 90 by 15 normal;
	/*use this variable risk as a classification */
	class risk;
/*seeing the AVG RISK, what do u think it follow
normal distribution? judging from the plot,
it is skewed to the right. skewed to the right is
positive, left is negative

sometimes shape might change drastically if u choose
mean size and location of midpoint.(NOT ALWAYS) 
*/

/*seeing the HIGH RISK...
qqplot: better chance to match the normal distribution*/	
qqplot preturn;
run;
quit; /*is iteractive so need to quit*/


proc boxplot data=ex5_2;
	plot preturn*risk; /*preturn: y axis risk:x axis*/
/*for avg risk, the distribution is skewed to the right
because, see IMG 1*/
/*is there option to plot horizontally, if no such what to do?*/
/*maybe switch the to => risk*preturn */
run;


/*BIVARIATE DATA (each row two values)*/
data htwt1;
	infile "htwt1.txt" firstobs=2;
	input id gender $ height weight siblings;
proc sgplot data=htwt1;
	title "Scatter Plot of Weight By Height";
	scatter x=height y=weight;
/*maybe a linear relationship between weight and height*/

proc sgplot data=htwt1;
	title "using gender to generate the plotting symbols";
	scatter x=height y=weight;
/*taller and heavier for male, female shorter and not so heavy, */

proc sort data=htwt1;
	by gender; /*f will on top, m will btm*/
proc sgplot data=htwt1;
	title "Separate plots by gender";
	by gender;
	scatter x=height y=weight;
/*is there still a relationship between height and weight?
 female may have linear relationship by eye power,
 still need to fit linear regression model to justify ur answer*/
