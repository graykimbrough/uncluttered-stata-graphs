#delimit ;

/* Make sure to use the right scheme */
set scheme uncluttered;

/* Load ASEC yearly stats calculated from IPUMS data */
use sample_labeled_data, clear;

/* Make LFP percentages look nice */
gen pct_lfp = in_lf*100;
/* Label percentages */
label define percents
  0 "0%" 5 "5%"
  10 "10%" 15 "15%"
  20 "20%" 25 "25%"
  22 "22%" 24 "24%" 26 "26%" 28 "28%"
  30 "30%" 35 "35%"
  40 "40%" 45 "45%"
  50 "50%" 55 "55%"
  60 "60%" 65 "65%"
  70 "70%" 75 "75%"
  80 "80%" 85 "85%"
  90 "90%" 95 "95%"
  100 "100%";
label values pct_lfp percents;

/* Label the last value manually--though at least this method is robust
  to adding more years of data */
gen str15 lfp_year_gender_label ="";
qui sum year;
replace lfp_year_gender_label = "Men" if sex==1 & year==r(max);
replace lfp_year_gender_label = "Women" if sex==2 & year==r(max);
local label_opts "mlab(lfp_year_gender_label) msize(zero) mlabsize(medium)";

graph twoway (connected pct_lfp year if sex==1, `label_opts')
  (connected pct_lfp year if sex==2, `label_opts'),
    name(lfp_year_gender, replace)
    xlabel(1970 (5) 2015)
    xscale(r(1970 2023))
    ytitle("")
    ylabel(,value)
    xtitle("")
    subtitle("Percentage of 21-30 year olds in the labor force",
      justification(left) margin(b+1 t-1) bexpand)
    note("Excludes armed forces. Source: 1968-2017 ASEC samples from IPUMS-CPS (cps.ipums.org), @graykimbrough",
      margin(l-8 t+2 b-2));
