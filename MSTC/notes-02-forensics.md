# MSTC Limited - Forensic Accounting Notes
Compiled 21-Sep-2026. See notes-01-financials.md for the full methodology caveat: ALL data in this file
comes from WebSearch summaries of secondary sources, not directly-fetched primary filings, because
WebFetch was blocked for every relevant domain (bseindia.com, mstcindia.co.in, cag.gov.in, screener.in,
careratings.com, icra.in, acuite.in, casemine.com, indiankanoon.org, moneylife.in, etc. all returned
EGRESS_BLOCKED). Treat every figure below as needing primary-source confirmation.

## 1. Other income as % of PBT, and decomposition

- Could NOT compute a reliable "other income as % of PBT" series for any year. The clearest qualitative
  signal is CARE Ratings' own framing: MSTC's ratings "draw strength from... high profitability margins
  in FY24 and 9MFY25" attributed substantially to the e-commerce/service-income and treasury base rather
  than the trading segment, which is itself consistent with the task brief's thesis that non-operating/
  treasury income is large relative to the core operating base, but no clean numeric decomposition
  (interest on deposits / interest on IT refunds / provision write-backs / MTM / JV dividend) was found.
- One data point returned by a financial-data aggregator (via WebSearch, not directly verified) shows
  "other income/expenses" of Rs 3.29B (~Rs 329 cr) for the quarter ended Dec-2024, versus Rs 865.10 million
  (~Rs 86.5 cr) for the comparative Dec-2023 quarter. Rs 329 cr of "other income" in a single quarter is
  larger than MSTC's ENTIRE quarterly revenue from operations in every quarter in this dataset (which
  range roughly Rs 77-119 cr) and is judged likely to be a data-classification artifact - i.e. the
  aggregator has probably bucketed the FSNL sale exceptional gain (reported elsewhere as Rs 263-302 cr,
  itself inconsistent - see notes-01) into "other income" rather than treating it as a separate
  exceptional/non-recurring line. This actually reinforces the task brief's underlying concern (that
  "other income" swamps operating income) but the exact number should NOT be taken at face value without
  checking how the aggregator versus the company itself classifies the FSNL gain in the P&L.
- Line-item decomposition of other income (interest on deposits, interest on income-tax refunds, provision
  write-backs, MTM, JV dividend from Mahindra CERO): NOT FOUND for any year. This requires the Notes to
  Accounts of the audited financial statements, which could not be accessed. MAJOR GAP.

## 2. Cash yield check

- Could not be computed. Would require (a) a clean interest-income figure isolated from other other-income
  components, and (b) an average cash+investments balance for the year - neither reliably in hand (see
  notes-01 Section 4 for the conflicting cash/investment figures: ~Rs 1,148 cr around FY24 vs ~Rs 1,360 cr
  "most recent").
- EMD float question (does MSTC earn interest on customer EMD money it holds, and keep that interest?):
  NOT ANSERED from any source found. This is exactly the kind of question the annual report's accounting
  policy note on "Trust and Retention" or "Client Money" (if any) or the EMD-related liability note would
  answer, and none of that text was accessible. Flag as a HIGH-VALUE follow-up question: if MSTC keeps the
  float income, its "other income" is partly a function of scale of auction activity (float) rather than
  MSTC's own capital productivity, and any ROCE/ROE calc that doesn't strip this out will overstate
  MSTC's true return on its own shareholders' capital.

## 3. Legacy trade receivables - gross, provisions, aging, write-backs, litigation

This is the best-populated section of the forensic notes, though still incomplete.

**Pre-IPO history (context for the "~Rs 1,700+ cr" figure in the task brief):**
- As of 30-Sep-2018 (H1 FY19), MSTC's outstanding gross debtors were reported at Rs 3,188 crore, with
  Rs 129 crore of NEW provisions for doubtful debts booked in that half-year alone (source: IPO-era
  analyst commentary surfaced via WebSearch, referencing the Red Herring Prospectus dated 6-Mar-2019).
