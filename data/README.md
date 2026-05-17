# 📊 Data Dictionary — PharmaFlow Analytics

This folder holds a **50,000-row sample** of the joined master table for preview purposes (`master_table_sample.csv`). The full dataset is **10.8 million rows across 9 relational tables** and is regenerated locally by running `01_data_generation/PharmaFlow_01_DataGeneration.ipynb`.

---

## 🗂️ Schema Overview — 9 Tables

```
                          ┌──────────────────┐
                          │   PATIENTS       │
                          │   (400,000)      │
                          └────────┬─────────┘
                                   │ patient_id
                          ┌────────▼─────────┐         ┌──────────────────┐
                          │     ORDERS       │◄────────│ PRESCRIPTIONS    │
                          │   (2,000,000)    │ order_id│   (899,895)      │
                          └────────┬─────────┘         └──────────────────┘
                                   │ order_id
                          ┌────────▼─────────┐         ┌──────────────────┐
                          │  ORDER_ITEMS     │         │   SHIPMENTS      │
                          │   (5,427,282)    │         │   (1,959,895)    │
                          └────────┬─────────┘         └──────────────────┘
                                   │ product_id
                          ┌────────▼─────────┐         ┌──────────────────┐
                          │   PRODUCTS       │         │     RETURNS      │
                          │    (15,000)      │         │    (~120,000)    │
                          └──────────────────┘         └──────────────────┘

                  ┌──────────────────────┐   ┌──────────────────┐
                  │ FULFILLMENT_CENTERS  │   │    INSURANCE     │
                  │         (5)          │   │       (12)       │
                  └──────────────────────┘   └──────────────────┘
```

---

## 📋 Table Definitions

### 1. `patients.csv` (400,000 rows)

| Column | Type | Description |
|---|---|---|
| `patient_id` | int | Unique patient identifier |
| `signup_date` | date | Date of account creation |
| `age` | int | Patient age (clipped 18–95) |
| `gender` | str | F / M / D |
| `country` | str | DE / AT / CH / NL |
| `city` | str | Population-weighted city assignment |
| `insurance_id` | str | FK → insurance.insurance_id |
| `has_chronic_condition` | bool | Flag for chronic-disease patients (cardiac, diabetic, etc.) |

### 2. `products.csv` (15,000 rows)

| Column | Type | Description |
|---|---|---|
| `product_id` | int | Unique SKU identifier |
| `product_name` | str | Display name |
| `category` | str | Therapeutic category (12 distinct) |
| `is_prescription` | bool | True = Rx-only, False = OTC |
| `requires_cold_chain` | bool | Temperature-controlled storage required |
| `unit_price_eur` | float | List price in EUR |
| `manufacturer` | str | Producing company |

**Categories:** Prescription_Cardio, Prescription_Diabetes, Prescription_Respiratory, Prescription_Mental_Health, Prescription_Hormone, OTC_Pain_Relief, OTC_Cold_Flu, OTC_Digestive, Vitamins_Supplements, Personal_Care, Baby_Mother_Care, Medical_Devices

### 3. `orders.csv` (2,000,000 rows)

| Column | Type | Description |
|---|---|---|
| `order_id` | int | Unique order identifier |
| `patient_id` | int | FK → patients.patient_id |
| `order_date` | date | Order placement date |
| `fc_id` | str | FK → fulfillment_centers.fc_id |
| `channel` | str | Web / Mobile_App / Phone |
| `is_prescription_order` | bool | Order contains prescription items |
| `uses_e_rezept` | bool | Uses digital E-Rezept token (vs paper) |
| `order_status` | str | Delivered / Cancelled / Returned |

### 4. `order_items.csv` (5,427,282 rows)

