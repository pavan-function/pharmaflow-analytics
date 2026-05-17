# PharmaFlow Analytics — Business Insights

> **Analysis period:** January 2023 – December 2025
> **Dataset:** 10.8M rows across 9 relational tables — 1.94M delivered orders, 384K active patients, 15K SKUs, 1.96M shipments across DE, AT, CH, NL
> **Methodology:** SQL aggregation (DuckDB) + Python statistical analysis (pandas, scipy)

---

## Executive Summary

PharmaFlow operates a profitable, growth-stage online pharmacy across the DACH region with **€266.4M in three-year GMV**, **80.6% on-time delivery**, and a **4.13% return rate** — well below e-commerce industry norms.

The single most important strategic shift in the analysis window is the **E-Rezept (electronic prescription) adoption curve: 5% in 2023 → 92% in 2025**, driven by the German E-Rezept mandate. This shift is already cutting prescription processing time by **71%** and is the foundation of every operational gain forecasted below.

Three operational risks were identified: **cold-chain delivery underperformance**, **carrier reliability variance**, and **Medical Devices return concentration**. Each is quantified below with a recommended action.

---

## 📊 Headline KPIs

| KPI | Value | Notes |
|---|---|---|
| Total Revenue (3-year) | **€266.4M** | Delivered orders only |
| Total Orders | **1,939,990** | Excludes cancelled/pending |
| Active Patients | **384,394** | Patients with ≥1 delivered order |
| Average Order Value | **€137.32** | Inflated by Medical Devices basket |
| Rx Revenue Share | **38.4%** | OTC = 61.6% |
| E-Rezept Adoption (2025) | **91.9%** | Up from 5.0% in 2023 |
| Overall On-Time Delivery | **80.6%** | Above 80% target |
| Cold-Chain On-Time | **66.6%** | 14-point gap to standard |
| Return Rate | **4.13%** | Industry low |

---

## 🔍 The 8 Key Findings

### Finding 1 — E-Rezept Adoption Exploded 18× in 24 Months

**The number:** Prescription orders using E-Rezept grew from **5.0% in 2023 → 60.0% in 2024 → 91.9% in 2025**.

**Why it matters:** The German E-Rezept mandate (effective January 2024) reshaped prescription dispensing. PharmaFlow's adoption curve mirrors the national rollout, confirming the platform is fully aligned with regulatory direction. Patients who don't adopt E-Rezept by mid-2026 will be statistically rare (<10%).

**Recommendation:** Invest in tooling for the remaining ~8% paper-prescription tail — these are likely elderly patients or those with non-digital insurance providers. A targeted onboarding campaign could close most of this gap within 12 months.

---

### Finding 2 — E-Rezept Cuts Prescription Processing Time by 71%

**The number:** Average order-to-dispatch processing time:
- E-Rezept prescriptions: **4.0 hours**
- Paper prescriptions: **14.0 hours**
- **Time saved: 71.3%** (statistically significant, p < 0.001)

**Why it matters:** Pharmacist time is the single most expensive resource in any pharmacy operation. Cutting 10 hours of validation work per paper Rx means pharmacists can be redeployed to higher-value tasks (patient consultation, clinical screening, complex orders). Across 900K Rx orders annually, this represents thousands of pharmacist-hours freed per year.

**Recommendation:** Quantify the freed capacity in FTE-equivalents and reinvest into clinical patient support — a service tier competitors can't easily replicate.

---

### Finding 3 — Top 20% of Patients Drive 47% of Revenue

**The number:** **~76,900 patients (top 20%)** account for **€124.4M (46.7%) of total revenue**.

**Why it matters:** Pareto isn't quite holding (it's 47/20, not 80/20), but the concentration is still material. Losing one Champion patient costs roughly the same as acquiring ~3 average patients. CRM and retention investment in this top quintile yields disproportionate return.

**Recommendation:** Build a dedicated VIP service for the top 20% — priority dispatch, free cold-chain shipping, dedicated pharmacist hotline. Cost: low. Retention upside: high.

---

### Finding 4 — Chronic Patients Are 3× More Valuable Than Acute

**The number:**
- Chronic patient avg lifetime value: **€1,248.81**
- Acute patient avg lifetime value: **€416.05**
- **Multiplier: 3.0×**

**Why it matters:** Chronic patients (cardiovascular, diabetic, respiratory, mental health) reorder predictably — they need repeat prescriptions for life-managing medications. They represent stable, forecastable revenue. Acute patients are unpredictable, one-off transactional.

**Recommendation:** Acquisition marketing should index chronic-condition keywords and partner channels (chronic disease patient associations, GP networks). Use medication category as a leading indicator: any first order for cardio/diabetes/respiratory Rx flags a high-LTV cohort.

---

### Finding 5 — GLS Underperforms DHL by 20 Percentage Points

**The number:** On-time delivery rates by carrier:

