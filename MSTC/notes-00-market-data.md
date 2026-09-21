# MSTC - Market and aggregator data (primary-cross-check file)
Compiled 21-Sep-2026 by the lead analyst. Source: TradingView data service (aggregator - SECONDARY source, must be cross-checked against filings).

## Quote snapshot (last traded bar ~19-Sep-2026)
- CMP: Rs 728.20
- Market cap: Rs 5,103.30 cr (51,032,962,825)
- Implied shares outstanding: 5,103.30 / 728.20 = 7.0081 cr shares
- P/E (TTM): 21.88x
- P/B: 5.67x
- EV/EBITDA (TTM): 21.61x
- Dividend yield: 2.17%
- Employees (as tagged): 289
- Sector tag: Retail Trade / Internet Retail (MISCLASSIFICATION - MSTC is a B2G e-auction service platform, not internet retail. A mechanical screen will benchmark it against the wrong cohort.)

## TTM (four quarters to Jun-2026) per aggregator
- Revenue from operations TTM: Rs 386.47 cr, +21.02% YoY
- EBITDA TTM: Rs 236.20 cr, +24.82% YoY (EXCLUDES other income)
- Net income TTM: Rs 234.31 cr, -44.88% YoY (prior TTM contained the FSNL divestment gain)
- Net margin on revenue: 60.63% (only possible because treasury/other income sits outside "revenue")
- Gross margin: 58.02%

## Annual series (aggregator labels calendar years; mapped to Indian FY here)
Aggregator FY label "2025" reconciles exactly to the sum of Apr-2025..Mar-2026 quarters, so "2025" = FY2025-26 (FY26).

| Indian FY | Revenue (Rs cr) | EBITDA (Rs cr) | PAT (Rs cr) | EPS (Rs) | Total debt (Rs cr) | FCF (Rs cr) |
|---|---|---|---|---|---|---|
| FY19 | 3,292.00 | -196.56 | -307.10 | -43.62 | 614.65 | 48.19 |
| FY20 | 1,231.40 | 203.10 | 97.01 | 13.78 | 258.65 | 170.51 |
| FY21 | 779.98 | 158.53 | 112.96 | 16.05 | 154.39 | 656.64 |
| FY22 | 876.15 | 233.34 | 199.10 | 28.28 | 149.50 | 110.44 |
| FY23 | 720.97 | 304.62 | 241.96 | 34.37 | 145.00 | 844.38 |
| FY24 | 316.25 | 198.38 | 165.04 | 23.44 | 145.00 | -312.84 |
| FY25 | 310.96 | 188.46 | 407.07 | 57.82 | 145.00 | 304.97 |
| FY26 | 369.66 | 246.33 | 218.43 | 31.03 | 145.23 | 27.28 |

READ-THROUGH:
- FY19 loss of Rs 307.10 cr on Rs 3,292 cr revenue is the legacy trading-book blow-up, the year MSTC listed (Mar-2019).
- Revenue collapses FY23 Rs 721 cr -> FY24 Rs 316 cr (-56%). This is a PRESENTATION change (gross-to-net / discontinued operations), not a business collapse. MUST be confirmed against the filing - a mechanical 5-year revenue CAGR is meaningless across this break.
- FY25 PAT Rs 407.07 cr vs FY26 Rs 218.43 cr. The FY25 figure carries the FSNL divestment gain. The -46% "profit fall" a screener shows for FY26 is an artefact.
- Total debt frozen at Rs 145.00 cr from FY23 to FY26 with zero movement. An exactly constant liability across four years is almost never real borrowing - most likely a lease liability or a stale aggregator carry-forward. FLAG: verify against the balance sheet.
- FCF series swings from -Rs 312.84 cr (FY24) to +Rs 844.38 cr (FY23). For MSTC this is EMD/deposit float movement, not operating cash generation. Any aggregator FCF or cash-conversion metric for MSTC is unusable without stripping the float.

