# 🌱 Intel Device Repurposing Impact Analysis (SQL Project)

## 📊 Overview
This project analyzes Intel’s 2024 device repurposing program to evaluate its impact on energy savings and CO₂ emissions. The goal is to identify which device types, age groups, and regions contribute most to sustainability outcomes and provide data-driven recommendations to optimize future repurposing strategies.

The dataset includes over 150,000+ repurposed devices.

---

## 🎯 Objective
- Evaluate environmental impact of repurposed devices
- Identify high-impact device types and regions
- Analyze trade-offs between device age, volume, and sustainability
- Provide recommendations to maximize energy and CO₂ savings

---

## 🧰 Tools Used
- SQL
- JOINs (INNER & LEFT)
- Common Table Expressions (CTEs)
- Aggregations (COUNT, AVG, SUM)
- Window Functions
- CASE WHEN logic

---

## 🗂️ Dataset
Two datasets were used:

**device_data**
- device_id
- device_type (Laptop / Desktop)
- model_year

**impact_data**
- device_id
- energy_savings_yr (kWh)
- co2_saved_kg_yr (kg)
- region
- recycling_rate
- usage_purpose

---

## 🔍 Key Analyses Performed
- Joined device and impact datasets
- Calculated device age and categorized into age buckets
- Measured total and average energy savings
- Converted CO₂ savings from kilograms to tons
- Analyzed impact by:
  - Device type
  - Device age group
  - Region
- Calculated percentage contribution of each segment within regions

---

## 📈 Key Insights
- Older devices deliver higher energy and CO₂ savings per unit
- Newer devices dominate in volume but have lower per-device impact
- Sustainability impact is unevenly distributed across device types
- Certain regions and device categories contribute disproportionately to total CO₂ reduction

---

## 💡 Recommendation
Intel should prioritize repurposing older devices, as they generate the highest environmental benefit per unit. However, maintaining large-scale reuse of newer devices ensures program scalability.

A balanced strategy that prioritizes high-impact device categories will maximize total energy savings and CO₂ reductions.

---

## 🧠 Skills Demonstrated
- Data aggregation and transformation in SQL
- Analytical thinking with real-world sustainability data
- Cohort-style segmentation (age bucketing)
- Performance optimization using window functions
- Insight generation for business decision-making
