import '../../core/spec/screen_spec.dart';
import '../../core/spec/spec_dsl.dart';

/// Figma section "02 Onboarding & Identity" (ONB-01 ... ONB-13).
/// ONB-09 (identity verification progress) is a route frame that is not
/// imported yet; see `lib/app/pending_figma_screens.dart`.
List<ScreenSpec> onboardingScreens() => <ScreenSpec>[
      S('ONB-01', 'Money, with clarity', 'Welcome to TransferMe · South Africa', [
        sec('Borrow thoughtfully. Lend informed.', [
          amt('TransferMe'),
          p('A clear view of requests, offers and repayments. Built for eligible borrowers and lenders, with checks before financial actions.'),
          chk('See the full cost before agreeing'),
          chk('Track every repayment and reference'),
          chk('Keep sensitive information private'),
        ]),
        sec('Start with confidence', [
          p('Creating an account is not approval for borrowing or lending. This is a static design demonstration, not a live financial service.'),
        ]),
        sec('Your choices', [
          row('Already registered?', 'Sign in → ONB-12', to: 'ONB-12'),
          row('Terms & privacy', 'SUP-08', to: 'SUP-08'),
          row('Need help?', 'SUP-01', to: 'SUP-01'),
        ]),
        sec('Actions', [
          btn('Create an account', 'primary', to: 'ONB-02'),
          btn('Sign in', 'secondary', to: 'ONB-12'),
        ]),
      ]),
      S('ONB-02', 'How will you use it?', 'Choose your purpose · you can change this later', [
        sec('Borrower', [
          badge('• Selected'),
          p('Request funds for an eligible purpose. Review affordability, compare costs and track repayment.'),
        ]),
        sec('Lender', [
          p('Explore reviewed requests. Capital is at risk and returns are never guaranteed.'),
        ]),
        sec('Both roles', [
          p('Choose both without receiving automatic access. Borrower and lender eligibility are assessed separately.'),
        ]),
        sec('A preference, not approval', [
          p('Change your role purpose in Profile. Financial actions unlock only after the relevant checks.'),
        ]),
        sec('Actions', [
          btn('Continue as borrower', 'primary', to: 'ONB-03'),
          btn('Choose both roles', 'secondary', to: 'ONB-03'),
        ]),
      ]),
      S('ONB-03', 'Create your account', 'Step 1 · your contact and sign-in details', [
        sec('Your details', [
          field('Legal name', 'Lerato Demo', 'Use your legal name; synthetic identity only.'),
          field('Email address', 'lerato.d•••@example.test'),
          field('Mobile number', '+27 •• ••• 2048'),
          field('Country', 'South Africa  ⌄'),
        ]),
        sec('Secure password', [
          field('Password', '••••••••••••  ◉', 'Show / hide password. At least 12 characters; avoid known compromised passwords.'),
          chk('☑ Required: accept Terms of Use'),
          chk('☑ Required: acknowledge Privacy Notice'),
          p('No marketing consent is bundled into required terms.'),
        ]),
        sec('Validation example', [
          p('Enter a valid email address. Keep the other fields intact and focus the first error after submit.'),
        ], tone: 'err'),
        sec('Actions', [
          btn('Create account & verify contact', 'primary', to: 'ONB-04'),
        ]),
        foot('Submit once; disable while creating. If the account already exists, offer sign-in without exposing account details.'),
      ]),
      S('ONB-04', 'Check your messages', 'Contact possession is not identity verification', [
        sec('Enter the 6-digit code', [
          p('We would send a code to +27 •• ••• 2048. Messaging is not connected in this demonstration.'),
          field('Verification code', '4  8  2  •  •  •', 'Expires in 04:32 · 3 attempts remaining'),
        ]),
        sec('Need another code?', [
          row('Resend code', 'Available in 00:28'),
          row('Wrong destination?', 'Change contact'),
          row('Alternative', 'Verify email instead'),
        ]),
        sec('Invalid code example', [
          p('That code is not valid. Check the latest message and try again. After the attempt limit, wait or use secure recovery.'),
        ], tone: 'err'),
        sec('Actions', [
          btn('Verify contact', 'primary', to: 'ONB-05'),
          btn('Change contact', 'secondary', to: 'ONB-03'),
        ]),
        foot('New code invalidates previous code. Enforce expiry, rate limits and attempt limits on the server.'),
      ]),
      S('ONB-05', 'Secure your access', 'Step 2 · protect this account', [
        sec('Choose a sign-in method', [
          p('Keep a recovery method available. Passkeys and authenticator setup each require confirmation.'),
          chk('☑ Password + verification code'),
          chk('○ Create a passkey on this device'),
          chk('○ Use an authenticator app for MFA'),
        ]),
        sec('Optional device unlock', [
          badge('• Off'),
          p('Use your device Face ID or fingerprint to unlock locally. Raw fingerprints and biometric templates are never stored by TransferMe.'),
        ]),
        sec('Always an alternative', [
          p('Use your password and MFA if device biometrics are unavailable. Device unlock does not establish legal identity or authorize every transaction.'),
        ]),
        sec('Actions', [
          btn('Save security choice', 'primary', to: 'ONB-06'),
          btn('Set up passkey later', 'secondary', to: 'ONB-06'),
        ]),
        foot('Require confirmed recovery contact before activating MFA.'),
      ]),
      S('ONB-06', 'Your data, your choice', 'Step 3 · informed consent', [
        sec('Required to assess access', [
          p('Only the minimum required data is shared with authorized providers for these purposes. No providers are connected.'),
          chk('☑ Identity checks: confirm legal identity and bank ownership'),
          chk('☑ Financial assessment: assess income, expenses and obligations'),
          chk('☑ Fraud prevention: protect accounts and transactions'),
        ]),
        sec('Optional permissions', [
          chk('☐ Product news by email'),
          chk('☐ Usage analytics beyond essential operation'),
          p('You may change optional choices in SUP-08 without losing essential account services.'),
        ]),
        sec('Read before continuing', [
          p('The privacy notice explains recipients, retention, access rights and complaints. Withholding required data may limit financial access; it does not imply wrongdoing.'),
        ]),
        sec('Actions', [
          btn('Confirm required consent', 'primary', to: 'ONB-07'),
          btn('Read privacy notice', 'secondary', to: 'SUP-08'),
        ]),
      ]),
      S('ONB-07', 'Add an identity document', 'Step 4 · synthetic evidence only', [
        sec('Document type', [
          p('Keep all corners visible. Use good light, avoid glare and ensure text is readable.'),
          field('Select document', 'South African ID card  ⌄'),
        ]),
        sec('Front of document', [
          p('Choose file or use camera'),
          p('Synthetic documents only · PDF, JPG, PNG · up to 10 MB'),
          p('No real ID imagery is shown or accepted in this mockup.'),
        ]),
        sec('Back of document', [
          badge('• Not added'),
          p('Add back of document'),
          p('Synthetic documents only · PDF, JPG, PNG · up to 10 MB'),
        ]),
        sec('Upload preview', [
          badge('• Front received · 50%'),
          prog(0.48),
          row('Synthetic front', 'Retake / replace'),
          row('Quality check', 'Readable · sample'),
          p('If upload fails: keep the selection, show a reason and retry only the failed file.'),
        ]),
        sec('Actions', [
          btn('Review document submission', 'primary', to: 'ONB-08'),
          btn('Save and return later', 'secondary', to: 'ONB-09'),
        ]),
        foot('Camera permission can be declined; file upload and manual support remain available.'),
      ]),
      S('ONB-08', 'Selfie & liveness', 'Step 5 · one part of identity review', [
        sec('Prepare for capture', [
          p('A provider would evaluate liveness alongside document checks. A face-only result is not definitive identity.'),
          chk('Allow camera access when ready'),
          chk('Position your face within the guide'),
          chk('Use even light; remove face coverings'),
        ]),
        sec('Camera preview', [
          p('Camera not connected'),
          p('Synthetic documents only · PDF, JPG, PNG · up to 10 MB'),
          p('No face or biometric data is captured. Capture guide: centered face, eye-level camera, clear background.'),
        ]),
        sec('Your alternatives', [
          row('Permission denied', 'Enable camera / upload help'),
          row('Couldn’t complete?', 'Retry with better light'),
          row('Need accessibility help?', 'Request manual review'),
        ]),
        sec('Actions', [
          btn('Review capture instructions', 'primary', to: 'ONB-09'),
          btn('Request manual alternative', 'secondary', to: 'SUP-02'),
        ]),
        foot('Provider events determine pending, more info or manual review. Never mark verified from local capture alone.'),
      ]),
      S('ONB-10', 'Your financial picture', 'Financial assessment · separate from identity', [
        sec('Income source', [
          field('Source', 'Employment  ⌄', 'For self-employed or other income, ask source-specific evidence rather than employer fields.'),
          field('Employer / source', 'Demo Workshop'),
          field('Frequency', 'Monthly  ⌄'),
          field('Net income (ZAR)', 'R 10,000.00'),
        ]),
        sec('Monthly commitments', [
          field('Living expenses', 'R 6,500.00'),
          field('Existing debt payments', 'R 1,100.00', 'Includes TM-1042. Include all obligations.'),
          row('Before a new payment', 'R 2,400.00'),
        ]),
        sec('Supporting evidence', [
          p('Add synthetic income evidence'),
          p('Synthetic documents only · PDF, JPG, PNG · up to 10 MB'),
          p('Income frequency must be normalized to monthly. Never ask for bank login credentials.'),
        ]),
        sec('Actions', [
          btn('Review financial information', 'primary', to: 'ONB-11'),
          btn('Save draft', 'secondary', to: 'BRW-02'),
        ]),
      ]),
      S('ONB-11', 'Your eligibility review', 'Separate eligible-branch example · not the home status', [
        sec('Borrower access', [
          badge('✓ Eligible · separate scenario', 'ok'),
          p('Identity and bank ownership are complete in this branch. Financial information has been assessed. Individual requests still require review.'),
        ], tone: 'ok'),
        sec('Checks remain distinct', [
          row('Contact possession', 'Confirmed'),
          row('Identity', 'Verified'),
          row('Affordability assessment', 'Complete'),
          row('Lender eligibility', 'Not assessed'),
          row('Credit risk', 'Per request'),
        ]),
        sec('Other possible outcomes', [
          row('More information', 'Upload requested evidence'),
          row('Under review', 'Wait for an update'),
          row('Not eligible', 'Read explanation / appeal'),
          p('Do not expose fraud thresholds or promise approval.'),
        ]),
        sec('Actions', [
          btn('Continue to borrower home', 'primary', to: 'BRW-01'),
          btn('View eligibility checklist', 'secondary', to: 'BRW-03'),
        ]),
        foot('Original home remains ID complete, liveness pending, bank not started and lender locked.'),
      ]),
      S('ONB-12', 'Welcome back', 'Sign in securely · no live authentication', [
        sec('Sign in', [
          field('Email or mobile', 'lerato.d•••@example.test'),
          field('Password', '••••••••••••  ◉', 'Show / hide password. Never log this value.'),
        ]),
        sec('Other secure methods', [
          chk('Use a passkey'),
          chk('Continue with password + MFA'),
          p('MFA follows credential confirmation. A local biometric unlock is an optional device feature.'),
        ]),
        sec('Need help?', [
          p('Too many attempts? Wait for the lockout period or use secure recovery. Do not reveal whether a contact is registered.'),
          row('Forgot your password?', 'ONB-13', to: 'ONB-13'),
          row('New to TransferMe?', 'ONB-01', to: 'ONB-01'),
        ]),
        sec('Actions', [
          btn('Continue to verification', 'primary', to: 'BRW-01'),
          btn('Recover access', 'secondary', to: 'ONB-13'),
        ]),
      ]),
      S('ONB-13', 'Recover your access', 'Secure reset · keep your account protected', [
        sec('Request recovery', [
          p('If an eligible account matches, we would send secure recovery instructions. No message is sent in this design.'),
          field('Email or mobile', 'lerato.d•••@example.test'),
        ]),
        sec('Reset password · after proof', [
          field('New password', '••••••••••••', 'At least 12 characters; reject breached passwords.'),
          field('Confirm password', '••••••••••••'),
          p('Reset token is single-use and time-limited. Do not reset from contact entry alone.'),
        ]),
        sec('Confirmation state', [
          badge('✓ Password updated · example', 'ok'),
          p('Other sessions are revoked according to security policy. Sign in again and review active sessions. Your loans and history are unchanged.'),
        ], tone: 'ok'),
        sec('Actions', [
          btn('Send recovery instructions', 'primary', to: 'ONB-13'),
          btn('Return to sign in', 'secondary', to: 'ONB-12'),
        ]),
        foot('Successful proof → reset form → server confirmation → ONB-12. MFA recovery needs additional approved checks.'),
      ]),
    ];
