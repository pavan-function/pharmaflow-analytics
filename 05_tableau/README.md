# 05 — Tableau Dashboards

Two interactive dashboards published to **Tableau Public**, built on the pre-aggregated CSVs produced by the Python analysis step.

## 🌐 Live Dashboards

| Dashboard | Direct Link |
|---|---|
| **Sales & Patient Performance** | https://public.tableau.com/views/PharmaFlowAnalytics/Dashboard_Sales |
| **Operations & E-Rezept** | https://public.tableau.com/views/PharmaFlowAnalytics/Dashboard_Operations |

## 📸 Screenshots

### Dashboard 1 — Sales & Patient Performance
![Sales Dashboard](dashboard_sales.png)

**Components:**
- 4 KPI tiles (Revenue, Orders, Patients, AOV)
- Monthly Rx vs OTC revenue trend (3-year timeline)
- Revenue by country (DE, AT, NL, CH)
- RFM patient segments (count + revenue side-by-side)
- Top 15 cities by revenue

### Dashboard 2 — Operations & E-Rezept
![Operations Dashboard](dashboard_operations.png)

**Components:**
- 4 KPI tiles (E-Rezept Adoption, Overall OTIF, Cold-Chain OTIF, Return Rate)
- E-Rezept adoption curve (5% → 92%, quarterly)
- On-time delivery by carrier (traffic-light: green/amber/red)
- On-time delivery by fulfillment center
- Rx vs OTC revenue mix (donut)

## 🎨 Design Choices

| Choice | Reasoning |
|---|---|
| Two separate dashboards (not one mega-dashboard) | Mirrors how real BI teams split Commercial vs Operations reporting |
| Traffic-light coloring on OTIF charts | Instantly highlights performance vs 80% target |
| Reference lines at 80% | Anchor every operations chart to a clear benchmark |
| Continuous date axes | Show full 36-month timeline, not month-of-year aggregates |
| Pre-aggregated CSVs as data source | KPIs cannot drift between Python analysis and dashboard |
| Cold-chain KPI highlighted in red | Flags the 14-point gap as an operational risk |

## 📊 Data Sources

Each chart draws from a pre-aggregated CSV produced in Step 3 (Python analysis):

| Chart | Source CSV |
|---|---|
| All KPI tiles | `00_headline_kpis.csv` |
| Monthly revenue trend | `01_monthly_revenue.csv` |
| E-Rezept curve | `02_e_rezept_adoption.csv` |
| RFM segments | `03_segment_summary.csv` |
| Country revenue | `04_country_summary.csv` |
| Top cities | `04_geo_revenue.csv` |
| Carrier OTIF | `05_carrier_performance.csv` |
| FC OTIF | `05_fc_performance.csv` |
