# Section 13 - MSTC Limited: Shareholding Pattern, Flows, Surveillance, Index/F&O Status

Compiled 21-Sep-2026. Ticker: NSE MSTCLTD / BSE 542597. All figures INR crore unless stated as %.

METHODOLOGY NOTE / ACCESS CONSTRAINT: Direct fetches to trendlyne.com, screener.in, bseindia.com, nseindia.com, mstcindia.co.in, moneycontrol.com and most other primary/aggregator sites were BLOCKED by the sandbox's network egress proxy (confirmed via `$HTTPS_PROXY/__agentproxy/status`, which showed `connect_rejected` / gateway 403 for every one of these hosts). All data below was obtained through the WebSearch tool's AI-synthesized summaries of search results, not by reading primary filings directly. This is a material limitation: synthesized summaries can mis-date, mis-attribute, or conflate figures. Every figure is tagged with its retrieval date and source description; contradictions between sources are flagged explicitly rather than silently resolved. The web-search budget for this session was exhausted (200/200 calls used) partway through research, which further limits some sub-items below (marked NOT FOUND).

## 13.1 Shareholding pattern - last 8 quarters (Sep-2024 through Jun-2026, and Sep-2026 if filed)

ONLY ONE CLEAN DATA POINT WAS OBTAINED. Two aggregators returned slightly different splits, both apparently describing the same underlying filing (most likely the Jun-2026 quarter-end / Q1 FY27 BSE shareholding pattern, since the Sep-2026 quarter has not closed as of the 21-Sep-2026 "as of" date):

- Source A (choiceindia.com synthesis, retrieved 21-Sep-2026, labelled "as of July 2026" i.e. reflecting the Jun-2026 quarter-end filing): Promoter 64.75%, FII 3.93%, DII 0.01%, Mutual Fund 0.10%, Insurance 1.10%, Retail/Public 30.11%.
- Source B (retrieved 21-Sep-2026, labelled "as of 18-Sep-2026" - almost certainly still describing the Jun-2026 quarter filing carried forward, not a new Sep-2026 filing): Promoter 64.74%, FII 4.91%, DII 1.28%, Public 29.05%.

These two do not reconcile cleanly (FII 3.93% vs 4.91%; DII 0.01% vs 1.28%) - likely different bucket definitions (e.g. whether Insurance/MF sit inside or outside "DII") rather than two different real filings, since promoter % (64.74-64.75%) and total public float (~35.25-35.26%) agree closely. FLAG: UNVERIFIED, reconcile against the actual BSE shareholding-pattern XBRL filing when accessible.