## Quarterly series - AGGREGATOR DATA IS PARTLY CORRUPT (finding)
The aggregator's quarterly series for MSTC does not reconcile before Apr-2025:
- Its "Q1 2024" quarterly row (revenue Rs 316.25 cr, PAT Rs 165.04 cr, EPS 23.4439) is byte-identical to its FY24 ANNUAL row. A full-year figure is being presented as a quarter.
- Its four quarters Apr-2024..Mar-2025 sum to Rs 431.41 cr revenue and Rs 444.66 cr PAT, against an annual FY25 of Rs 310.96 cr and Rs 407.07 cr. They do not add up.
- From Apr-2025 onward the four quarters sum exactly to the FY26 annual, so only the last five quarters are trustworthy from this source.
CONSEQUENCE: the 8-quarter table in the report must be built from the company's own filed results, not from this feed. This is a live example of known-trap #1.

Trustworthy quarterly rows from this feed (consolidated):
| Quarter | Revenue from ops (Rs cr) | EBITDA ex-OI (Rs cr) | PAT (Rs cr) | EPS (Rs) |
|---|---|---|---|---|
| Q1 FY26 (Jun-2025) | 77.43 | 45.64 | 42.34 | 6.01 |
| Q2 FY26 (Sep-2025) | 85.01 | 51.53 | 47.50 | 6.75 |
| Q3 FY26 (Dec-2025) | 88.43 | 50.96 | 51.37 | 7.30 |
| Q4 FY26 (Mar-2026) | 118.80 | 75.97 | 77.22 | 10.97 |
| Q1 FY27 (Jun-2026) | 94.24 | 57.73 | 58.22 | 8.27 |

Company release for Q1 FY27 (Jun-2026), cross-checked:
- Total revenue (incl. other income) Rs 118.00 cr vs Rs 93.66 cr, +25.99%
- Revenue from operations Rs 94.24 cr vs Rs 77.43 cr, +21.7%
- EBITDA (company definition, INCLUDING other income) Rs 81.49 cr vs Rs 61.88 cr, +31.69%
- PBT Rs 78.53 cr vs Rs 59.63 cr, +31.70%
- Standalone PAT Rs 58.12 cr, +31.14%; consolidated PAT Rs 58.22 cr, +37.51%
- EPS Rs 8.26 standalone
DERIVED: other income in Q1 FY27 = 118.00 - 94.24 = Rs 23.76 cr. That is 30.3% of PBT from non-core income in a single quarter. Confirms the company's own EBITDA definition is inflated by treasury income; the aggregator's Rs 57.73 cr is the operating number.

## Monthly price history (unadjusted, from listing)
Listed Mar-2019. IPO issue price Rs 120 (retail discount applied). First month close Rs 113.95 - broke issue price immediately.
- All-time low: Rs 73.10 (Aug-2019 and again Mar-2020)
- Feb-2021 monthly high Rs 400; Oct-2021 monthly high Rs 542
- ALL-TIME HIGH: Rs 1,165 (Jan-2024). Month close Rs 1,060.85. The PSU re-rating peak.
- Jul-2024 monthly high Rs 1,036.90 - the last retest
- Then a 14-month bear phase. Feb-2025 close Rs 433.70; Mar-2025 low Rs 411.10
- Rs 362.15 low in Mar-2026 - the cycle bottom, -68.9% from the ATH
- Jun-2026: open Rs 474, close Rs 709.40, +49.6% in ONE month on volume of 7.01 cr shares against a typical 30-60 lakh. Volume was ~13x normal and roughly equal to the entire free float turning over. Catalyst: Union Cabinet cleared the Delhi-NCR vehicle scrappage incentive scheme on 03-Jun-2026.
- Sep-2026 (to ~19-Sep): high Rs 805, low Rs 671, last Rs 728.20
- 52-week range approx Rs 362.15 (Mar-2026) to Rs 805 (Sep-2026). CMP is -37.5% from the Jan-2024 all-time high and +101% off the Mar-2026 low.
- No bonus or split adjustment is visible in the series (the Mar-2019 bar still shows the actual Rs 115 listing level), so on this feed there has been no bonus or split since listing. VERIFY independently.

