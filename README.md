# aki_eicu
Code for extracting and calculating AKI stage on [eICU](https://eicu-crd.mit.edu/) patients.

AKI stage calculated following [John Danziger, MD](https://findadoc.bidmc.org/details/312/john-danziger-nephrology-boston-needham) instructions.

Extraction code is in Standard SQL for BigQuery.  
Logic is in R.  

Final List of patients with AKI and offset (with RRT).  
_Offset is not reliable to determine when did the patients developed AKI_
