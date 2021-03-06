************************
* Aldreen Venzon
* Feb 2019
* Behavioral Risk Factor Surveillance System Cleaning
************************

************************
*Preparing the environment
************************
*1. Version Check
version 15
capture log close
set more off

*2. Create a LOG file
log using brfss.log, replace

*3. Load Data
clear
cd "C:\Users\AV058983\Google Drive\Den\Education\(2018-2022) UC Davis - PhD\First Year (2018-19)\Winter 2019\NRS205B (Quantitative Research)\BRFSS" 
use LLCP2016, clear


************************
*How to Clean the Data
************************
*1. Keep only some Variables (Columns)
keep internet menthlth poorhlth medadvic undrstnd written CRGVMST2
describe

*2. Keep only Observations (Rows) without missing values
generate no_miss = !missing(internet, menthlth, poorhlth, medadvic, undrstnd, written, CRGVMST2)
keep if no_miss


************************
*How to Combine Categories
************************
*1. Tabulate (see what's inside the original)
ta marital

*2. Recode the labels to your preference
recode marital(2=0)(4=0), gen(marital_labels)

*3. Tabulate new labels
ta marital_labels

*4. Add human readable labels
label define marital_labels 	0 "Divorced or Separated" ///
								1 "Married" ///
								3 "Widowed" ///
								5 "Never married" ///
								6 "A member of an unmarried couple" ///
								9 "Refused"							

*5. Put the human readable labels in the original
label values marital_labels marital_labels

*6. Tabulate the modified table (with missing)
ta marital_labels, m