- Management is quoted (via secondary sources) as having "opted for cleaning of its balance sheet before
  IPO," with "aggressive write-offs of its FY11 and FY12 transactions" completed ahead of the March 2019
  listing, and provisioning described as "almost over" by IPO time.
- MSTC discontinued its "cash and carry" trading business from FY2019-20, which is consistent with the
  task brief's description of MSTC winding down the legacy trading business after large bad debts.
- A formal provisioning policy was instituted "from the last quarter of December 2019" (i.e. Q3 FY20),
  applying a staggered, conservative approach to legacy receivables going forward.
- The task brief's specific "~Rs 1,700+ crore" cumulative write-off/provision figure could NOT be
  independently confirmed in this session. The closest corroborating evidence is the Rs 3,188 crore
  gross pre-IPO debtor base with heavy (if imprecisely quantified) provisioning - a cumulative write-off
  in the Rs 1,700+ cr range is PLAUSIBLE against that base but is NOT VERIFIED. Mark explicitly as
  NOT FOUND / not independently confirmed - do not present the Rs 1,700+ cr figure as sourced in this
  session; it should be checked against the FY18-FY20 annual report P&L "Bad debts written off" and
  "Provision for doubtful debts" lines directly.

**Post-IPO / recent trend:**
- Trade receivables reported at Rs 407 crore as of 31-Mar-2022, declining to Rs 333 crore (exact later
  date unclear from the search snippet - plausibly FY23 or FY24).
- A separately-sourced (and separately-dated, likely older, circa FY20-21 investor call) reference cites
  "standalone balance sheet receivables of around 723 crores," of which e-commerce/marketing receivables
  were characterised as mostly low-risk ("110% bank guarantee kind of agreements" backing most of the
  balance), with only ~Rs 50 crore considered genuinely risky at that time, said to have come down from
  ~Rs 100 crore previously. These two receivables data points (Rs 333-407 cr vs Rs 723 cr) sit on
  different, unreconciled timelines and should not be treated as one continuous series.
- CARE Ratings' rationale (referencing FY24/9M-FY25 data) STILL names "elongated average collection
  period due to long-due receivables mainly from the trading business" as an active rating constraint -
  i.e. as of the most recent CARE commentary found, the legacy trading-business receivables issue is
  characterized as ONGOING, not fully resolved, years after the IPO-era cleanup and the FY2019-20
  provisioning-policy formalization. This is an important, moderately high-confidence finding (corroborated
  by a credit-rating agency, a relatively reliable source type) that directly answers the task brief's
  question: the legacy receivables issue appears NOT fully resolved as of the latest available rating
  commentary, though its scale relative to FY18-20 has clearly shrunk.
- No specific write-back or recovery of legacy provisions was identified in any year searched. NOT FOUND.

**Concast Steel & Power Limited (CAG-flagged legacy exposure):**
- CAG Audit Report No. 14 of 2021 (Union Government Commercial), on MSTC/Ministry of Steel PSUs, found
  that MSTC's decision to extend financial assistance to Concast Steel & Power Limited under a
  "facilitator mode" arrangement was "imprudent" and resulted in NON-RECOVERY of dues of Rs 220.84 crore
  as of February 2021. This is a CAG-sourced, specific, quantified adverse finding directly matching the
  task brief's instruction to search for CAG comments on MSTC.
- Concast Steel & Power Limited is separately reported to be under liquidation (NCLT/NCLAT proceedings
  referenced via case-law search, full text not accessible). Litigation between MSTC (as a
  creditor/claimant) and Concast's liquidator has been heard at the NCLAT (role of the Interim Resolution
  Professional under Section 18 of the IBC was the specific point of law referenced - content not fully
  extracted).
