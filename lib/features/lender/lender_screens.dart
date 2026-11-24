import '../../core/spec/screen_spec.dart';
import '../../core/spec/spec_dsl.dart';

/// Figma section "04 Lender Experience" (LND-xx).
///
/// Imported: LND-01 ... LND-03, LND-05 ... LND-18.
/// LND-04 (lending marketplace) is a route frame that is not imported yet;
/// see `lib/app/pending_figma_screens.dart`.
List<ScreenSpec> lenderScreens() => <ScreenSpec>[
      S('LND-01', 'Hello, Naledi', 'Naledi Lender Demo · separate eligible lender persona', [
        sec('Available to lend', [
          badge('Sample funds only'),
          h('Available to lend'),
          amt('R 8,000.00'),
          row('Committed, not disbursed', 'R 2,000.00'),
          row('Outstanding principal', 'R 6,000.00'),
        ]),
        sec('Repayments in view', [
          row('Received principal to date', 'R 3,000.00'),
          row('Realized interest', 'R 90.00'),
          row('Overdue principal subset', 'R 500.00'),
          p('Overdue R 500 is included in outstanding R 6,000, not an additional asset. Fees and capital loss are separate.'),
        ]),
        sec('Your next steps', [
          btn('Explore marketplace', 'primary', to: 'LND-04'),
          btn('View commitments', 'secondary', to: 'LND-09'),
        ]),
        sec('Lend informed', [
          p('Your capital is at risk. Expected interest is not earned income until received. No guaranteed returns or real funds in this demo.'),
          btn('Performance & methodology', 'secondary', to: 'LND-15'),
        ]),
      ]),
      S('LND-02', 'Set up lending access', 'Naledi Lender Demo · separate setup scenario', [
        sec('Lender-specific checklist', [
          row('Contact possession', 'Confirmed · sample'),
          row('Identity / liveness', 'Complete · sample'),
          row('Bank ownership', 'Complete · sample'),
          row('Source of funds review', 'Complete · sample'),
          row('Lender eligibility', 'Eligible · scenario'),
        ]),
        sec('Funding destination', [
          field('Own bank account', 'Demo Bank •••• 4021'),
          field('Source of funds', 'Employment savings  ⌄'),
          p('Synthetic masked details only. Provider token would be stored, not bank credentials. No live integration.'),
        ]),
        sec('Before you continue', [
          p('Eligibility is not credit-risk approval of any borrower. Acknowledgement alone does not move money.'),
          chk('☐ I understand capital may be lost and repayments may be late.'),
          chk('☐ I have reviewed charges and the proposed lending model.'),
          chk('☐ I authorize only the separately reviewed funding instruction.'),
        ]),
        sec('Actions', [
          btn('Review lending preferences', 'primary', to: 'LND-03'),
          btn('Read risk disclosure', 'secondary', to: 'LND-06'),
        ]),
      ]),
      S('LND-03', 'Your lending preferences', 'Discovery settings · not approved policy limits', [
        sec('Configure your discovery', [
          field('Example amount range', 'R 500–R 5,000'),
          field('Preferred term', '2–4 months  ⌄'),
          field('Relative risk bands', 'A and B  ⌄'),
          p('Configurable example ranges only. They are not approved lending limits or a recommendation.'),
        ]),
        sec('Diversification reminder', [
          p('Your reminder is not a platform cap. Spreading exposure does not eliminate default risk.'),
          field('Personal reminder per request', 'R 2,000.00'),
          field('Show concentration warning', 'On  ⌄'),
        ]),
        sec('You decide each time', [
          p('No automatic commitments. Review every offer’s amount, term, fees, expiry and conditions before confirming.'),
        ]),
        sec('Actions', [
          btn('Save preferences', 'primary', to: 'LND-04'),
        ]),
      ]),
      S('LND-05', 'Course materials', 'MP-301 · authorized, privacy-safe request view', [
        sec('Request overview', [
          badge('2 months · reviewed sample'),
          h('Request overview'),
          amt('R 2,000.00'),
          row('Purpose', 'Course materials'),
          row('Flat interest / month', '1% indicative'),
          row('Indicative interest', 'R 40.00'),
        ]),
        sec('Relative risk · A', [
          p('Synthetic debt payments are 18% of net income. No missed repayments in the sample record. Reviewed is not risk-free.'),
          p('Based on permitted affordability and repayment indicators, not protected traits. No guarantee of repayment.'),
        ]),
        sec('Funding progress', [
          p('Commitments are not disbursed funds. Funding can fail or be delayed.'),
          prog(0.45),
          row('Confirmed commitments', 'R 1,000.00'),
          row('Still needed', 'R 1,000.00'),
        ]),
        sec('What you may see', [
          row('Borrower alias', 'Borrower MP-301'),
          row('Financial assessment', 'Reviewed · sample'),
          row('Private evidence', 'Not disclosed'),
          btn('Review lending risks', 'primary', to: 'LND-06'),
        ]),
      ]),
      S('LND-06', 'Know the lending risks', 'Read before you make an offer · proposed model', [
        sec('Capital is at risk', [
          badge('No guaranteed return', 'warn'),
          h('Capital is at risk'),
          p('A borrower may pay late, pay partly or default. You may lose some or all of the amount you lend. Risk bands are relative indicators, not insurance.'),
        ], tone: 'warn'),
        sec('Expected is not realized', [
          p('MP-301 indicative interest R 40 assumes full on-time repayment of R 2,000 over 2 months at 1% flat/month. Interest is uncertain, not guaranteed.'),
        ]),
        sec('Charges & access to funds', [
          row('Sample lender fee', 'R 0.00'),
          row('Example withdrawal fee', 'R 0.00'),
          row('Capital availability', 'After receipt / release'),
          p('Example charges only. Actual approved charges and timing must be shown before a live commitment; no instant liquidity promise.'),
        ]),
        sec('Acknowledge, then review', [
          p('Acknowledging risk is not an instruction to fund a loan.'),
          chk('☐ I can bear capital loss and delayed repayment.'),
          chk('☐ I understand the indicative return and sample charges.'),
        ]),
        sec('Actions', [
          btn('Continue to offer draft', 'primary', to: 'LND-07'),
          btn('Return to marketplace', 'secondary', to: 'LND-04'),
        ]),
      ]),
      S('LND-07', 'Make a considered offer', 'MP-301 · proposed offer model · draft OF-301-N', [
        sec('Set offer terms', [
          field('Amount to lend', 'R 1,000.00'),
          field('Flat interest / month', '1.00%'),
          field('Term', '2 months  ⌄'),
          field('Expiry · SAST', '23 Oct 2026 · 17:00'),
          field('Conditions', 'Subject to agreement & funding'),
        ]),
        sec('Illustrative lender cash flow', [
          row('Principal', 'R 1,000.00'),
          row('Interest: 1% × 2', 'R 20.00'),
          row('Sample lender charge', 'R 0.00'),
          row('Expected principal + interest', 'R 1,020.00'),
          p('Two expected receipts of R 510; not guaranteed. Borrower charges are disclosed separately in full request terms.'),
        ]),
        sec('Proposed revocability', [
          p('Offer may be withdrawn while available and not accepted. Acceptance locks withdrawal pending agreement and commitment checks. Final contractual rules require validation.'),
        ]),
        sec('Confirm submission?', [
          p('This submits OF-301-N, not a completed transfer. Available funds are rechecked before commitment. Confirmation is auditable.'),
          chk('☐ I reviewed terms, expiry, risk and charges.'),
          btn('Confirm sample offer', 'primary', to: 'LND-08'),
          btn('Save draft instead', 'secondary', to: 'LND-08'),
        ]),
      ]),
      S('LND-08', 'Your offers', 'Independent sample offers · proposed state model', [
        sec('Filter by status', [
          row('OF-301-D · draft', 'Continue editing'),
          row('OF-301-N · submitted', 'Review pending'),
          row('OF-302-N · available', 'Withdraw review'),
          field('View', 'All offers  ⌄'),
        ]),
        sec('Accepted example', [
          badge('OF-303-N · accepted'),
          h('Accepted example'),
          p('Acceptance is not funding. Continue to commitment review.'),
          row('Amount', 'R 2,000.00'),
          row('Accepted', '20 Oct 2026'),
          btn('View commitments', 'primary', to: 'LND-09'),
        ]),
        sec('Closed offers', [
          row('OF-DEMO-11', 'Declined'),
          row('OF-DEMO-12', 'Withdrawn'),
          row('OF-DEMO-13', 'Expired'),
          p('Separate records illustrate status coverage; no contradictory state is assigned to the same offer.'),
        ]),
        sec('Withdraw available offer?', [
          p('Withdraw OF-302-N before acceptance. It will no longer be selectable; a concurrent acceptance may block this action.'),
          btn('Review withdrawal', 'secondary', to: 'ST-C04'),
        ]),
      ]),
      S('LND-09', 'Funding commitments', 'Reserved is not yet disbursed · sample', [
        sec('Committed principal', [
          amt('R 2,000.00'),
          row('Commitment', 'CM-303-N'),
          row('Linked offer', 'OF-303-N'),
          row('Status', 'Awaiting funding'),
          row('Accepted', '20 Oct 2026'),
        ]),
        sec('Review funding instruction', [
          p('Confirmation authorizes one attempt. Funds are not marked funded until the provider confirms and ledger reconciles.'),
          row('Own bank', 'Demo Bank •••• 4021'),
          row('Funding amount', 'R 2,000.00'),
          row('Sample fee', 'R 0.00'),
          chk('☐ I authorize this specific sample funding instruction.'),
          btn('Confirm mock funding', 'primary', to: 'SHR-01'),
        ]),
        sec('Delay or failure', [
          p('Do not send a second transfer while the first is unknown. Query the existing instruction or contact support. Released reservations require an authoritative cancellation event.'),
          btn('Ask about commitment', 'secondary', to: 'LND-17'),
        ]),
      ]),
      S('LND-10', 'Your portfolio', 'Naledi Lender Demo · snapshot 21 Oct 2026', [
        sec('Outstanding principal', [
          amt('R 6,000.00'),
          prog(0.29),
          row('Disbursed principal', 'R 9,000.00'),
          row('Principal received', 'R 3,000.00'),
          row('Overdue subset', 'R 500.00'),
        ]),
        sec('Filter your loans', [
          field('Status', 'All · active / overdue / settled  ⌄'),
        ]),
        sec('LN-N301 · Course materials', [
          badge('Active · on schedule'),
          h('LN-N301 · Course materials'),
          row('Outstanding principal', 'R 1,500.00'),
          row('Original principal', 'R 3,000.00'),
          btn('View loan details', 'primary', to: 'LND-11'),
        ]),
        sec('Other holdings', [
          row('LN-N302 · active', 'R 2,500.00'),
          row('LN-N303 · active', 'R 1,500.00'),
          row('LN-N304 · overdue', 'R 500.00'),
          p('4 fictional holdings. Commitments CM-303-N R 2,000 are separate and not included.'),
        ]),
      ]),
      S('LND-11', 'Your loan holding', 'LN-N301 · lender allocation · separate sample', [
        sec('Principal progress', [
          badge('Outstanding · active'),
          h('Principal progress'),
          amt('R 1,500.00'),
          prog(0.45),
          row('Original principal', 'R 3,000.00'),
          row('Principal received', 'R 1,500.00'),
        ]),
        sec('Agreed sample terms', [
          row('Term / method', '2 months / flat'),
          row('Rate / month', '1.00%'),
          row('Total expected interest', 'R 60.00'),
          row('Sample lender fees', 'R 0.00'),
          p('Separate LN-N301 scenario, not TM-1042. Expected return only; capital loss possible.'),
        ]),
        sec('Repayment schedule', [
          p('Each scheduled amount includes R 1,500 principal + R 30 interest. Principal remaining R 1,500; interest expected R 30.'),
          row('30 Sep 2026', 'R 1,530 · received'),
          row('30 Oct 2026', 'R 1,530 · expected'),
        ]),
        sec('Funding & history', [
          row('31 Aug · allocation funded', 'R 3,000.00'),
          row('30 Sep · first receipt', 'R 1,530.00'),
          btn('Repayments & allocations', 'primary', to: 'LND-12'),
          btn('Matched-party messages', 'secondary', to: 'SHR-04'),
        ]),
      ]),
      S('LND-12', 'Repayments received', 'Your lender allocations · synthetic records', [
        sec('Received to date', [
          amt('R 3,090.00'),
          row('Principal received', 'R 3,000.00'),
          row('Interest received', 'R 90.00'),
          row('Lender fee deducted', 'R 0.00'),
        ]),
        sec('LN-N301 · 30 Sep', [
          badge('Paid'),
          h('LN-N301 · 30 Sep'),
          row('Principal / interest', 'R 1,500 / R 30'),
          row('Receipt total', 'R 1,530.00'),
          p('Lender holding receipt differs from borrower transaction TX-1042-02; do not reuse its amount as lender yield.'),
        ]),
        sec('Partial allocation · LN-N304', [
          p('Partial, not paid. Outstanding retains the unpaid principal. Approved allocation rules determine fees and interest separately.'),
          row('Scheduled principal', 'R 1,000.00'),
          row('Principal received', 'R 500.00'),
          row('Overdue principal', 'R 500.00'),
        ], tone: 'warn'),
        sec('Outstanding next', [
          row('LN-N301 · 30 Oct', 'R 1,530 expected'),
          row('Other principal outstanding', 'R 4,500.00'),
          btn('View funds ledger', 'primary', to: 'LND-13'),
        ]),
      ]),
      S('LND-13', 'Your funds activity', 'Naledi Demo · ledger view · no live money', [
        sec('Available funds', [
          amt('R 8,000.00'),
          row('Reserved commitments', 'R 2,000.00'),
          row('Pending withdrawal', 'R 0.00'),
        ]),
        sec('Transactions', [
          row('20 Oct · CM-303-N', '− R 2,000 reserve'),
          row('30 Sep · RC-N301', '+ R 1,530 receipt'),
          row('30 Sep · FEE-N301', 'R 0 fee'),
          row('29 Sep · ADJ-N001', '+ R 10 correction'),
          p('Each row opens its authorized internal reference, allocation and correlated event. Reserve release is not income.'),
        ]),
        sec('Adjustment detail · ADJ-N001', [
          p('R 10 correction reverses a synthetic duplicate fee. Reason: duplicate fee reversed. Related original FEE-N000. Approved finance case FIN-021; immutable audit trail.'),
        ]),
        sec('Move funds safely', [
          btn('Review withdrawal', 'primary', to: 'LND-14'),
          btn('View wallet methods', 'secondary', to: 'SHR-03'),
        ]),
      ]),
      S('LND-14', 'Withdraw available funds', 'Review destination, charges and timing', [
        sec('Withdrawal details', [
          row('Available', 'R 8,000.00'),
          row('Sample fee', 'R 0.00'),
          row('Net to bank', 'R 1,000.00'),
          field('To your bank', 'Demo Bank •••• 4021'),
          field('Amount', 'R 1,000.00'),
          p('Illustrative timing: 1–2 business days after confirmed processing. Not a live service promise.'),
        ]),
        sec('Confirm this withdrawal?', [
          p('Creates one withdrawal WD-N014. Funds become pending, not immediately paid. Cancel only if server says permitted; posted transfers require review.'),
          chk('☐ I checked the masked destination and amount.'),
          btn('Confirm mock withdrawal', 'primary', to: 'LND-14'),
          btn('Keep funds available', 'secondary', to: 'LND-13'),
        ]),
        sec('Result · pending example', [
          badge('WD-N014 · Pending', 'warn'),
          h('Result · pending example'),
          p('R 1,000 to •••• 4021. Keep the reference. Check existing status; do not repeat withdrawal.'),
          btn('Check existing withdrawal', 'secondary', to: 'ST-24'),
        ], tone: 'warn'),
        sec('Failure result · alternate', [
          p('Terminal failure does not mean funds are available until the reservation-release entry posts. Contact support if balance is still updating.'),
        ], tone: 'err'),
      ]),
      S('LND-15', 'Performance, honestly', 'Since inception · cash-based sample methodology', [
        sec('Realized interest', [
          amt('R 90.00'),
          row('Principal received', 'R 3,000.00'),
          row('Lender fees paid', 'R 0.00'),
          row('Realized net interest', 'R 90.00'),
          p('Posted interest receipts less posted lender charges. Not an annualized return or a forecast.'),
        ]),
        sec('Expected, not earned', [
          p('Expected interest assumes full repayment. Defaults and delays may reduce it. No guarantee.'),
          row('Remaining indicative interest', 'R 180.00'),
          row('Outstanding principal', 'R 6,000.00'),
          row('Overdue principal', 'R 500.00'),
        ]),
        sec('Concentration', [
          prog(0.37),
          row('Largest holding · LN-N302', '41.7%'),
          row('Other holdings', '58.3%'),
          row('Overdue / outstanding', '8.3%'),
          p('Largest outstanding principal R 2,500 ÷ R 6,000. Overdue principal R 500 ÷ R 6,000; no grace-policy assumption. Based on contractual due events.'),
        ]),
        sec('See the source', [
          btn('Review portfolio', 'primary', to: 'LND-10'),
          btn('Export period statement', 'secondary', to: 'LND-16'),
        ]),
      ]),
      S('LND-16', 'Statements & exports', 'Your lender records · period-based, watermarked', [
        sec('Choose a period', [
          field('From', '01 Sep 2026'),
          field('To', '30 Sep 2026'),
          field('Export format', 'PDF or CSV  ⌄'),
        ]),
        sec('Statement preview', [
          row('Opening available', 'R 6,430.00'),
          row('Receipts', '+ R 3,090.00'),
          row('Funding outflow', '− R 1,520.00'),
          row('Fees / adjustments', 'R 0.00'),
          row('Closing available', 'R 8,000.00'),
          p('September example: cash ledger only; October CM-303-N reservation is outside this period.'),
        ]),
        sec('Export history', [
          row('EXP-N016 · September PDF', 'Ready · sample'),
          row('EXP-N015 · August CSV', 'Expired link'),
          btn('Prepare sample export', 'primary', to: 'LND-16'),
          btn('Regenerate expired link', 'secondary', to: 'LND-16'),
        ]),
        sec('Reconcile records', [
          p('Available balance, committed funds, principal and received interest use separate ledgers. Exports include immutable references, fees and adjustments.'),
        ]),
      ]),
      S('LND-17', 'Updates & support', 'Naledi Demo · lender notifications', [
        sec('Latest updates', [
          row('Offer accepted · OF-303-N', 'LND-09 →'),
          row('Receipt posted · RC-N301', 'LND-12 →'),
          row('Withdrawal pending · WD-N014', 'LND-14 →'),
          row('Overdue holding · LN-N304', 'LND-10 →'),
        ]),
        sec('Ask about your funds', [
          p('Use internal references; never share bank login details or full account numbers.'),
          field('Related reference', 'WD-N014  ⌄'),
          field('Topic', 'Withdrawal status  ⌄'),
          btn('Create support case', 'primary', to: 'SUP-02'),
        ]),
        sec('Your support history', [
          row('CASE-N017', 'Awaiting your reply'),
          row('CASE-N012', 'Closed · resolved'),
          btn('View case conversation', 'secondary', to: 'SUP-03'),
          btn('Notification preferences', 'secondary', to: 'SUP-04'),
        ]),
      ]),
      S('LND-18', 'Your lender account', 'Naledi Lender Demo · eligible sample persona', [
        sec('Lender profile', [
          badge('Separate lender persona'),
          h('Lender profile'),
          row('Eligibility / setup', 'LND-02 →'),
          row('Lending preferences', 'LND-03 →'),
          row('Contact profile', 'SUP-05 →'),
        ]),
        sec('Security', [
          row('MFA / passkey / device unlock', 'SUP-06 →'),
          row('Active sessions', 'SUP-07 →'),
          row('Report suspicious activity', 'SUP-11 →'),
        ]),
        sec('Data & account choices', [
          p('Open commitments, outstanding loans and pending withdrawals may prevent immediate closure; retained records are explained before confirmation.'),
          row('Privacy & consent', 'SUP-08 →'),
          row('Data copy', 'SUP-09 →'),
          row('Account closure obligations', 'SUP-10 →'),
        ]),
        sec('Support', [
          btn('Search help', 'primary', to: 'SUP-01'),
          btn('View notifications', 'secondary', to: 'LND-17'),
        ]),
      ]),
    ];