## Peer set snapshot, same date (aggregator)
| Company | CMP (Rs) | Mcap (Rs cr) | P/E TTM | P/B | EV/EBITDA | Div yld % | Rev TTM (Rs cr) | Rev gr % | Net margin % | Employees |
|---|---|---|---|---|---|---|---|---|---|---|
| MSTC | 728.20 | 5,103 | 21.88 | 5.67 | 21.61 | 2.17 | 386 | 21.0 | 60.6 | 289 |
| IEX | 113.88 | 10,201 | 19.99 | 7.44 | 19.04 | 3.06 | 632 | 13.7 | 80.2 | 179 |
| MCX | 3,201.00 | 82,847 | 52.84 | 28.61 | 37.09 | 0.25 | 2,775 | 103.8 | 55.6 | 478 |
| CDSL | 1,361.00 | 29,051 | 62.36 | 14.51 | 41.48 | 0.92 | 1,239 | 3.3 | 36.8 | 625 |
| BSE | 3,160.40 | 133,040 | 45.51 | 19.32 | 34.40 | 0.31 | 5,810 | 60.3 | 48.7 | 1,625 |
| CAMS | 705.10 | 17,589 | 35.47 | 13.24 | 24.69 | 1.81 | 1,557 | 7.7 | 31.8 | 8,502 |
| KFin Technologies | 898.00 | 15,558 | 45.61 | 9.26 | 27.03 | 1.33 | 1,427 | 22.3 | 23.9 | 6,569 |
| RITES | 203.20 | 9,958 | 23.40 | 3.64 | 17.95 | 3.89 | 2,458 | 10.6 | 17.0 | 3,035 |
| Engineers India | 285.70 | 14,978 | 20.48 | 5.10 | 19.97 | 1.88 | 3,878 | 16.3 | 20.2 | 2,764 |
| IRCON | 108.65 | 10,332 | 19.51 | 1.54 | 13.40 | 1.73 | 9,241 | -9.9 | 5.7 | 1,070 |
| RailTel | 260.35 | 8,500 | 24.15 | 3.69 | 13.03 | 1.23 | 4,427 | 20.8 | 7.8 | 917 |
| MOIL | 241.55 | 4,964 | 16.19 | 1.81 | 10.53 | 2.18 | 1,523 | 5.8 | 19.9 | 9,942 |
| MMTC | 59.84 | 9,031 | 20.06 | 4.23 | n.m. | nil | 2.73 | -19.7 | n.m. | 245 |
| ITI | 255.15 | 24,642 | 93.40 | 12.89 | n.m. | nil | 2,111 | -41.3 | 12.5 | n.a. |
Notes: MMTC's 16,386% "net margin" and n.m. EV/EBITDA show what happens when a trading PSU moves to net revenue recognition - the same artefact MSTC carries in milder form. MMTC's PAT is almost entirely its share of the Neelachal/associate and dividend income, not operations.

## Dated corporate news from the wire (TradingView news feed)
- 18-Nov-2024: PSU stocks de-rate broadly; PSU share of market cap at an 11-month low. MSTC named in the cohort.
- 01-Sep-2025: 60th AGM convened for 24-Sep-2025.
- 15-Sep-2025: MSTC gains on a pollution control board approval for an electronic trading platform (EPR/credit trading adjacency). VERIFY which board and what the mandate actually is.
- 15-Oct-2025: WisdomTree picks up a 0.51% stake in MSTC (index/ETF flow, not active conviction).
- 29-Oct-2025: Karnataka Excise Department signs an e-auction agreement with MSTC - liquor licence auctions. New state-government vertical.
- 05-Nov-2025: MSTC nominated for the e-auction of the gold tariff-rate quota (TRQ). Nomination, not tender - relevant to the contestability question.
- 26-Feb-2026: MSTC becomes L1 bidder for a Coal India tender; same day, reported as winning the Coal India tender for non-regulated-sector auctions. The single largest GMV relationship, retained via COMPETITIVE TENDER, not nomination. The price at which L1 was won is the key unknown - it determines take-rate compression.
- 26-Mar-2026: EaseMyTrip enters an exclusive partnership with MSTC. Unexplained and commercially odd for a B2G auction platform - classic Reg 30 announcement never explained on a call. INVESTIGATE.
- 03-Jun-2026 (Cabinet), traded 04-Jun-2026: Union Cabinet approves the Delhi-NCR old-vehicle replacement incentive scheme. Total outlay Rs 9,585 cr (Rs 5,041 cr central support, Rs 1,601 cr state tax concessions). Covers ~2.07 lakh vehicle owners - ~1.91 lakh truck owners and 16,329 bus owners across Delhi, Haryana, Rajasthan and UP. Incentives: 5% interest subsidy for five years, monthly fuel vouchers up to Rs 4,800, one-time EV purchase benefits. MSTC +14.72% intraday to Rs 512.15; MMTC +6.97%.
- 29-Jun-2026: MSTC +7% on scrappage incentives in the Delhi EV Policy 2026; one-month rally extends to +57%.

