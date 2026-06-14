
SELECT 
  a.*,
  b.*,
  2024 - a.model_year AS device_age
FROM intel.device_data a
LEFT JOIN intel.impact_data b
ON a.device_id = b.device_id;


WITH joined_data AS (
  SELECT  
    a.device_id,
    a.model_year,
    2024 - a.model_year AS device_age,
    b.energy_savings_yr,
    b.co2_saved_kg_yr
  FROM intel.device_data a
  LEFT JOIN intel.impact_data b
  ON a.device_id = b.device_id
)

SELECT
  COUNT(*) AS total_devices,
  AVG(device_age) AS avg_device_age,
  AVG(energy_savings_yr) AS avg_energy_savings_yr,
  SUM(co2_saved_kg_yr) / 1000.0 AS total_co2_saved_tons
FROM joined_data;


SELECT 
  a.device_type,
  COUNT(*) AS total_devices,
  AVG(b.energy_savings_yr) AS avg_energy_savings_yr,
  AVG(b.co2_saved_kg_yr) / 1000.0 AS avg_co2_saved_tons
FROM intel.device_data a
LEFT JOIN intel.impact_data b
ON a.device_id = b.device_id
GROUP BY a.device_type;


WITH joined_data AS (
  SELECT  
    a.*,
    b.*,
    2024 - a.model_year AS device_age,
    CASE
      WHEN 2024 - a.model_year <= 3 THEN 'newer'
      WHEN 2024 - a.model_year BETWEEN 4 AND 6 THEN 'mid-age'
      ELSE 'older'
    END AS device_age_bucket
  FROM intel.device_data a
  LEFT JOIN intel.impact_data b
  ON a.device_id = b.device_id
)

SELECT
  device_age_bucket,
  COUNT(*) AS total_devices,
  AVG(energy_savings_yr) AS avg_energy_savings_yr,
  AVG(co2_saved_kg_yr) / 1000.0 AS avg_co2_saved_tons
FROM joined_data
GROUP BY device_age_bucket;


-- =========================
-- TASK 3: REGION + % IMPACT
-- =========================
WITH base AS (
  SELECT
    a.device_id,
    a.device_type,
    b.region,
    b.energy_savings_yr,
    b.co2_saved_kg_yr
  FROM intel.device_data a
  LEFT JOIN intel.impact_data b
  ON a.device_id = b.device_id
)

SELECT
  region,
  device_type,
  COUNT(*) AS total_devices,
  AVG(energy_savings_yr) AS avg_energy_savings_yr,
  AVG(co2_saved_kg_yr) / 1000.0 AS avg_co2_saved_tons,

  SUM(energy_savings_yr)
    / SUM(SUM(energy_savings_yr)) OVER (PARTITION BY region)
    * 100 AS pct_energy_savings,

  SUM(co2_saved_kg_yr)
    / SUM(SUM(co2_saved_kg_yr)) OVER (PARTITION BY region)
    * 100 AS pct_co2_savings

FROM base
GROUP BY region, device_type;