- Separately, Concast's promoter Sanjay Sureka is named (via a Moneylife headline, full article not
  fetchable) in a ~Rs 6,210 crore bank fraud case, with the Enforcement Directorate attaching ~Rs 133
  crore of his assets. This is context on the counterparty's broader credibility, not a direct MSTC
  financial figure, but reinforces the CAG finding that this Rs 220.84 cr exposure was a poor credit
  decision.
- RECOVERY STATUS: no evidence of any recovery or write-back of the Rs 220.84 crore Concast exposure was
  found in this session. Should be checked against MSTC's FY25/FY26 contingent-liability and
  receivables-provision notes directly - HIGH PRIORITY.

**Standard Chartered Bank / Indian Overseas Bank litigation (a separate, sizeable, contingent item):**
- Multiple case-law index entries (Indian Kanoon, Casemine) confirm protracted litigation, spanning at
  least Bombay High Court and the Debts Recovery Appellate Tribunal (DRAT), across 2019-2023, titled
  "MSTC Limited v. Standard Chartered Bank" (and related IOB proceedings).
- One case summary states the Debts Recovery Tribunal (DRT) directed MSTC to pay Rs 222,51,00,000
  (Rs 222.51 crore), on the basis of what the DRT treated as an "admission" of liability contained in
  MSTC's OWN balance sheet notes. This is a notable and unusual forensic point: if accurate, a disclosure
  MSTC itself made (presumably a contingent-liability or similar note) was used as evidentiary ammunition
  against it in litigation - a cautionary example of how disclosure language can be read as an admission,
  and worth a specific callout in the final report as a governance/disclosure-drafting risk, independent
  of whether MSTC ultimately prevails on appeal.
- The most recent credit-rating commentary (Acuite, rationale dated 30-Jan-2025) frames the SAME general
  dispute (Standard Chartered Bank AND Indian Overseas Bank) as an ongoing litigation risk of
  approximately Rs 143.62 crore. The Rs 222.51 cr DRT figure and the Rs 143.62 cr rating-agency figure
  are NOT reconciled in this session - they may reflect different stages of appeal, a partial
  settlement/adjustment, or different scope (SCB alone vs SCB+IOB combined, or principal vs total claim).
  Do not add these two figures together; treat as the same dispute viewed at two different points/bases
  until confirmed otherwise from the actual court orders or the annual report's contingent-liability note.
- CURRENT STATUS / final outcome: NOT DETERMINED in this session.

## 4. Contingent liabilities as % of net worth and trend

- ICRA rating rationale (dated 15-Jan-2026, referencing 31-Mar-2025 data) states contingent liabilities of
  approximately Rs 1,517 crore as on 31-Mar-2025, of which approximately Rs 943 crore relates to disputed
  tax claims - i.e. tax disputes are the single largest component, not the SCB/IOB litigation or the
  Concast exposure.
- Against the (uncertain, see notes-01) net-worth figure of roughly Rs 738-904 crore depending on which
  source/date is used, Rs 1,517 crore of contingent liabilities represents somewhere between ~168% and
  ~206% of net worth - i.e. contingent liabilities EXCEED total net worth on any reading of the data
  found. This is a materially significant forensic finding and should be highlighted prominently in the
  final report, even though the exact net-worth denominator carries its own uncertainty (see notes-01
  Section 4).
- Trend over time: NOT FOUND - only the single 31-Mar-2025 data point was located; a multi-year
  contingent-liability trend (to see whether Rs 1,517 cr is rising or falling) was not obtained before the
  search budget was exhausted.
- Main named items: disputed tax claims (~Rs 943 cr, the largest single component), and the SCB/IOB
  litigation (~Rs 143.62 cr per Acuite, though as noted this may not be fully additive with the Rs 222.51
  cr DRT figure found separately). The remaining balance of contingent liabilities (Rs 1,517 cr less the
  ~Rs 943 cr tax and ~Rs 143.62 cr SCB/IOB items = roughly Rs 430 cr) is UNEXPLAINED / NOT ITEMIZED in
  the sources found - could include bank guarantees issued, other pending litigation (including any
  residual Concast-related claims), and EMD-related contingent claims. NOT FOUND at item level.