| Column | Type | Description |
|---|---|---|
| `order_item_id` | int | Unique line item identifier |
| `order_id` | int | FK → orders.order_id |
| `product_id` | int | FK → products.product_id |
| `quantity` | int | Units ordered |
| `unit_price_eur` | float | Price at time of order |
| `discount_pct` | float | Discount applied (0.0–0.15) |
| `line_total_eur` | float | quantity × unit_price × (1 − discount) |

### 5. `prescriptions.csv` (899,895 rows)

| Column | Type | Description |
|---|---|---|
| `prescription_id` | int | Unique prescription identifier |
| `order_id` | int | FK → orders.order_id (Rx orders only) |
| `e_rezept_token` | str | Digital token (null for paper prescriptions) |
| `prescription_date` | date | Date written by doctor |
| `prescribing_doctor_id` | int | Anonymized doctor ID |
| `is_repeat_prescription` | bool | Recurring chronic-condition Rx |

### 6. `shipments.csv` (1,959,895 rows)

| Column | Type | Description |
|---|---|---|
| `shipment_id` | int | Unique shipment identifier |
| `order_id` | int | FK → orders.order_id |
| `carrier` | str | DHL / Hermes / GLS / DPD / Austrian_Post / Swiss_Post |
| `processing_hours` | float | Order → dispatch time (Rx orders slower) |
| `delivery_days` | int | Dispatch → delivery duration |
| `cold_chain_required` | bool | Temperature-controlled shipment |
| `on_time_delivery` | bool | Delivered within SLA |
| `shipment_cost_eur` | float | Logistics cost |

### 7. `returns.csv` (~120,000 rows)

| Column | Type | Description |
|---|---|---|
| `return_id` | int | Unique return identifier |
| `order_id` | int | FK → orders.order_id (OTC only; Rx legally non-returnable in DE) |
| `return_reason` | str | Wrong_Product / Damaged_Packaging / Expired_Item / No_Longer_Needed / Quality_Issue / Wrong_Quantity / Allergic_Reaction |
| `refund_amount_eur` | float | Refund value |
| `return_date` | date | Return registration date |

### 8. `fulfillment_centers.csv` (5 rows)

| Column | Type | Description |
|---|---|---|
| `fc_id` | str | Unique FC code (FC001–FC005) |
| `fc_name` | str | Sevenum / Köln / München / Wien / Zürich |
| `country` | str | NL / DE / AT / CH |
| `city` | str | Host city |
| `capacity_orders_per_day` | int | Daily processing capacity |
| `cold_chain_enabled` | bool | Equipped for temperature-controlled fulfillment |
| `opened_year` | int | Year of operations launch |

### 9. `insurance.csv` (12 rows)

| Column | Type | Description |
|---|---|---|
| `insurance_id` | str | Unique insurance code (INS01–INS12) |
| `insurance_name` | str | Insurance provider name |
| `type` | str | Gesetzlich (statutory) / Privat (private) |
| `country` | str | DE / AT / CH |
| `market_share_pct` | float | Real-world market share |

---

## 🔑 Join Logic

```sql
-- Master analytical view: joins everything
SELECT
    o.order_id, o.patient_id, o.order_date,
    p.country, p.city,
    pr.category, pr.is_prescription,
    oi.line_total_eur,
    s.carrier, s.on_time_delivery,
    fc.fc_name
FROM orders o
JOIN patients p              ON o.patient_id = p.patient_id
JOIN order_items oi          ON o.order_id = oi.order_id
JOIN products pr             ON oi.product_id = pr.product_id
JOIN fulfillment_centers fc  ON o.fc_id = fc.fc_id
LEFT JOIN shipments s        ON o.order_id = s.order_id
WHERE o.order_status = 'Delivered'
```

---

## ⚠️ Notes on Synthetic Data

- All data is **generated with Python** using NumPy + Faker, seeded for reproducibility (`SEED=42`).
- Probabilities, distributions, and weights are modeled after real DACH pharmacy market data (population distributions, insurance market share, E-Rezept adoption timeline, carrier reliability benchmarks).
- The dataset is **not real patient data** and contains no PII.
