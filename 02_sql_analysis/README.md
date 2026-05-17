# 02 — SQL Analysis (18 Business Queries)

This folder contains the SQL analysis layer. **18 business queries** loaded into DuckDB to answer the operational and commercial questions a real pharmacy analyst would face.

## 📓 What's Inside

| File | Description |
|---|---|
| `PharmaFlow_02_SQL_Analysis.ipynb` | Loads 9 CSVs into DuckDB, runs all 18 queries, saves results |
| `queries/` | The 18 queries as standalone `.sql` files for direct review |

## ❓ Why DuckDB?

DuckDB is an in-memory analytical database that runs inside Python (no server, no install pain). It speaks **standard SQL** — these same queries work in PostgreSQL, BigQuery, Snowflake, and Redshift with minimal changes.

## 📋 The 18 Queries

### Section A — Revenue & Sales
| # | Query | Business Question |
|---|---|---|
| Q01 | `total_gmv_by_year` | What is annual revenue, and is it growing? |
| Q02 | `monthly_revenue_trend` | Where are the seasonal peaks? |
| Q03 | `rx_vs_otc_revenue` | What is the prescription vs OTC mix? |
| Q04 | `top_categories` | Which therapeutic categories drive revenue? |
| Q05 | `aov_by_channel` | Does Web, Mobile, or Phone produce higher AOV? |

### Section B — E-Rezept (the Redcare strategic story)
| # | Query | Business Question |
|---|---|---|
| Q06 | `e_rezept_adoption_by_year` | How fast did E-Rezept adoption grow? |
| Q07 | `e_rezept_processing_time` | Does E-Rezept actually speed up fulfillment? |
| Q08 | `e_rezept_by_country` | Which DACH markets are leading adoption? |

### Section C — Patient Behavior
| # | Query | Business Question |
|---|---|---|
| Q09 | `chronic_vs_acute_revenue` | What is the LTV gap between patient types? |
| Q10 | `top_20_patients_ltv` | Who are our most valuable patients? |
| Q11 | `repeat_purchase_90d` | What percent of patients reorder within 90 days? |
| Q12 | `patient_acquisition_trend` | How is new patient acquisition trending? |

### Section D — Operations & Cold Chain
| # | Query | Business Question |
|---|---|---|
| Q13 | `otif_by_fc` | Which fulfillment center is most reliable? |
| Q14 | `cold_chain_performance` | How does temperature-controlled logistics compare? |
| Q15 | `carrier_performance` | Which carriers are letting us down? |
| Q16 | `processing_time_rx_vs_otc` | Where do prescription orders bottleneck? |

### Section E — Returns
| # | Query | Business Question |
|---|---|---|
| Q17 | `return_rate_by_category` | Which categories drive return volume? |
| Q18 | `top_return_reasons` | Why are customers returning items? |

## 🚀 How to Run

1. Open `PharmaFlow_02_SQL_Analysis.ipynb` in Google Colab
2. Make sure data from Step 1 is in `/content/drive/MyDrive/PharmaFlow/pharmaflow_data/`
3. Run all cells — results save as CSVs to `sql_results/` for downstream use