| Carrier | OTIF % | Volume Share |
|---|---|---|
| DHL | **85.6%** | 55% |
| Swiss Post | 82.5% | 5% |
| Austrian Post | 80.5% | 7% |
| DPD | 77.5% | 8% |
| Hermes | 73.4% | 15% |
| **GLS** | **65.7%** | **10%** |

**Gap: 19.9 percentage points** between DHL (best) and GLS (worst).

**Why it matters:** GLS handles ~196K shipments. If GLS performed at DHL's rate, ~39,000 additional shipments would be on time over the analysis period (~13,000 per year). Late deliveries drive complaints, refunds, and lost repeat orders.

**Recommendation:** Reduce GLS volume share from 10% to 4%, shift the difference to DHL and Swiss Post. Renegotiate GLS contract with stricter SLA penalties or wind down the partnership. Conservative estimate: ~10,000 fewer late deliveries per year.

---

### Finding 6 — Cold-Chain Shipments Run 14 Points Below Standard OTIF

**The number:**
- Standard shipment OTIF: **~81%**
- Cold-chain shipment OTIF: **66.6%**
- Gap: **~14 percentage points**
- Cold-chain volume: ~157,000 shipments (8% of total)

**Why it matters:** Cold-chain shipments carry the highest-value products (insulin, biologics, certain dermatology Rx) and the highest-stakes patient impact. A late insulin delivery isn't just a service issue — it's a patient safety issue. The 14-point gap is operationally significant.

**Recommendation:** Audit the cold-chain handoff process at each fulfillment center. Sevenum and Köln (cold-chain-enabled FCs) likely concentrate this issue. Investigate carrier pickup windows, refrigerated truck availability, and packaging dwell time. Target: close the gap to <8 points within two quarters.

---

### Finding 7 — Medical Devices: #1 Revenue, #1 Returns

**The number:**
- Medical Devices revenue: **€73.1M (27.4% of total revenue)**
- Medical Devices return rate: **9.3%** (highest of all categories vs OTC Cold/Flu at 6.4%)

**Why it matters:** Medical Devices is simultaneously the most valuable category and the most return-prone. Each return on a high-AOV device (avg €168 per line item) costs more than 3 returns on a low-AOV OTC item. The category needs targeted intervention: better product descriptions, more accurate sizing guides, and clearer return-prevention messaging at checkout.

**Recommendation:** Build a category-specific UX improvement program — enriched product imagery, video demos, decision-support quizzes. Reducing the return rate from 9.3% to 7.5% would prevent ~6,800 returns and protect ~€1.1M in shipping/refund costs annually.

---

### Finding 8 — DE Dominates at 72% of Revenue; AT and NL Are Comparable Growth Markets

**The number:** Revenue distribution by country:

| Country | Revenue | Share |
|---|---|---|
| Germany | **€192.1M** | **72.1%** |
| Austria | €26.5M | 10.0% |
| Netherlands | €26.3M | 9.9% |
| Switzerland | €21.4M | 8.0% |

**Within Germany, the top 3 cities concentrate the market:** Berlin (€42M), Hamburg (€27M), and München (€25M) account for over half of German revenue.

**Why it matters:** PharmaFlow is functionally a German company with three small international markets. AT, NL, and CH combined deliver less than 28% of revenue despite being three separate operations with their own regulatory regimes, insurance integrations, and logistics. The economics of those markets need scrutiny: is the per-market overhead justified by their absolute contribution?

**Recommendation:** Run a profitability analysis per country (revenue minus FC operating cost, regulatory compliance cost, marketing spend). If AT or CH is loss-making at current volumes, either consolidate operations into a regional hub (e.g., serve AT from München FC) or set a 24-month growth target — invest aggressively or sunset cleanly.

---

## 📈 What I'd Build Next

If I had three more weeks on this project:

1. **Patient churn predictive model** — logistic regression on RFM features to predict 90-day churn risk
2. **Carrier cost vs reliability optimization** — linear programming to find optimal volume allocation across carriers given a cost budget and OTIF target
3. **E-Rezept funnel deep-dive** — segment the remaining 8% paper holdouts by age, region, and insurance to design targeted conversion campaigns
4. **Demand forecasting** — ARIMA/Prophet model on weekly category demand to inform inventory planning, especially for Q4 cold/flu surge

---

## ⚠️ Methodology Notes

- **Synthetic data:** This project uses Python-generated synthetic data modeled on real online pharmacy operations (Redcare, Shop Apotheke, DocMorris). Numbers are illustrative; methodology is production-grade.
- **Statistical tests:** E-Rezept processing time comparison uses an independent two-sample t-test on a random sample of 50K Rx orders.
- **Definitions:** OTIF = On-Time-In-Full = delivered on or before the SLA target (3 days standard, 2 days cold-chain). AOV = Average Order Value = revenue ÷ orders. LTV = customer lifetime value = sum of revenue across all orders to date.
- **Excluded from analysis:** Cancelled orders, pending orders, orders missing shipment records.

---

*Document prepared as part of the PharmaFlow Analytics project — end-to-end analysis using SQL, Python, and Tableau.*