## 5. Effective tax rate vs statutory rate

- Not independently computed with confidence. One indirect data point: FY26 PBT before exceptional items
  grew 22.84% YoY to Rs 295.69 crore while PAT fell ~45-46% YoY due to the FY25 exceptional gain dropping
  out - this does not by itself give an effective tax rate since the "before exceptional items" PBT figure
  was not paired with a matching "before exceptional items" tax and PAT figure in the sources found.
- Statutory rate comparison: India's standard corporate tax rate for a domestic company (non-concessional
  regime) is 25-30% depending on turnover/regime election; MSTC's specific regime election and effective
  rate were NOT FOUND in this session. NOT FOUND - flag as needing the tax-reconciliation note in the
  annual report.

## 6. Related party transactions

- Mahindra MSTC Recycling Private Limited ("MMRPL," operating brand CERO) - a 50:50 joint venture between
  MSTC and Mahindra Accelo Limited (part of the Mahindra Group), incorporated 16-Dec-2016. Described as
  India's first authorized/organized end-of-life-vehicle recycling facility (Greater Noida), with
  subsequent expansion (a Maharashtra state government MoU for additional scrapping centres was found).
  No investment amount, carrying value, or MSTC's share of MMRPL's profit/loss was found in this session -
  NOT FOUND. This should appear in MSTC's Investments-in-Associates/JV note and the related-party
  transactions note in the annual report.
- Ferro Scrap Nigam Limited (FSNL) was a 100%-owned subsidiary and therefore a related party for all
  periods up to the completion of its divestment (SPA signed 24-Oct-2024 with Konoike Transport Co. Ltd,
  Japan, at a consideration of Rs 320 crore against an independently-assessed reserve price of Rs 262
  crore - both figures corroborated across PIB/press coverage found via search). Nature and scale of
  intercompany transactions with FSNL pre-divestment (e.g. any management fees, guarantees, loans):
  NOT FOUND.
- Broader related-party universe: as a Government of India Mini-Ratna Category-I PSU under the Ministry
  of Steel, MSTC would ordinarily claim the Ind AS 24 exemption from disclosing transactions with other
  government-related entities (other PSUs, government departments) individually, disclosing only
  significant transactions and relationships in aggregate - this is standard PSU practice and NOT
  something specific to MSTC that was separately confirmed, but should be assumed absent evidence
  otherwise. MSTC's customer base is described (via its own "about" page content, surfaced through
  search) as spanning PSUs (NTPC, IOCL, SAIL group plants), central/state government departments, and
  private clients (Reliance, Tata Power named as examples) - these are counterparties/customers, not
  necessarily "related parties" in the strict accounting sense unless they meet control/significant-
  influence/KMP tests.
- Key Managerial Personnel (KMP) remuneration, and any transactions with KMP or their relatives:
  NOT FOUND - would require the annual report's related-party note directly.

## 7. Auditor, CAG audit, qualifications

- Statutory auditor for FY 2026-27: M/s Mookherjee Biswas & Pathak, Chartered Accountants, appointed via
  a letter from the Comptroller & Auditor General of India dated 8-Sep-2026. As a Government company,
  MSTC's statutory auditor is appointed by the CAG under Section 139(5) of the Companies Act, 2013 (not
  by shareholders in the ordinary AGM sense) - this is standard PSU practice, confirmed here for MSTC
  specifically by the appointment letter reference found.
- Prior-year statutory auditor identity/tenure (i.e. was Mookherjee Biswas & Pathak newly appointed for
  FY27 or continuing?) - NOT FOUND; auditor rotation history NOT FOUND.
- CARO 2020 clause-wise findings for MSTC: NOT FOUND - no MSTC-specific CARO annexure content was
  retrieved in this session (search returned only generic explanations of what CARO 2020 requires).
