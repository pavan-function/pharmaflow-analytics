# 01 — Data Generation

This folder contains the notebook that generates the **10.8M-row synthetic pharmacy dataset** powering the rest of the project.

## 📓 What's Inside

| File | Description |
|---|---|
| `PharmaFlow_01_DataGeneration.ipynb` | Generates 9 CSV files representing a full online pharmacy data warehouse |

## 🚀 How to Run

1. Open the notebook in **Google Colab**: [colab.research.google.com](https://colab.research.google.com) → File → Upload notebook
2. Runtime → Change runtime type → CPU (no GPU needed)
3. Run all cells top-to-bottom (Runtime → Run all)
4. Output: 9 CSV files saved to `pharmaflow_data/` (~450 MB total, ~6–8 minutes runtime)

## 📦 What Gets Generated

| Table | Rows | Description |
|---|---|---|
| `fulfillment_centers.csv` | 5 | Sevenum (NL), Köln, München, Wien, Zürich |
| `insurance.csv` | 12 | Gesetzlich + Privat providers across DACH |
| `patients.csv` | 400,000 | Population-weighted across DE/AT/CH/NL |
| `products.csv` | 15,000 | SKUs across 12 therapeutic categories |
| `orders.csv` | 2,000,000 | 3 years of orders with Q4 seasonality |
| `order_items.csv` | 5,427,282 | Order line items |
| `prescriptions.csv` | 899,895 | Rx orders with E-Rezept adoption curve |
| `shipments.csv` | 1,959,895 | Carrier, OTIF, cold-chain flags |
| `returns.csv` | ~120,000 | OTC returns (Rx legally non-returnable in DE) |

**Total: 10,786,994 rows**

## 🧠 Design Decisions Worth Noting

| Decision | Reasoning |
|---|---|
| Population-weighted cities | Berlin gets ~22% of German patients vs ~6% for Essen — matches real demographics |
| E-Rezept yearly probability ramp | 5% (2023) → 60% (2024) → 92% (2025) reflects the actual German mandate timeline |
| Carrier OTIF baselines | DHL 86%, GLS 66% — modeled on real logistics benchmarks |
| FC adjustments | Sevenum (flagship) +3%, Zürich (newest) −6% |
| Cold-chain penalty | −15 percentage points to OTIF — stricter 2-day SLA |
| Q4 seasonality | Cold/flu season drives Oct–Mar revenue peaks |
| Chronic patient bias | 60% of orders come from chronic patients (3× higher LTV) |
| Rx processing time | E-Rezept: ~4h (digital), Paper: ~14h (manual validation) |
| Returns by category | Medical Devices 14%, OTC Cold/Flu 3% — realistic pharma variance |

## 🔁 Reproducibility

All randomness uses `SEED=42`. Re-running this notebook produces byte-identical CSVs.
