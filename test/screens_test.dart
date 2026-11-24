import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transferme_app/app/app.dart';
import 'package:transferme_app/app/modules.dart';
import 'package:transferme_app/app/pending_figma_screens.dart';
import 'package:transferme_app/core/config/app_config.dart';
import 'package:transferme_app/core/pages/screen_spec_page.dart';
import 'package:transferme_app/core/theme/app_theme.dart';

void useTallPhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(1170, 7200); // 390 x 2400 at 3x
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  test('screen ids are unique', () {
    final seen = <String>{};
    for (final module in buildModules()) {
      for (final screen in module.screens) {
        expect(seen.add(screen.id), isTrue, reason: 'duplicate ${screen.id}');
      }
    }
  });

  test('every link target is imported, pending or flagged as undesigned', () {
    final registry = buildRegistry();
    for (final id in registry.unresolvedDestinations()) {
      final known =
          pendingFrameForScreen(id) != null || isUndesignedDestination(id);
      expect(known, isTrue, reason: '$id is linked but not accounted for');
    }
  });

  testWidgets('every imported screen renders without layout errors',
      (WidgetTester tester) async {
    useTallPhone(tester);
    final registry = buildRegistry();

    for (final module in registry.modules) {
      for (final screen in module.screens) {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.light(),
            home: ScreenSpecPage(spec: screen, module: module),
          ),
        );
        expect(find.text(screen.title), findsWidgets, reason: screen.id);
        expect(tester.takeException(), isNull, reason: screen.id);
      }
    }
  });

  testWidgets('buttons navigate between screens', (WidgetTester tester) async {
    useTallPhone(tester);
    await tester.pumpWidget(
      const TransferMeApp(config: AppConfig(startRoute: '/screen/ONB-01')),
    );

    expect(find.text('Money, with clarity'), findsOneWidget);
    await tester.tap(find.text('Create an account'));
    await tester.pumpAndSettle();
    expect(find.text('How will you use it?'), findsOneWidget);
  });

  testWidgets('gallery lists every module', (WidgetTester tester) async {
    useTallPhone(tester);
    await tester.pumpWidget(const TransferMeApp());

    expect(find.text('All screens'), findsOneWidget);
    expect(find.textContaining('Borrower experience'), findsOneWidget);
    expect(find.textContaining('Lender experience'), findsOneWidget);
  });
}