- Emphasis of Matter / qualified opinion in any year's audit report: NOT FOUND - no MSTC-specific
  auditor's-report language was retrieved.
- CAG SUPPLEMENTARY AUDIT comments specific to MSTC: the clearest and most useful finding in this entire
  file is CAG Report No. 14 of 2021's Concast Steel & Power Limited finding (Section 3 above) - an
  explicit, named, quantified (Rs 220.84 crore) adverse finding describing an MSTC management decision as
  "imprudent." This is exactly the kind of CAG finding the task brief anticipated ("often damning") and
  should be featured prominently in the final report.
  A second CAG report was located - Report No. 20 of 2016, "Audit of e-Auction of Coal Mines" - covering
  the Ministry of Coal's e-auction process in which MSTC acted as the auction service provider alongside
  Coal Controller's Organisation and CMPDIL. The search-retrieved summary describes this as a broadly
  constructive assessment ("an improvement over the earlier system," incorporating "objectivity,
  transparency and fairness") with unspecified "systemic and procedural issues... highlighted... for
  further improvement" - no MSTC-specific adverse quantified finding was extracted from this report in
  this session (the report itself, a large PDF, could not be fetched - cag.gov.in blocked). This should
  be revisited if a primary-source read becomes possible, since CAG coal-e-auction reports have
  historically contained pointed process criticisms.
  No other CAG reports referencing MSTC were identified in this session; a full CAG report inventory
  search (by year) was not completed before the search budget was exhausted. HIGH-PRIORITY FOLLOW-UP:
  search cag.gov.in's audit-report index directly for "MSTC" across all available years once network
  access allows it.

## 8. SEBI/exchange action, accounting policy change, restatement

- No SEBI enforcement action, exchange penalty, or formal restatement of MSTC's financial statements was
  identified in this session. Absence of evidence is not evidence of absence here, given how limited the
  search coverage was - NOT FOUND rather than "confirmed clean."
- Revenue recognition policy (gross vs net / principal vs agent) change flagged by the task brief: NOT
  CONFIRMED either way. Searches for MSTC's specific Ind AS 115 treatment and any restatement of revenue
  from operations (moving from gross trading-value recognition to net commission/service-fee recognition,
  which would be the expected direction for an e-auction intermediary migrating away from principal-model
  trading) returned no MSTC-specific numeric evidence. It is worth noting that the DECLINE in "Revenue
  from Operations" alongside GROWTH in e-commerce "service income" (CARE's FY24 commentary: TOI down ~3%
  even as service income from e-commerce grew) is CONSISTENT WITH, but does not prove, such a
  gross-to-net revenue recognition shift compounding with the genuine wind-down of the trading business -
  both effects could be present simultaneously and were not separable with the data found. This is
  exactly the kind of ambiguity the task brief asked to be investigated carefully, and it remains
  UNRESOLVED - the annual report's "Significant Accounting Policies" note (Revenue Recognition) for each
  of FY18 through FY26, read side by side, is the only way to settle this.
- The IPO-era Restated Financial Statements document (referenced as "RESTATED FINANCIAL.pdf" on
  mstcindia.co.in, part of the 2019 prospectus) is the natural starting point for understanding any
  pre-IPO restatement, but could not be fetched (domain blocked).

## 9. Earnings quality score

**Score: 3 out of 10** (low confidence in the underlying data itself lowers how much weight this score
should carry - see caveat below).

Justification:
- (-) Reported PAT across the FY25/FY26 comparison is dominated by a large, one-off, non-operating gain
  (FSNL sale, reported variously as Rs 263-302 crore) that inflates FY25 and depresses the reported YoY
  change in FY26; a reader relying on headline PAT alone would badly mis-read the trend. The company's
  own "PBT before exceptional items +22.84% YoY" disclosure is the more honest number, which is itself a
  small positive for transparency, but the headline PAT swings remain a real earnings-quality problem for
  anyone not reading the fine print.
