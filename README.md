# TransferMe – Flutter app (from the Figma design)

Source design: Figma file `ZRGUX7kQyESLzbB7SkonDy` ("Small Money" adaptation, product name *TransferMe*).

> **Status – read first**
> * The code was written without a Flutter SDK in the build environment, so it has **not been compiled or run**. Run `flutter pub get && flutter analyze && flutter test` first and expect to fix a few small things.
> * **46 screens are imported** (12 onboarding, 17 borrower, 17 lender, incl. the BRW-01 home dashboard added last). The remaining Figma frames could not be read because the Figma MCP call limit on the current plan was hit. They are listed in `lib/app/pending_figma_screens.dart` and open a placeholder page, so every link in the flow still resolves.

## Run

```bash
flutter create . --platforms=android,ios,web   # generates the platform folders only (keeps lib/ and pubspec.yaml)
flutter pub get
flutter run
```

The app opens on a **screen gallery** (`/gallery`) listing every screen. To boot straight into the product use `AppConfig(startRoute: '/screen/ONB-01')`.

Fonts: the design uses **DM Sans** and **Comfortaa**. Add the `.ttf` files to `assets/fonts/` and uncomment the `fonts:` block in `pubspec.yaml`. Until then the platform font is used.

## Architecture

```
lib/
  main.dart
  app/                       composition root
    app.dart                 MaterialApp, theme + config injection
    app_router.dart          /screen/<ID> and /gallery, placeholders for missing screens
    modules.dart             the list of feature modules  <-- add new modules here
    pending_figma_screens.dart  frames not yet imported (with Figma node ids)
  core/
    theme/                   app_tokens.dart (colours, radii, spacing, type) + app_theme.dart
    config/                  app_config.dart (brand name, sample badge, start route)
    ui/                      reusable design-system widgets (one file each)
    spec/                    screen_spec.dart (content model), spec_dsl.dart, spec_renderer.dart
    navigation/              feature_module.dart (module + registry), app_navigation.dart
    pages/                   ScreenSpecPage, GalleryPage, PlaceholderPage
  features/
    onboarding/              onboarding_screens.dart + onboarding_module.dart
    borrower/                borrower_screens.dart  + borrower_module.dart
    lender/                  lender_screens.dart    + lender_module.dart
test/screens_test.dart
```

### How a screen is built

Screens in the file repeat one small vocabulary (section card, heading, supporting copy, amount, detail row, status badge, checklist, form field, progress, button). So each screen is **data** (`ScreenSpec`) and a single renderer (`SpecRenderer`) maps every block to a design-system widget.

```dart
S('BRW-09', 'Your received offers', 'TM-2048 · separate published scenario', [
  sec('Offer A · Sample Lender A', [
    badge('Available until 23 Oct · 17:00 SAST'),
    h('Offer A · Sample Lender A'),
    amt('R 3,240.00'),
    row('Net proceeds', 'R 3,000.00'),
    btn('Review Offer A', 'primary', to: 'BRW-11'),
  ]),
]),
```

Names mirror the Figma layer names (`Detail row` → `row`, `Status badge` → `badge`, `Financial amount` → `amt`, `Action` → `btn`), so a new frame can be transcribed line by line.

### Customising the UX

| I want to… | Change |
|---|---|
| Re-skin colours, radii, spacing, fonts | `AppTokens` in `core/theme/app_tokens.dart`, or pass your own `AppTokens(colors: AppColors(primary: …))` to `TransferMeApp(tokens: …)` |
| Change how every detail row / badge / button looks | the widget in `core/ui/` |
| Change which widget draws a block | override `SpecRenderer.buildBlock` and pass the subclass to `ScreenSpecPage(renderer: …)` |
| Hide the "SAMPLE DATA" pill, rename the brand, change the start screen | `AppConfig` |
| Change bottom-bar tabs or which tab a screen highlights | the module file (`*_module.dart`) |
| Add an area of the app | new folder in `features/`, a `FeatureModule`, register it in `app/modules.dart` |
| Replace a generated screen with a hand-built one | register a custom route in `AppRouter._screen` before the registry lookup |

### Design-system widgets (`core/ui`)