ANALYST NOTE ON THE JUN-2026 RE-RATING: the entire move is a policy-headline re-rating on the vehicle-scrappage theme. MSTC's own economic exposure to Delhi-NCR scrappage runs through a 50:50 JV (CERO) that is small relative to the core auction business. The market has re-priced the parent for a theme that sits in an associate. Quantifying that gap is the core valuation work of this report.

## Additional aggregator fields pulled 21-Sep-2026
- Total shares outstanding: 7,04,00,000 (7.04 cr). Face value Rs 10 (to confirm).
- Free float shares: 2,46,71,328 = 35.05% of capital. Implies promoter (President of India / Ministry of Steel) at ~64.95%. MSTC has long been reported at 64.75% promoter - consistent.
- 52-week high Rs 805.00; 52-week low Rs 362.15.
- 90-day average volume: 10.62 lakh shares/day. At Rs 728 that is ~Rs 7.7 cr/day of turnover against a free float worth ~Rs 1,796 cr - float turns over roughly every 230 sessions. Thin.
- Beta (1y): 1.379. High-beta policy-sensitive PSU.
- Performance: +39.26% over 1 year (and identical YTD, so the whole year's gain is this calendar year); +80.69% over 3 years; +129.43% over 5 years.
- Dividend per share FY26: Rs 15.70. Against EPS Rs 31.03 that is a 50.6% payout.
- Continuous dividend payout streak: 7 years (i.e. every year since listing, including through the FY19 loss year's aftermath).
- Next earnings release (scheduled): ~06-Nov-2026 (Q2 FY27).

### FY26 cash flow (aggregator) - THE SINGLE BIGGEST FORENSIC QUESTION
- Cash from operating activities: Rs 49.54 cr
- Cash from investing activities: +Rs 179.48 cr
- Cash from financing activities: -Rs 53.50 cr
- Capital expenditure: Rs 22.26 cr
- Free cash flow: Rs 27.28 cr
- Operating margin FY26: 63.83%; gross margin FY26: 70.12%

CFO of Rs 49.54 cr against PAT of Rs 218.43 cr is a 23% cash conversion, and against EBITDA of Rs 246.33 cr it is 20%. On its face that is a severe earnings-quality flag. Three benign explanations must be tested against the actual filed cash flow statement before the flag is upheld:
(a) interest/treasury income is classified under investing, not operating, which for MSTC moves a very large slice of profit out of CFO by presentation alone;
(b) earnest money deposit (EMD) and security deposit float held on behalf of bidders moves through operating working capital, so a year of net EMD outflow depresses CFO without touching economics;
(c) tax paid timing.
Until the filing is read, CFO-based conversion metrics for MSTC are UNRELIABLE IN BOTH DIRECTIONS. Recorded here as an open item, not as a conclusion.

## ENVIRONMENT CONSTRAINT ON THIS REPORT - read before relying on any figure
Primary-source retrieval was materially restricted while this report was compiled on 21-Sep-2026. The network egress policy of the research environment refused connections to every primary filing source attempted, specifically: bseindia.com, nseindia.com, mstcindia.co.in, pib.gov.in, dipam.gov.in, screener.in, trendlyne.com and business-standard.com. The session's web-search allowance was also exhausted during the research fan-out.
CONSEQUENCE: figures in this report come from (i) a licensed market-data service, which is an AGGREGATOR and therefore a secondary source, and (ii) dated news-wire copy. Annual reports, notes to accounts, the cash flow statement, the segment note, the related-party schedule, the CARO annexure, the CAG supplementary audit comments, shareholding-pattern filings and earnings-call transcripts could NOT be opened directly.
Every section must therefore mark unverified items explicitly, and the report must say plainly where a conclusion is provisional on reading the filing.
