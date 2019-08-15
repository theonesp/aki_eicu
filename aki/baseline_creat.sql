-- ------------------------------------------------------------------
-- Title: Patients first creatinine available value between 3 months before ICU admission and time 0 of ICU admission (ICU admission itself)
-- Notes: SID_aki-study
--        eICU Collaborative Research Database v2.0.
-- ------------------------------------------------------------------
WITH tempo AS
  ( SELECT patientunitstayid,
           labname,
           labresultoffset,
           labresult,
           ROW_NUMBER() OVER (PARTITION BY patientunitstayid, labname ORDER BY labresultoffset ASC) AS POSITION
   FROM `physionet-data.eicu_crd.lab`
   WHERE ((labname) = 'creatinine')
     AND labresultoffset BETWEEN -902460 AND 0 -- first creat available value between 3 months before ICU admission and time 0 of ICU admission (ICU admission itself)
     ORDER BY patientunitstayid, labresultoffset )
SELECT patientunitstayid,
       max(CASE WHEN (labname) = 'creatinine' AND POSITION =1 THEN labresult ELSE NULL END) AS creat1,
       max(CASE WHEN (labname) = 'creatinine' AND POSITION =1 THEN labresultoffset ELSE NULL END) AS creat1offset
FROM tempo
GROUP BY patientunitstayid
ORDER BY patientunitstayid