`AppButton` (primary / secondary / tertiary / danger, loading, disabled) · `AppTextField` (incl. password toggle) · `AppSelectField` · `StatusBadge` · `SectionCard` (+ tones: plain, success, warning, error, dark) · `DetailRow` · `AmountText` · `ChecklistItem` · `AppProgressBar` · `AppBottomNav` · `ScreenScaffold`. Import them all with `core/ui/design_system.dart`.

## Getting the files

The project is a plain folder of 36 text files (no generated platform code). Ways to use it:

1. **Zip download:** `transferme_app.zip`, delivered with this README. Unzip it anywhere, e.g. `~/dev/transferme_app`.
2. **Put it in git:** `cd transferme_app && git init && git add . && git commit -m "Initial import from Figma"`, then push to your own GitHub/GitLab repo so the team shares one copy.
3. **Run it:**
   ```bash
   cd transferme_app
   flutter create . --platforms=android,ios,web   # adds platform folders, keeps lib/ and pubspec.yaml
   flutter pub get
   flutter analyze && flutter test
   flutter run                                    # opens the screen gallery
   ```
   Requires Flutter 3.19+ (Dart 3.3+).

## Still to import (needs Figma access)

Done in the last session: BRW-01 only, because the Figma MCP quota ran out again. Remaining, with node ids, in `lib/app/pending_figma_screens.dart`: ONB-09, BRW-04, LND-04, BRW-10, BRW-12, BRW-14, SHR-RECEIPT, plus the 38 legacy "Small Money" frames (splash, onboarding 6-26, auth, transaction, success). Each frame's text goes in as an `S(...)` entry in the matching `features/*/…_screens.dart`; delete its `PendingFrame` entry afterwards.

## Screen map

| Module | Figma ids | Imported |
|---|---|---|
| Onboarding & identity | ONB-01 … ONB-13 | ONB-01…ONB-13 except ONB-09 (route frame `/verification`, node `321:1193`) |
| Borrower | BRW-01, 02, 03, 05, 06, 07, 08, 09, 11, 13, 15–21 | yes |
| Borrower, linked but pending | BRW-04 `/loans/new`, BRW-10 offers, BRW-12 agreement, BRW-14 loan tracking, receipt | placeholders (nodes `321:1322`, `321:1659`, `321:1826`, `321:1988`, `321:2147`) |
| Lender | LND-01 … LND-03, LND-05 … LND-18 | yes |
| Lender, linked but pending | LND-04 `/marketplace` | placeholder (node `321:1490`) |
| Earlier "Small Money" flows | splash, onboarding 6–26, login, register, transfer, success (39 frames, 375×812) | pending – see `pending_figma_screens.dart` |
| Support / shared / state variants | SUP-01…11, SHR-01…04, ST-xx | linked from many screens but **no frames exist in the file**; the five `Building …` frames (Lifecycle, Admin, Support, States, Handoff) contain only empty rectangles |

The mapping of route frames to ids (for example `/home` → BRW-01) is inferred from the cross references between screens; check it when importing.

## Deviations from the Figma file (deliberate)

* The "Static destination" captions and the per-screen "Fictional sample only…" footers are not repeated as text. Destinations became real navigation and the footer is generated (`AppConfig.sampleFooter`).
* Consent sentences that were plain paragraphs (for example "I reviewed the amount, method and allocation.") are rendered as unchecked checkboxes.
* ONB-12 "Continue to verification" links to BRW-01 instead of to itself.
* The bottom tab bar appears on onboarding screens because the frames show it; return an empty `nav` list in `onboarding_module.dart` to hide it.
* Which tab is highlighted is decided per module (the file's active marker could not be read reliably).
* Colours, fonts, sizes and radii come from an aggregate of the design-system section and five sample screens; exact paddings and the button radius were not measured, so compare against the frames when polishing.

## Next steps

1. `flutter analyze` and `flutter test`, fix anything the compiler flags.
2. Re-run the Figma import for the frames in `pending_figma_screens.dart` once the MCP limit resets (or upgrade the plan).
3. Replace mock actions (`AppNavigation.notConnected`) with real use cases; the spec layer is UI only, so add state management (Riverpod / Bloc) per module as needed.