- (-) "Other income" appears to be large relative to core operating income in at least some periods (see
  Section 1), though a clean decomposition could not be obtained - the uncertainty itself is a quality
  flag (a company whose earnings composition cannot be readily decomposed from public disclosure summaries
  scores lower, independent of what the true composition turns out to be).
- (-) Legacy receivables / collection-period issues are described by an independent credit-rating agency
  as STILL ONGOING as of the most recent commentary found, years after the widely-publicized IPO-era
  cleanup - suggesting the underlying trading-business credit risk was reduced but not eliminated, and
  that reported profits over the intervening years absorbed real (if now smaller) bad-debt costs.
- (-) Contingent liabilities (~Rs 1,517 cr) exceeding net worth on every reading of the (admittedly
  uncertain) net-worth figures found is a significant off-balance-sheet risk overhang not reflected in
  reported earnings at all.
- (-) A CAG report contains an explicit, named "imprudent decision" finding with a specific unrecovered
  amount (Rs 220.84 cr, Concast) - direct evidence of at least one clearly poor capital-allocation
  decision by management that flowed through as an eventual bad-debt/provision cost.
- (-) A litigation matter in which MSTC's OWN balance-sheet disclosure was reportedly used against it as
  an "admission" of liability suggests either aggressive/careless disclosure drafting historically, or an
  unfavourable legal environment for PSU disclosure generally - either way, a governance-quality concern
  worth flagging.
- (+) The company does appear to be cash-generative at the operating level (large cash/investment balance,
  regular and recently substantial dividends, low reported borrowings/gearing per CARE at 0.22-0.24x) -
  there is no evidence found of financial distress or liquidity stress.
- (+) FY26's underlying PBT growth (ex-exceptional items, +22.84% YoY) suggests the core e-commerce/
  service-income business is genuinely growing, not just being propped up by treasury income or one-offs.
- CAVEAT ON THE SCORE ITSELF: because almost none of the underlying figures in this file were verified
  against a primary source, this 3/10 score should be treated as a PRELIMINARY, DIRECTIONAL read based on
  the pattern of qualitative red flags found (large one-off gains dominating headline PAT, unresolved
  legacy receivables per a rating agency, contingent liabilities exceeding net worth, a CAG adverse
  finding, and a disclosure-used-as-admission litigation history) rather than a fully quantified forensic
  score. It should be revisited once the actual FY22-FY26 P&L, cash flow, and Notes to Accounts are
  available - the true score could reasonably move a couple of points in either direction with that data.

---

## Summary of biggest gaps in this file
1. No line-item decomposition of "other income" for any year (interest on deposits vs IT refund interest
   vs provision write-backs vs MTM vs JV dividend) - NOT FOUND.
2. Whether MSTC earns and keeps interest on customer EMD float - NOT ANSWERED.
3. Whether MSTC changed its revenue-recognition policy (gross-to-net / principal-to-agent) for e-commerce
   income, and when - UNRESOLVED, only circumstantial evidence found.
4. Current resolution status of both the Concast Steel (Rs 220.84 cr, CAG-flagged) and the SCB/IOB
   litigation (Rs 143.62-222.51 cr, two unreconciled figures) exposures - NOT DETERMINED.
5. Full itemization of the ~Rs 1,517 cr contingent liabilities beyond the two largest named components
   (tax ~Rs 943 cr, SCB/IOB ~Rs 143.62 cr) - roughly Rs 430 cr unexplained.
6. No CARO annexure content, no Emphasis-of-Matter/qualification text, and no auditor tenure history for
   any year - NOT FOUND.
7. A broader CAG report search (beyond the two reports found) was not completed due to exhausted search
   budget - HIGH PRIORITY to re-run.
8. The task brief's specific "~Rs 1,700+ crore" legacy write-off figure could not be independently
   confirmed - treat as unverified pending direct annual report review.
