# 03 - Python Analysis

This folder contains the **statistical analysis layer** - pandas, scipy, matplotlib, seaborn - that goes beyond SQL aggregations to produce business insights and visualizations.

## 📓 What's Inside

| File | Description |
|---|---|
| `PharmaFlow_03_Python_Analysis.ipynb` | The analysis notebook |
| `charts/` | 5 saved PNG charts |

## 🧠 What This Notebook Does

| Step | Analysis | Why It Matters |
|---|---|---|
| 1 | Load 9 CSVs + register with DuckDB | Single source for all downstream work |
| 2 | Build master analytical table (joined view of all relationships) | One DataFrame for fast iteration |
| 3 | Monthly revenue trend with Rx/OTC split | Seasonality + product mix in one chart |
| 4 | E-Rezept impact analysis with t-test | Statistical proof of processing-time gains |
| 5 | RFM patient segmentation (Champions, Loyal, At Risk, Churned) | Standard customer analytics framework used in real teams |
| 6 | Geographic revenue analysis (country + city level) | Reveals DE dominance + city concentration |
| 7 | Operations KPIs (FC + carrier OTIF) | Identifies operational risk |
| 8 | Headline KPI calculation block | Locked metrics for the dashboard |

## 📈 Charts Generated

| Chart | Purpose |
|---|---|
| `01_monthly_revenue_trend.png` | Stacked area chart showing Rx + OTC over 36 months |
| `02_e_rezept_impact.png` | Boxplot + adoption curve side-by-side |
| `03_rfm_segmentation.png` | Patient segments by count + revenue |
| `04_geographic_revenue.png` | Country bars + Top 15 cities |
| `05_operations_otif.png` | OTIF by FC + carrier with target lines |

## 📊 Outputs for Tableau

The notebook saves **9 pre-aggregated CSVs** to a `tableau_data/` folder. Each CSV powers a specific chart in the Tableau dashboards. Pre-aggregating in Python (not Tableau) means:

1. The single source of truth for every KPI lives in Python
2. Tableau Public loads fast (no 5M-row file parsing)
3. Dashboard numbers cannot drift from analysis numbers

## 🚀 How to Run

1. Open `PharmaFlow_03_Python_Analysis.ipynb` in Google Colab
2. Make sure data from Step 1 is in `/content/drive/MyDrive/PharmaFlow/pharmaflow_data/`
3. Run all cells (~5-8 minutes)
4. Charts save automatically; Tableau CSVs save to `python_analysis_outputs/tableau_data/`

## 📚 Libraries Used

```
pandas, numpy, duckdb, scipy.stats, matplotlib, seaborn
```
