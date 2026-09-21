# MSTC Limited deep dive - working notes

Report: `mstcltd-deep-dive-21-sep-2026.html` (single self-contained file, two themes, 20 sections plus executive summary and sources).
Company: MSTC Limited, NSE MSTCLTD, BSE 542597. Latest reported quarter Q1 FY27 (Jun-2026). Written 21-Sep-2026.

## How this was built
- `notes-00-market-data.md` - lead analyst's own pull from the market data service (prices, annual and quarterly financials, cash flow, peer snapshot, dated news wire).
- `notes-01` to `notes-13` - five parallel research streams (financials and forensics, governance and guidance, industry/peers/macro, business model and mandates, shareholding and valuation).
- `build/` - the report assembled in thirteen fragments; concatenate in filename order to regenerate the HTML.

Regenerate:
```
cat build/01-head.html build/02-css2.html build/03-hero.html build/04-s1-s2.html \
    build/05-s3-s4.html build/06-s5-s6.html build/07-s7-s8.html build/08-s9-s11.html \
    build/09-s12-s13.html build/10-s14.html build/11-s15-s16.html build/12-s17-s18.html \
    build/13-s19-s20-src.html > mstcltd-deep-dive-21-sep-2026.html
```
Validator: `python3 <skill>/scripts/validate.py mstcltd-deep-dive-21-sep-2026.html` - passes 0 FAIL, 0 WARN.
Rendering checked in headless Chromium: glass and terminal themes at 1200-1400px, and at 500px (Chromium's minimum headless viewport). Page scroll width equals viewport at 500px; wide tables scroll inside their wrappers rather than blowing out the page.

## THE BINDING CONSTRAINT ON THIS REPORT
The research environment's network egress policy refused every primary source on 21-Sep-2026: both exchanges, mstcindia.co.in, pib.gov.in, dipam.gov.in, cag.gov.in, screener.in, trendlyne.com, moneycontrol.com and about twenty-five other domains. The session's web-search allowance (200 calls) was also exhausted during the fan-out.
No annual report, filing, transcript, rating document or shareholding filing was opened directly. Everything is second hand. The report states this in the executive summary and itemises every unverified claim in the source list.

## Conclusions the report reaches
- Realised take rate, back-solved because MSTC does not publish one: 31.3 bps (FY25), 41.4 bps (FY26), 37.6 bps (Q1 FY27).
- FY26's 18.9% revenue growth came with an 11.2% FALL in transacted value. The growth was mix (record 212 mineral block auctions against a ~90/yr run rate), not share or pricing power.
- Cash and investments (~Rs 1,148-1,360 cr) are almost exactly offset by non-debt liabilities (~Rs 1,073-1,216 cr). The balance sheet cash is largely bidders' earnest money, so the "net cash" a screen reports is not shareholders' money.
- Reverse DCF: at 14% cost of equity and ~Rs 155 cr of steady-state operating free cash flow, the price implies ~9.8-10.6% perpetual growth, equivalently ~17.7-21.0% for a decade then 4%. That means transacted value reaching Rs 4.0-5.4 lakh cr, which is GeM's entire current scale.
- Sum of the parts identifies Rs 4,628 cr (Rs 657/share). The market pays Rs 5,126 cr. The Rs 498 cr gap is what it pays for an undisclosed 50:50 JV while assigning zero cost to Rs 1,517 cr of contingent liabilities.
- Scenarios: bear Rs 430 (30%), base Rs 760 (45%), bull Rs 1,180 (25%). Weighted Rs 766. No rating given anywhere.
- Earnings quality 4/10, explicitly provisional. Guidance credibility ratio not computable, and that absence is the finding.

## Original cross-checks made in this pass (not in any source)
1. FY26 financing cash outflow of Rs 53.50 cr equals Rs 7.60 x 7.04 cr shares to the rupee. Confirms the share count, confirms only the interim dividend was paid in cash during FY26, and confirms no buyback, no equity raise, no debt repayment.
2. FY25 dividends of Rs 45.50/share x 7.04 cr = Rs 320.3 cr against FSNL disposal proceeds of Rs 320 cr. The windfall was distributed.
3. The "9:1 bonus in Aug-2025" claim circulating in search summaries is FALSE. The unadjusted monthly series runs Rs 478.05 (end-Jul-2025) to Rs 451.25 (end-Aug-2025) with no discontinuity.
4. The FY26 revenue conflict (Rs 369.66 cr vs Rs 453.04 cr) is not a conflict: revenue from operations vs total income, difference Rs 83.38 cr of other income.
5. The all-time-high conflict (Rs 1,107.45 vs Rs 1,165) is closing high vs intraday high, both correct.
6. The market data service's quarterly series for MSTC is partly corrupt: its March-2024 quarter row is byte-identical to its FY24 annual row, and the FY25 quarters sum to Rs 431 cr against an annual Rs 311 cr. Only Apr-2025 onward reconciles.
7. MSTC's own EBITDA definition includes other income. Q1 FY27: company Rs 81.49 cr vs operating Rs 57.73 cr. Its stated EBITDA margin is ~35% better than a like-for-like operating margin.

## Highest-value follow-ups, in order, for a session with primary-source access
1. The earnest money deposit liability line, any year. It is the single number the valuation turns on.
2. The FY26 cash flow statement. Operating cash flow was 23% of profit after tax and nothing public explains it.
3. The associates and joint ventures note: CERO's revenue, profit and MSTC's equity share for FY24-FY26.
4. The other-income note, decomposed.
5. The FY25 exceptional items note, to settle the disposal gain (Rs 263.19 / 273.54 / 301.69 cr in different sources).
6. The revenue recognition accounting policy for FY18 through FY26 side by side, to settle the gross-to-net question.
7. Contingent liabilities over multiple years, to establish the trend and itemise the unexplained ~Rs 430 cr.
8. The whole of Section 10 (scuttlebutt), which could not be researched at all.
9. Eight-quarter shareholding pattern and retail shareholder headcount.
10. Current surveillance (ASM) status, which two sources contradict.

## Additions proposed for the skill's known-traps file
- A market data service can present an ANNUAL row as a QUARTERLY one. Always test that the quarters sum to the year before using any quarterly series. (MSTC, Sep-2026.)
- For a platform holding customer float, cash and non-debt liabilities nearly cancel. Check that identity before netting cash off market capitalisation. (MSTC, Sep-2026.)
- A company's own EBITDA definition may include other income. Reconcile it against an independent operating EBITDA before comparing margins with peers. (MSTC, Sep-2026.)
