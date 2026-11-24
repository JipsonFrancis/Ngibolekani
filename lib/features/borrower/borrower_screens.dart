import '../../core/spec/screen_spec.dart';
import '../../core/spec/spec_dsl.dart';

/// Figma section "03 Borrower Experience" (BRW-xx).
///
/// Imported: BRW-01, 02, 03, 05, 06, 07, 08, 09, 11, 13, 15-21.
/// Linked but not imported yet: BRW-04 (request a loan),
/// BRW-10 (compare offers), BRW-12 (agreement), BRW-14 (loan tracking);
/// see `lib/app/pending_figma_screens.dart`.
List<ScreenSpec> borrowerScreens() => <ScreenSpec>[
      S('BRW-01', 'Hello, Lerato', 'Your money, clearly in view. 21 October 2026', [
        // NOTE: "SAMPLE DATA" brand-bar badge and the "TransferMe" wordmark are not expressible.
        // NOTE: Segmented control (Borrower | Lender · locked) has no DSL block; shown as rows.
        sec('Role', [
          row('Borrower', 'Active'),
          row('Lender · locked', 'Locked'),
        ]),
        // NOTE: wallet icon and the Pending/Reserved side-by-side layout are not expressible.
        sec('My wallet', [
          p('Available · demo balance'),
          amt('R 2,400.00'),
          row('Pending', 'R 500.00'),
          row('Reserved', 'R 1,100.00'),
          note('Pending: simulated top-up. Reserved: next repayment. No real funds are held.'),
        ]),
        // NOTE: quick actions are two side-by-side icon tiles; shown as stacked buttons.
        sec('Quick actions', [
          btn('Request a loan', 'primary', to: 'BRW-04'),
          btn('Explore lending', 'secondary', to: 'LND-04'),
        ]),
        sec('Finish verification', [
          badge('1 of 3', 'warn'),
          h('Finish verification'),
          p('SA identity complete. Selfie review pending; bank ownership still needs a check.'),
          btn('Continue verification →', 'tertiary', to: 'ONB-09'),
          note('Switch roles once verified and eligible. Lending is locked in this sample account.'),
        ]),
        // NOTE: "Active loans" heading with a right-aligned "View loan →" link is split into a section title + row.
        sec('Active loans', [
          badge('On track', 'ok'),
          h('Work equipment'),
          p('TM-1042 · active sample'),
          row('Outstanding principal', 'R 1,000.00'),
          prog(0.67),
          p('2 of 3 instalments paid · R 2,200.00 total'),
          row('View loan', 'BRW-14 →'),
        ]),
        // NOTE: due-date tile (30 / OCT) is not expressible; folded into the row label.
        sec('Upcoming repayment', [
          row('30 OCT', 'R 1,100.00'),
          p('TM-1042 · final monthly payment'),
          note('R 1,000 principal + R 100 costs'),
        ]),
        sec('Demo environment', [
          p('No loans are funded and no money moves. Identity and payment providers are not connected.'),
        ]),
      ]),
      S('BRW-02', 'Your borrower profile', 'Lerato Demo · original account · lender locked', [
        sec('Contact details', [
          badge('Editable contacts'),
          h('Contact details'),
          field('Display name', 'Lerato Demo'),
          field('Email', 'lerato.demo@example.test', 'Fictional address · reverify changes'),
          field('Mobile', '+27 ••• ••• 2048', 'Masked synthetic number'),
        ]),
        sec('Financial picture', [
          row('Net income / month', 'R 10,000.00'),
          row('Living expenses', 'R 6,500.00'),
          row('Existing debt payments', 'R 1,100.00'),
          p('Self-reported. Updating these figures triggers a new assessment, not an automatic approval.'),
        ]),
        sec('Checks & documents', [
          row('Identity', 'Complete · sample'),
          row('Liveness', 'Pending review'),
          row('Bank ownership', 'Not started'),
          row('Income evidence', 'Draft · synthetic PDF'),
          btn('Review eligibility', 'primary', to: 'BRW-03'),
          btn('Manage sample documents', 'secondary', to: 'ONB-07'),
        ]),
        sec('Account access', [
          p('Identity status is read-only. Contact verification, financial assessment and lender eligibility remain separate.'),
          btn('Security & account', 'secondary', to: 'BRW-21'),
        ]),
        sec('Actions', [
          btn('Review profile changes', 'primary', to: 'SUP-05'),
        ]),
      ]),
      S('BRW-03', 'Before you request', 'Original Lerato account · not eligible yet', [
        sec('Your checklist', [
          badge('Action needed', 'warn'),
          h('Your checklist'),
          row('Contact possession', 'Confirmed'),
          row('Identity document', 'Complete'),
          row('Selfie & liveness', 'Pending'),
          row('Bank ownership', 'Not started'),
        ], tone: 'warn'),
        sec('Financial assessment', [
          p('A verified identity is not an affordability decision. Each request needs its own assessment.'),
          row('Income & expenses', 'Draft'),
          row('Income evidence', 'Required'),
          row('Affordability', 'Not assessed'),
          row('Request eligibility', 'Not assessed'),
        ]),
        sec('Documents to prepare', [
          p('Synthetic income evidence and bank ownership result. Never upload real documents in this demo.'),
          btn('Continue identity checks', 'primary', to: 'ONB-09'),
          btn('Complete financial picture', 'secondary', to: 'ONB-10'),
        ]),
        sec('Separate eligible scenario', [
          p('BRW-05 onward illustrates an explicitly eligible borrower scenario, not a change to this account’s pending status. Risk is assessed per request; lending remains locked here.'),
        ]),
      ]),
      S('BRW-05', 'Your repayment estimate', 'Eligible sample branch · TM-2048 · not an offer', [
        sec('3 monthly payments', [
          badge('Illustrative estimate'),
          h('3 monthly payments'),
          amt('R 1,080.00'),
          row('Principal / net proceeds', 'R 3,000.00'),
          row('Term', '3 months'),
        ]),
        sec('Every cost included', [
          p('R 3,000 × 1% × 3 = R 90. Flat interest uses original principal, not reducing balance; this is not APR. Fees are paid in instalments, not deducted.'),
          row('Interest: 1% flat/month', 'R 90.00'),
          row('Initiation', 'R 60.00'),
          row('Service: R 30 × 3', 'R 90.00'),
          row('Total repayment', 'R 3,240.00'),
        ]),
        sec('Illustrative dates', [
          row('30 Nov 2026', 'R 1,080.00'),
          row('30 Dec 2026', 'R 1,080.00'),
          row('30 Jan 2027', 'R 1,080.00'),
        ]),
        sec('Affordability assumptions', [
          row('Income', 'R 10,000.00'),
          row('Expenses + existing debt', 'R 7,600.00'),
          row('Before new repayment', 'R 2,400.00'),
          row('After new repayment', 'R 1,320.00'),
          p('Self-reported values; no affordability approval implied. Final offers may differ.'),
        ]),
        sec('Actions', [
          btn('Review request', 'primary', to: 'BRW-06'),
          btn('Edit loan details', 'secondary', to: 'BRW-04'),
        ]),
      ]),
      S('BRW-06', 'Review before submitting', 'Eligible sample branch · TM-2048 · course fees', [
        sec('Request summary', [
          row('Amount / net proceeds', 'R 3,000.00'),
          row('Purpose', 'Course fees'),
          row('Term / frequency', '3 months / monthly'),
          row('Income / expenses', 'R 10,000 / R 6,500'),
          row('Existing debt', 'R 1,100.00'),
        ]),
        sec('Estimated commitment', [
          row('Interest / initiation', 'R 90 / R 60'),
          row('Service: R 30 × 3', 'R 90.00'),
          row('Total repayment', 'R 3,240.00'),
          row('Monthly estimate', 'R 1,080.00'),
          p('1% flat/month on R 3,000 × 3. Due 30 Nov / 30 Dec 2026 / 30 Jan 2027. Fees in instalments; not deducted.'),
        ]),
        sec('Confirm your information', [
          chk('☐ My income, expenses and debt details are accurate in this sample.'),
          chk('☐ I understand this is a request, not an approved loan or guaranteed funding.'),
          chk('☐ I reviewed estimated fees, dates and permitted marketplace disclosures.'),
        ]),
        sec('Submit this request?', [
          p('Confirm sends this version for review. You can cancel before commitment where permitted. No agreement is signed and no debit occurs.'),
          btn('Confirm sample submission', 'primary', to: 'BRW-07'),
          btn('Back to edit', 'secondary', to: 'BRW-04'),
        ]),
      ]),
      S('BRW-07', 'Track your request', 'TM-2048 · eligible scenario · submitted', [
        sec('Submitted for review', [
          badge('21 Oct · 09:27 SAST'),
          h('Submitted for review'),
          p('Your sample request was received once. Reference TM-2048. Keep this reference if you contact support.'),
        ]),
        sec('Request timeline', [
          row('Draft saved', 'Complete'),
          row('Submitted', 'Complete'),
          row('Under review', 'Next'),
          row('Eligible decision', 'Awaiting assessment'),
          row('Published', 'Only after approval'),
          row('Offers received', 'After publication'),
          p('More information may be requested before a decision. Submitted does not mean published.'),
        ]),
        sec('Other possible outcomes', [
          p('Declined eligibility is a request decision, not an offer status. No published deadline is invented here.'),
          row('Not eligible', 'Explanation + appeal'),
          row('Cancelled', 'Your confirmed action'),
          row('Expired', 'Publication ended'),
        ]),
        sec('Your next step', [
          p('Wait for a review update. Do not create duplicate requests while this version is processing.'),
          btn('View my requests', 'primary', to: 'BRW-08'),
          btn('Review cancellation', 'secondary', to: 'ST-C02'),
        ]),
      ]),
      S('BRW-08', 'My requests', 'Your sample requests · all statuses visible', [
        sec('Filter requests', [
          row('Active', '1'),
          row('Completed', '1'),
          row('Cancelled / expired', '1 / 1'),
          field('Status', 'Active  ⌄', 'Active · completed · cancelled · expired'),
        ]),
        sec('Course fees · TM-2048', [
          badge('Submitted'),
          h('Course fees · TM-2048'),
          row('Requested', 'R 3,000.00'),
          row('Updated', '21 Oct 2026'),
          btn('Track request', 'primary', to: 'BRW-07'),
        ]),
        sec('Work equipment · TM-1042', [
          badge('Completed request · active loan'),
          h('Work equipment · TM-1042'),
          row('Original amount', 'R 3,000.00'),
          row('Scheduled remaining', 'R 1,100.00'),
          btn('View active loan', 'secondary', to: 'BRW-14'),
        ]),
        sec('Archived examples', [
          row('TM-DEMO-201', 'Cancelled · 12 Oct'),
          row('TM-DEMO-202', 'Expired · 18 Oct'),
          p('Independent fictional records. Reapply creates a fresh draft and reassessment, not a restored offer.'),
        ]),
      ]),
      S('BRW-09', 'Your received offers', 'TM-2048 · separate published scenario', [
        sec('Offer A · Sample Lender A', [
          badge('Available until 23 Oct · 17:00 SAST'),
          h('Offer A · Sample Lender A'),
          amt('R 3,240.00'),
          row('Net proceeds', 'R 3,000.00'),
          row('Monthly × 3', 'R 1,080.00'),
          row('Flat interest / month', '1.00%'),
          btn('Review Offer A', 'primary', to: 'BRW-11'),
        ]),
        sec('Offer B · Sample Lender B', [
          badge('Available until 22 Oct · 17:00 SAST'),
          h('Offer B · Sample Lender B'),
          amt('R 3,285.00'),
          row('Net proceeds', 'R 3,000.00'),
          row('Monthly × 3', 'R 1,095.00'),
          row('Flat interest / month', '1.50%'),
        ]),
        sec('Only permitted lender details', [
          p('Display aliases and platform-reviewed status only. No private identity, personal phone or bank details. Review does not guarantee performance.'),
          p('Both offers include initiation R 60 and service R 90; A interest R 90, B interest R 135. Fees included in instalments.'),
        ]),
        sec('Actions', [
          btn('Compare all costs', 'primary', to: 'BRW-10'),
        ]),
      ]),
      S('BRW-11', 'Offer A, in full', 'TM-2048 · Sample Lender A · eligible scenario', [
        sec('What you receive', [
          badge('Expires 23 Oct 2026 · 17:00 SAST'),
          h('What you receive'),
          amt('R 3,000.00'),
          row('Requested principal', 'R 3,000.00'),
          row('Deductions from proceeds', 'R 0.00'),
          p('Fees are included in instalments. Acceptance is not disbursement.'),
        ]),
        sec('Pricing calculation', [
          p('R 3,000 × 1% flat/month × 3 = R 90 interest. Flat uses original principal; not APR.'),
          row('Interest', 'R 90.00'),
          row('Initiation fee', 'R 60.00'),
          row('Service: R 30 × 3', 'R 90.00'),
          row('Total repayment', 'R 3,240.00'),
        ]),
        sec('Your schedule', [
          row('First · 30 Nov 2026', 'R 1,080.00'),
          row('30 Dec 2026', 'R 1,080.00'),
          row('Final · 30 Jan 2027', 'R 1,080.00'),
          p('Each: R 1,000 principal + R 30 interest + R 20 initiation + R 30 service.'),
        ]),
        sec('Conditions & late payments', [
          p('Subject to agreement and funding. Missed instalments may trigger reminders, review and collections under approved terms. No additional default charge is modelled. Settlement requires a dated quote.'),
        ]),
        sec('Review acceptance', [
          p('Continue to the unsigned AG-2048 agreement. No signature or lender commitment is created by this preview.'),
          chk('☐ I reviewed net proceeds, costs, expiry, dates and conditions.'),
          btn('Review agreement', 'primary', to: 'BRW-12'),
          btn('Review decline offer', 'secondary', to: 'ST-C03'),
        ]),
      ]),
      S('BRW-13', 'Where is my funding?', 'TM-2048 · downstream scenario, not current AG-2048', [
        sec('Pending funding', [
          badge('Simulated downstream branch', 'warn'),
          h('Pending funding'),
          amt('R 3,000.00'),
          p('An offer can be accepted without a funded loan. Your bank has not received money.'),
          prog(0.45),
        ], tone: 'warn'),
        sec('Four distinct events', [
          row('Offer accepted', 'Complete · scenario'),
          row('Lender commitment', 'Recorded · scenario'),
          row('Funds confirmed', 'Pending'),
          row('Disbursement confirmed', 'Not started'),
          p('Acceptance ≠ commitment ≠ funded ≠ disbursed. Active only after confirmed disbursement.'),
        ]),
        sec('If there is a delay', [
          p('We will show the next verified update here. Contact support with TM-2048; do not resubmit or pay a release fee.'),
          btn('View funding activity', 'primary', to: 'SHR-01'),
          btn('Ask support', 'secondary', to: 'SUP-02'),
        ]),
        sec('Failure branch', [
          p('If funds cannot be confirmed, show the reason and permitted cancellation/refund review. No automatic debit, refund promise or active repayment schedule before reconciliation.'),
        ]),
      ]),
      S('BRW-15', 'Repayment centre', 'TM-1042 · active sample loan · 21 Oct 2026', [
        sec('Scheduled balance remaining', [
          amt('R 1,100.00'),
          row('Principal', 'R 1,000.00'),
          row('Interest + fees', 'R 100.00'),
        ]),
        sec('Full repayment schedule', [
          row('30 Aug 2026 · R 1,100', 'Paid'),
          row('30 Sep 2026 · R 1,100', 'Paid'),
          row('30 Oct 2026 · R 1,100', 'Due'),
          p('Original total R 3,300. Paid R 2,200 including R 2,000 principal. Final allocation: principal R 1,000, interest R 60, initiation R 20, service R 20.'),
        ]),
        sec('Choose payment', [
          field('Payment amount', 'R 1,100.00'),
          field('Method', 'Demo wallet  ⌄', 'Available R 2,400 · reserved R 1,100; reservation is not a second balance'),
          btn('Manage payment methods', 'secondary', to: 'SHR-03'),
        ]),
        sec('Confirm sample repayment?', [
          p('Pay R 1,100 to TM-1042 from demo wallet. Sample fee R 0. Recheck the result before trying any other payment. Once posted, reversal needs an approved review.'),
          chk('☐ I reviewed the amount, method and allocation.'),
          btn('Confirm mock payment', 'primary', to: 'BRW-16'),
          btn('Keep loan unchanged', 'secondary', to: 'BRW-14'),
        ]),
      ]),
      S('BRW-16', 'Check your payment result', 'Mock result variants · mutually exclusive scenarios', [
        sec('Successful · historical example', [
          badge('TX-1042-02 · paid', 'ok'),
          h('Successful · historical example'),
          amt('R 1,100.00'),
          p('30 Sep 2026 · 09:27 SAST. Existing payment, not a new October payment.'),
          btn('View existing receipt', 'primary', to: 'SHR-RECEIPT'),
        ], tone: 'ok'),
        sec('Pending · alternate state', [
          p('The same intent is processing. Keep this reference; we will refresh the status. Do not pay again.'),
          btn('Check existing status', 'secondary', to: 'BRW-16'),
        ], tone: 'warn'),
        sec('Unknown · alternate state', [
          p('We cannot confirm the outcome. It may have debited. No Pay again action. Status query and reconciliation must resolve it.'),
          btn('Get help with this intent', 'secondary', to: 'SUP-02'),
        ], tone: 'warn'),
        sec('Failed · alternate state', [
          p('Provider confirms terminal failure and no debit in this example. Review the method and current balance before creating a fresh attempt.'),
          btn('Review payment method', 'secondary', to: 'BRW-15'),
        ], tone: 'err'),
      ]),
      S('BRW-17', 'History & statements', 'TM-1042 · your records · SAMPLE watermark', [
        sec('Loan history', [
          row('Work equipment · TM-1042', 'Active'),
          row('Original total', 'R 3,300.00'),
          row('Paid to date', 'R 2,200.00'),
          row('Remaining scheduled', 'R 1,100.00'),
        ]),
        sec('Payment records', [
          row('TX-1042-02 · 30 Sep', 'R 1,100 · paid'),
          row('TX-1042-01 · 30 Aug', 'R 1,100 · paid'),
          btn('Open September receipt', 'primary', to: 'SHR-RECEIPT'),
        ]),
        sec('Generate a statement', [
          p('Opening scheduled balance R 2,200; payment R 1,100; closing R 1,100. Not a settlement quote.'),
          field('Period', '01 Sep–30 Sep 2026  ⌄'),
          field('Format', 'PDF · SAMPLE  ⌄'),
          btn('Prepare sample statement', 'secondary', to: 'BRW-17'),
        ]),
        sec('Download history', [
          row('September statement', 'Ready · 21 Oct'),
          row('August statement', 'Ready · 01 Sep'),
          p('If a document is unavailable, keep your selected period and request a fresh link.'),
        ]),
      ]),
      S('BRW-18', 'Settle your loan early', 'TM-1042 · dated illustrative quote', [
        sec('Sample quote SQ-1042', [
          badge('Issued 21 Oct 2026 · 09:27 SAST'),
          h('Sample quote SQ-1042'),
          amt('R 1,080.00'),
          p('Expires 21 Oct 2026 · 17:00 SAST. Fictional quote assumption, not a legally validated settlement calculation.'),
        ]),
        sec('Quote breakdown', [
          p('Illustrative R 20 interest adjustment versus R 1,100 scheduled balance. No general rebate rule implied.'),
          row('Outstanding principal', 'R 1,000.00'),
          row('Accrued interest · assumed', 'R 40.00'),
          row('Remaining initiation', 'R 20.00'),
          row('Service · assumed', 'R 20.00'),
          row('Additional settlement fee', 'R 0.00'),
        ]),
        sec('Review settlement', [
          p('Confirm pays the quoted amount only. Loan becomes settled after posted payment and zero-balance validation, not after tapping confirm.'),
          field('Method', 'Demo wallet  ⌄'),
          chk('☐ I reviewed this dated quote, expiry and full amount.'),
          btn('Confirm mock settlement', 'primary', to: 'BRW-16'),
          btn('Keep normal schedule', 'secondary', to: 'BRW-15'),
        ]),
      ]),
      S('BRW-19', 'Raise a loan dispute', 'TM-1042 · we’ll keep a clear record', [
        sec('Tell us what happened', [
          field('Related entry', 'TX-1042-02  ⌄'),
          field('Category', 'Payment allocation  ⌄'),
          field('Description', 'Please explain the R 40 fee allocation.', 'Use only fictional information in this preview.'),
        ]),
        sec('Supporting evidence', [
          p('sample-allocation.pdf · 240 KB · synthetic'),
          p('Do not share full bank details, passwords or identity documents in a conversation.'),
          btn('Add sample evidence', 'secondary', to: 'SUP-02'),
        ]),
        sec('Review your dispute', [
          p('Opening a case does not automatically pause repayments or reverse a payment. We will confirm any agreed change.'),
          chk('☐ This sample description and evidence are accurate.'),
          btn('Submit sample dispute', 'primary', to: 'SUP-03'),
        ]),
        sec('Submitted state · separate preview', [
          badge('CASE-1042 · Open', 'ok'),
          h('Submitted state · separate preview'),
          p('Reference recorded · 21 Oct 2026. Follow the status, add evidence or request escalation in case details.'),
        ], tone: 'ok'),
      ]),
      S('BRW-20', 'Your notifications', 'Borrower inbox · sample events from separate branches', [
        sec('Offers & agreements', [
          badge('2 unread'),
          h('Offers & agreements'),
          row('New Offer A · TM-2048', 'BRW-11 →'),
          row('AG-2048 ready · unsigned', 'BRW-12 →'),
        ]),
        sec('Funding & repayments', [
          row('Funding update · sample', 'BRW-13 →'),
          row('Due 30 Oct · R 1,100', 'BRW-15 →'),
          row('Receipt · TX-1042-02', 'SHR-RECEIPT →'),
        ]),
        sec('Important case updates', [
          row('Overdue · alternate scenario', 'ST-19 →'),
          row('CASE-1042 response', 'SUP-03 →'),
          p('An overdue example is not TM-1042’s current status. Security and essential service notices cannot all be disabled.'),
        ]),
        sec('Keep notifications useful', [
          btn('Notification preferences', 'secondary', to: 'SUP-04'),
          btn('Help & support', 'secondary', to: 'SUP-01'),
        ]),
      ]),
      S('BRW-21', 'Account & security', 'Lerato Demo · original account · shared settings', [
        sec('Your profile', [
          badge('Borrower · lender locked'),
          h('Your profile'),
          row('Contact & financial details', 'BRW-02 →'),
          row('Identity progress', 'ONB-09 →'),
          row('Profile edit', 'SUP-05 →'),
        ]),
        sec('Protect your account', [
          p('Device biometrics unlock this app; they do not replace identity verification.'),
          row('Password / MFA / passkeys', 'SUP-06 →'),
          row('Devices & active sessions', 'SUP-07 →'),
          row('Suspicious activity', 'SUP-11 →'),
        ]),
        sec('Privacy & preferences', [
          row('Notification preferences', 'SUP-04 →'),
          row('Privacy & optional consent', 'SUP-08 →'),
          row('Download your data', 'SUP-09 →'),
          row('Account closure', 'SUP-10 →'),
        ]),
        sec('We’re here to help', [
          btn('Search help', 'primary', to: 'SUP-01'),
          btn('Open a support case', 'secondary', to: 'SUP-02'),
        ]),
      ]),
    ];
