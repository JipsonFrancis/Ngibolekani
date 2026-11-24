/// Frames that exist in the Figma file but were not imported yet.
///
/// The Figma MCP rate limit ended the first import after the 45 screens in
/// `lib/features/**`. Re-run the extraction for these node ids (file key
/// `ZRGUX7kQyESLzbB7SkonDy`), add each as a `S(...)` entry in the right
/// feature file and delete it from this list. Until then they open a
/// placeholder page so every link in the flow resolves.
class PendingFrame {
  const PendingFrame({
    required this.group,
    required this.name,
    required this.nodeId,
    this.screenId,
  });

  final String group;
  final String name;

  /// Figma node id, e.g. `321:1052`.
  final String nodeId;

  /// Id other screens link to, when the design's cross references show it.
  final String? screenId;
}

/// Route-named frames (375 wide). `screenId` is inferred from the links in the
/// imported screens (for example BRW-11 links to BRW-12 "Review agreement").
const List<PendingFrame> pendingRouteScreens = <PendingFrame>[
  PendingFrame(
    group: 'Onboarding',
    name: '/verification · Identity verification',
    nodeId: '321:1193',
    screenId: 'ONB-09',
  ),
  PendingFrame(
    group: 'Borrower',
    name: '/loans/new · Request a loan',
    nodeId: '321:1322',
    screenId: 'BRW-04',
  ),
  PendingFrame(
    group: 'Lender',
    name: '/marketplace · Lending marketplace',
    nodeId: '321:1490',
    screenId: 'LND-04',
  ),
  PendingFrame(
    group: 'Borrower',
    name: '/loans/TM-2048/offers · Compare offers',
    nodeId: '321:1659',
    screenId: 'BRW-10',
  ),
  PendingFrame(
    group: 'Borrower',
    name: '/agreements/AG-2048 · Loan agreement',
    nodeId: '321:1826',
    screenId: 'BRW-12',
  ),
  PendingFrame(
    group: 'Borrower',
    name: '/loans/TM-1042 · Loan tracking',
    nodeId: '321:1988',
    screenId: 'BRW-14',
  ),
  PendingFrame(
    group: 'Shared',
    name: '/transactions/TX-1042-02 · Transaction details',
    nodeId: '321:2147',
    screenId: 'SHR-RECEIPT',
  ),
];

/// The earlier 375x812 "Small Money" flows (splash, onboarding carousel,
/// login, register, transfer, success). Not imported yet.
const List<PendingFrame> pendingLegacyFlows = <PendingFrame>[
  PendingFrame(group: 'Splash', name: 'Splash Screen', nodeId: '14:1341'),
  PendingFrame(group: 'Splash', name: 'Splash Screen (alt)', nodeId: '14:4682'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 6', nodeId: '14:1053'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 7', nodeId: '14:1064'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 11', nodeId: '14:4714'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 12', nodeId: '14:5149'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 13', nodeId: '14:5395'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 14', nodeId: '14:5693'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 15', nodeId: '14:6016'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 16', nodeId: '14:6213'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 17', nodeId: '14:6227'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 18', nodeId: '23:607'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 19', nodeId: '23:620'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 20', nodeId: '23:694'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 21', nodeId: '23:862'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 22', nodeId: '23:998'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 23', nodeId: '23:1191'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 24', nodeId: '23:1389'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 25', nodeId: '23:1423'),
  PendingFrame(group: 'Onboarding', name: 'Onboarding 26', nodeId: '23:1688'),
  PendingFrame(group: 'Auth', name: 'Logged out', nodeId: '1:2'),
  PendingFrame(group: 'Auth', name: 'Register (step 1)', nodeId: '3:49'),
  PendingFrame(group: 'Auth', name: 'Register (step 1) alt', nodeId: '4:1201'),
  PendingFrame(group: 'Auth', name: 'Register (step 2)', nodeId: '3:249'),
  PendingFrame(group: 'Auth', name: 'Login', nodeId: '3:582'),
  PendingFrame(group: 'Auth', name: 'Login (2)', nodeId: '4:1479'),
  PendingFrame(group: 'Auth', name: 'Login (3)', nodeId: '4:1017'),
  PendingFrame(group: 'Auth', name: 'Login (4)', nodeId: '3:767'),
  PendingFrame(group: 'Auth', name: 'Login (5)', nodeId: '5:1913'),
  PendingFrame(group: 'Transfer', name: 'Transaction', nodeId: '7:140'),
  PendingFrame(group: 'Transfer', name: 'Transaction (2)', nodeId: '14:1507'),
  PendingFrame(group: 'Transfer', name: 'Transaction (3)', nodeId: '14:2631'),
  PendingFrame(group: 'Transfer', name: 'Transaction (4)', nodeId: '14:2949'),
  PendingFrame(group: 'Transfer', name: 'Transaction (5)', nodeId: '14:2749'),
  PendingFrame(group: 'Transfer', name: 'Transaction (6)', nodeId: '14:2357'),
  PendingFrame(
    group: 'Success',
    name: 'Registration - Successful',
    nodeId: '14:3039',
  ),
  PendingFrame(
    group: 'Success',
    name: 'Money Transfer - Successful',
    nodeId: '14:3121',
  ),
  PendingFrame(
    group: 'Success',
    name: 'Verification - Successful',
    nodeId: '14:3157',
  ),
  PendingFrame(
    group: 'Success',
    name: 'Verification - Successful (2)',
    nodeId: '14:5027',
  ),
  PendingFrame(
    group: 'Success',
    name: 'Verification - Successful (3)',
    nodeId: '14:4916',
  ),
];

/// Screen ids that imported screens link to but that have no frame in the
/// file (support centre SUP-xx, shared SHR-xx, state variants ST-xx).
bool isUndesignedDestination(String id) =>
    id.startsWith('SUP-') || id.startsWith('SHR-') || id.startsWith('ST-');

PendingFrame? pendingFrameForScreen(String id) {
  for (final frame in pendingRouteScreens) {
    if (frame.screenId == id) return frame;
  }
  return null;
}