NOT FOUND: Sep-2024, Dec-2024, Mar-2025, Jun-2025, Sep-2025, Dec-2025, Mar-2026 quarter-by-quarter splits. The BSE shareholding-pattern page (mstcindia.co.in/content/SHP.aspx and bseindia.com's shareholding-pattern tab) that would host the full 8-quarter run could not be fetched (egress-blocked). Trendlyne's dedicated shareholding-pattern history page (trendlyne.com/equity/share-holding/138917/MSTCLTD/...) was also blocked. A Sep-2026 filing would not be due/public until on or after 21-Oct-2026 (SEBI LODR 21-day filing window from quarter-end), so "if filed" is moot as of the "today" date of this task (21-Sep-2026) - NOT FOUND is expected/correct for that quarter regardless of access.

RECOMMENDATION: re-run this section once BSE/trendlyne access is available; the exact 8-quarter promoter/FII/DII/retail trend line is the single most useful data series for judging whether the 2023-2024 PSU rally brought in a wave of retail/FII buying that has since partially reversed.

## 13.2 Number of retail shareholders - trend

NOT FOUND. Only the retail shareholding PERCENTAGE (29.05-30.11%, see 13.1) was retrievable, not the headcount of retail shareholders that BSE/NSE shareholding-pattern filings separately disclose (folio/demat account count in the "number of shareholders" column). TradingView has a dedicated "Number of shareholders" page for MSTCLTD (tradingview.com/symbols/NSE-MSTCLTD/financials-statistics-and-ratios/number-of-shareholders/) that was surfaced by search but not fetchable in this session (WebFetch to tradingview.com not attempted before the search-budget cutoff; treat as unconfirmed).

FLAG: this is a genuine data gap on the single most direct froth indicator the task asked for. Cannot confirm or deny a "sharp rise" in retail shareholder count. Needs a direct read of the TradingView shareholders page, or the BSE/NSE shareholding pattern PDF (Table III, "No. of shareholders" column), across the 8 quarters in 13.1.

## 13.3 Mutual fund holders and marquee investors

- Aggregate mutual fund holding is tiny: 0.10% of the company (source: choiceindia.com synthesis via WebSearch, retrieved 21-Sep-2026, dated "as of July 2026"). One RupeeVest-sourced search snippet stated bluntly that "no mutual fund holding was found in this stock at the time that data was checked" - consistent with MF ownership being at or near zero/negligible.
- No specific mutual fund SCHEME NAMES, AMCs, or month-over-month add/exit data were retrievable (RupeeVest's "Stocks held by Mutual Funds" page at rupeevest.com/Mutual-Fund-Holdings/208646 was surfaced but not fetchable - egress-blocked). NOT FOUND: which AMCs (if any) hold MSTC, and their monthly portfolio-disclosure adds/trims.
- MARQUEE INVESTOR - the one concrete, dated data point found: Business Standard headline (URL fragment dated 09-Oct-2024): "ValueQuest India Moat acquires 1.17% stake in MSTC, shares skyrocket 17%." This indicates ValueQuest India Moat Fund (a well-known PMS/AIF manager) took a 1.17% stake in MSTC around 09-Oct-2024, and the stock reacted with a 17% single-day move on the news. FLAG: this is a headline-only citation; the exact acquisition date, whether via block deal or open market, and whether the stake is still held as of Jun-2026 are NOT FOUND - the 13.1 shareholding-pattern gap means we cannot confirm ValueQuest still appears in the public shareholders (>1%) list in the latest filing.

CONCLUSION: institutional/MF ownership of MSTC is structurally near-nil; the ~35% non-promoter float is overwhelmingly retail (per 13.1, DII+FII+MF+Insurance together are only ~5-6% of the register). This corroborates (does not itself prove) the "thin institutional coverage" framing used in notes-13.

## 13.4 Bulk and block deals - last 12 months (Sep-2025 to Sep-2026)

NOT FOUND for the actual last-12-month window. The only concrete bulk-deal data point surfaced was: NSE bulk deal on 25-Jul-2024, 528,020 shares traded at an average price of Rs 993.61 (source: trendlyne.com bulk/block-deals page, via WebSearch synthesis, retrieved 21-Sep-2026) - this is OUTSIDE the requested 12-month window (it is from Jul-2024, during the pre-correction rally near the ATH).

Trendlyne's dedicated bulk/block-deal page (trendlyne.com/equity/bulk-block-deals/MSTCLTD/138917/mstc-ltd/) exists and would carry the current list, but could not be fetched (egress-blocked) and search snippets did not surface any Sep-2025-to-Sep-2026 deals specifically. FLAG: absence of evidence is not evidence of absence here - this is a data-access gap, not a confirmed "no deals occurred" finding. Needs direct NSE/BSE bulk-deal / block-deal report pull for the window.

## 13.5 Offer For Sale (OFS) history, pending OFS, and Minimum Public Shareholding (MPS) status

- IPO / only OFS on record: Mar-2019. The Government of India (through Ministry of Steel) sold 17,670,400 equity shares (100% OFS structure, no fresh issue) at Rs 120/share (price band revised to Rs 120-128 before finalization; proceeds of ~Rs 211.04 crore imply a realised average close to Rs 119-120/share), equal to 25.10% of pre-offer paid-up capital. This took the Government's stake from 89.85% (pre-IPO) down to 64.85% (immediately post-listing, 29-Mar-2019). Source: multiple IPO-review pages (chittorgarh.com, business-standard.com, hdfcsec.com), via WebSearch, retrieved 21-Sep-2026.
- No further OFS has been identified since Mar-2019. Current promoter holding (64.74-64.75%, per 13.1, most recently as of the Jun-2026 quarter filing) is essentially IDENTICAL to the immediate post-IPO level of 64.85% - i.e., over more than seven years the promoter has not sold down further (small residual drift of ~0.1 pp is within rounding/ESOP-type noise, not evidence of a fresh OFS). NOT FOUND: any announced, planned, or rumoured further OFS in MSTC as of 21-Sep-2026.
- CORRECTION TO TASK PREMISE - MPS compliance: the task brief assumes "MSTC's public float is small" and asks whether an SEBI extended-deadline/exemption applies. Based on the promoter stake of ~64.74-64.75%, MSTC's PUBLIC FLOAT IS ~35.25-35.26%, which is well ABOVE the SEBI Minimum Public Shareholding threshold of 25% (SCRR Rule 19(2)(b)/19A, LODR Regulation 38). MSTC therefore appears to ALREADY COMPLY with the 25% MPS norm and does not need any extended deadline or exemption - unlike several other GoI-majority PSUs (e.g., promoter stakes above 75%) that have required such relief. FLAG: this reverses the task's framing; recommend double-checking against the actual filed shareholding pattern (13.1's access gap) before treating this as fully final, but every source retrieved is consistent on ~64.7-64.9% promoter / ~35%+ public.
- Separately, MSTC's promoter filed a SEBI disclosure "confirming no promoter equity encumbrance for FY26" (source: scanx.trade corporate-news aggregator, retrieved 21-Sep-2026) - i.e., 0% pledge on the Government's holding, for the year ended 31-Mar-2026. This is a standard PSU confirmation (the President of India cannot pledge shares) but is now dated evidence, not an assumption.
- Note (adjacent, not MSTC's own listing): the Government DID separately divest MSTC's subsidiary Ferro Scrap Nigam Ltd (FSNL) - CCEA gave in-principle approval in Oct-2016, and the strategic sale (govt approval of FSNL sale for ~Rs 320 crore, per Business Standard headline dated ~20-Sep-2024) completed around Sep-2024. This is a subsidiary-level divestment, not an OFS of MSTC's own listed shares, but it materially affected MSTC's own consolidated balance sheet/P&L around FY25 (see notes-13, section 8, on why this distorts trailing multi-year screens).

## 13.6 Surveillance - ASM / GSM history

CONFLICTING DATA - flag prominently:
- One source (trendlyne.com/equity/asm-status page, via WebSearch synthesis) states MSTC "exited Short-term ASM on 11-Nov-2019" and "has not been shortlisted under GSM" (ever) - i.e., a long clean history since a brief 2019 ASM stint.
- A separate, more recent-sounding synthesized snippet claims MSTC is "currently under ASM Stage I with a +32% movement and approximately Rs 28 crore market grip as of 03-Aug-2026."
These two cannot both be taken as settled fact from search summaries alone - the second claim, if true, would be a significant and very recent (Aug-2026) surveillance flag that materially affects trading/liquidity conditions and should be called out to the reader, but it was NOT independently corroborated by a second source in this session and the primary NSE/BSE ASM list pages were egress-blocked. FLAG: UNVERIFIED - treat the "currently under ASM Stage I, Aug-2026" claim as unconfirmed pending a direct check of the live NSE ASM list (nseindia.com/reports or the marketsmithindia.com/mstool/nseasmlist.jsp tool) or BSE's surveillance dashboard. Given the stock's 31.64% one-year price gain and 69.7% six-month gain (both per WebSearch synthesis of price-history pages, retrieved 21-Sep-2026), an ASM Stage-I short-term surveillance flag on strong momentum would not be surprising and should be checked before it is dismissed.

## 13.7 Index membership

Confirmed constituent (WebSearch synthesis of groww.in / smart-investing.in / tickertape.in, retrieved 21-Sep-2026):
- BSE CPSE index
- Nifty Smallcap 500
- BSE 1000
- Nifty Total Market
- Nifty Microcap 250 - weight 0.24% as of 15-Sep-2026 (smart-investing.in index-weightage page)

NOT FOUND / UNCONFIRMED: Nifty PSE index membership specifically. Search surfaced only a generic, unrelated 2019-dated Nifty PSE article, not a constituent list confirming or denying MSTC's presence. Given MSTC is a Ministry-of-Steel Mini Ratna PSU, Nifty PSE inclusion is plausible on eligibility grounds (the index covers listed central PSUs) but is NOT CONFIRMED here - flag as NOT FOUND rather than assumed.
NOT FOUND: MSCI Small Cap India membership, FTSE Small Cap/All-World ex-something membership. No evidence either way surfaced; these indices' constituent lists were not reachable in this session.

## 13.8 F&O / derivatives segment status

UNCONFIRMED / NOT FOUND with confidence. NSE maintains a generic derivatives-quote URL template for MSTCLTD (nseindia.com/get-quotes/derivatives?symbol=mstcltd) - but NSE serves this same URL PATTERN for essentially every listed symbol regardless of whether that symbol is actually F&O-enabled, so the mere existence of the URL is NOT proof MSTC trades in derivatives. No open-interest, lot-size, or current positioning data was found. FLAG: NOT FOUND - needs a direct check of NSE's official F&O security list (the "fo_mktlots" / "Permitted to Trade" security list) rather than inference from a quote-page URL. Given MSTC's relatively small free float (~35% of a ~7.03 crore-share company, i.e. roughly 2.5 crore shares in public hands) and its small-cap/microcap index membership rather than large/midcap, it would be more likely NOT to meet NSE's F&O eligibility criteria (which require minimum market-wide position limits and trading-value thresholds), but this is inference, not confirmation - treat as NOT FOUND.

## 13.9 Delivery percentage trend

Thin, single-point data only. One Trendlyne delivery-analysis snippet (via WebSearch synthesis) cited a delivery percentage of 52.33% for MSTC on NSE, but the exact date the 52.33% figure applies to is ambiguous in the retrieved snippet (the page itself is dated "as of 06-Feb-2026" but the 52.33% reading may be from a different, unstated day referenced within that page). NOT FOUND: any multi-period trend (e.g., weekly-average delivery %, or a comparison of delivery % during the 2024 rally peak vs. the current 2026 level, which is what would actually indicate whether current volume is more "hands-changing-for-keeps" (higher delivery %) vs. speculative churn (lower delivery %)). Needs a direct Trendlyne/NSE bhavcopy pull across dates to build the trend the task asked for.

---

## Summary of confirmed vs. unconfirmed picture

CONFIRMED, reasonably solid:
- Promoter (President of India / Ministry of Steel) stake ~64.74-64.75% as of the Jun-2026 quarter filing; effectively unchanged since the Mar-2019 IPO/OFS (64.85% immediately post-listing).
- Public float ~35.25%, comfortably above SEBI's 25% MPS minimum - MSTC does not appear to need an MPS exemption, contrary to the task's starting assumption.
- Institutional (FII+DII+MF+Insurance) ownership is very thin in aggregate (~5-6% combined across the two source snapshots), with mutual funds specifically near-zero (~0.10%).
- No pledge on promoter shares (FY26 SEBI disclosure).
- One marquee PMS/AIF buyer identified: ValueQuest India Moat Fund, ~1.17% stake, around 09-Oct-2024 (current holding status unconfirmed).
- Index membership in BSE CPSE, Nifty Smallcap 500, BSE 1000, Nifty Total Market, Nifty Microcap 250 (0.24% weight, 15-Sep-2026).

NOT FOUND / FLAGGED FOR FOLLOW-UP (primary blocker: egress proxy blocked trendlyne.com, screener.in, bseindia.com, nseindia.com, mstcindia.co.in, moneycontrol.com in this session):
- Full 8-quarter shareholding trend (only one quarter obtained, with internal source disagreement on FII/DII/MF split).
- Retail shareholder HEADCOUNT trend (the actual froth indicator requested).
- Named mutual fund holders and their monthly adds/exits.
- Bulk/block deals within the actual last-12-month window.
- Whether a "currently in ASM Stage I (Aug-2026)" claim is real or a stale/mis-synthesized artifact.
- Nifty PSE, MSCI, FTSE index membership.
- Confirmed F&O eligibility/inclusion and any positioning data.
- A genuine multi-period delivery-percentage trend.
