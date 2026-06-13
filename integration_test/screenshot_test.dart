// Captures screenshots of all major app screens for the user manual.
//
// Run with:
//   flutter test integration_test/screenshot_test.dart -d macos
//
// Screenshots are written to <project>/assets/docs/screenshots/ when run
// from the project root. If Directory.current is not writable (e.g. on
// other platforms), screenshots fall back to the app documents directory
// under "screenshots/".

import 'dart:io';
import 'dart:ui' as ui;

import 'package:avaremp/main.dart';
import 'package:avaremp/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

late Directory _outDir;
final GlobalKey _rootKey = GlobalKey();

Future<Directory> _resolveOutputDir() async {
  // App-sandbox friendly: always write to the app documents directory.
  // After the test runs, copy this folder to assets/docs/screenshots/.
  final docs = await getApplicationDocumentsDirectory();
  final d = Directory('${docs.path}/avarex_screenshots');
  if (!d.existsSync()) d.createSync(recursive: true);
  return d;
}

Future<void> _shot(WidgetTester tester, String name) async {
  // Allow rendering to settle a bit; many screens have animations.
  for (int i = 0; i < 6; i++) {
    await tester.pump(const Duration(milliseconds: 120));
  }
  try {
    await tester.pumpAndSettle(const Duration(milliseconds: 800));
  } catch (_) {
    // pumpAndSettle can throw on screens with continuous animation; ignore.
  }
  final ctx = _rootKey.currentContext;
  if (ctx == null) {
    debugPrint('Screenshot $name: no root context');
    return;
  }
  if (!ctx.mounted) {
    debugPrint('Screenshot $name: root context unmounted');
    return;
  }
  final ro = ctx.findRenderObject();
  if (ro is! RenderRepaintBoundary) {
    debugPrint('Screenshot $name: root render object is not a RepaintBoundary');
    return;
  }
  try {
    final image = await ro.toImage(pixelRatio: 2.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      debugPrint('Screenshot $name: byteData null');
      return;
    }
    final bytes = byteData.buffer.asUint8List();
    final file = File('${_outDir.path}/$name.png');
    await file.writeAsBytes(bytes);
    debugPrint('Screenshot saved: ${file.path} (${bytes.length} bytes)');
  } catch (e) {
    debugPrint('Screenshot $name failed: $e');
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Capture all screen screenshots',
      (tester) async {
    _outDir = await _resolveOutputDir();
    debugPrint('Screenshots will be written to: ${_outDir.path}');

    // Initialize storage but keep existing user state (databases, signed flag).
    await Storage().init();
    // Make sure we don't show the intro pages: capture them in a separate
    // section below by toggling intro back on for a fresh widget tree.
    Storage().settings.setIntro(false);

    await tester.pumpWidget(RepaintBoundary(
      key: _rootKey,
      child: const MainApp(),
    ));

    // Give the app time to settle and load initial data
    await Future.delayed(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 1));

    Finder fab;

    // Sometimes a permissions / GPS toast appears — try to dismiss
    fab = find.byTooltip('Close');
    if (tester.any(fab)) {
      await tester.tap(fab.first);
      await tester.pump(const Duration(milliseconds: 300));
    }

    // ===========================================
    // MAP tab (default screen after onboarding)
    // ===========================================
    fab = find.byTooltip('View the maps and overlays');
    if (tester.any(fab)) {
      await tester.tap(fab);
      await tester.pump(const Duration(milliseconds: 500));
    }
    await _shot(tester, '01_map_tab');

    // Open layers popup
    fab = find.byIcon(Icons.layers);
    if (tester.any(fab)) {
      await tester.tap(fab.first);
      await tester.pump(const Duration(milliseconds: 600));
      await _shot(tester, '02_map_layers_popup');
      // Tap somewhere else to dismiss
      await tester.tapAt(const Offset(50, 50));
      await tester.pump(const Duration(milliseconds: 400));
    }

    // Open chart-type popup
    fab = find.byIcon(Icons.map);
    if (tester.any(fab)) {
      await tester.tap(fab.first);
      await tester.pump(const Duration(milliseconds: 600));
      await _shot(tester, '03_map_chart_types');
      await tester.tapAt(const Offset(50, 50));
      await tester.pump(const Duration(milliseconds: 400));
    }

    // ===========================================
    // Drawer (Menu)
    // ===========================================
    fab = find.widgetWithText(TextButton, 'Menu');
    if (tester.any(fab)) {
      await tester.tap(fab);
      await tester.pump(const Duration(milliseconds: 700));
      await _shot(tester, '04_drawer_menu');

      // Close drawer
      await tester.tapAt(const Offset(700, 300));
      await tester.pump(const Duration(milliseconds: 400));
    }

    // ===========================================
    // Download screen (via route)
    // ===========================================
    final navState = tester.state<NavigatorState>(find.byType(Navigator).first);
    Future<void> goRoute(String route, String shotName) async {
      navState.pushNamed(route);
      await tester.pump(const Duration(milliseconds: 600));
      await Future.delayed(const Duration(milliseconds: 800));
      await tester.pump(const Duration(milliseconds: 400));
      await _shot(tester, shotName);
      // Pop back
      navState.pop();
      await tester.pump(const Duration(milliseconds: 500));
    }

    await goRoute('/download', '05_download_screen');

    // Download screen with a category expanded
    navState.pushNamed('/download');
    await tester.pump(const Duration(milliseconds: 1000));
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 300));
    fab = find.widgetWithText(ExpansionTile, 'Sectional');
    if (tester.any(fab)) {
      await tester.tap(fab.first);
      await tester.pump(const Duration(milliseconds: 800));
      await _shot(tester, '06_download_sectional_expanded');
    }
    navState.pop();
    await tester.pump(const Duration(milliseconds: 500));

    await goRoute('/documents', '07_documents_screen');
    await goRoute('/checklists', '08_checklists_screen');

    // Aircraft & Performance with all tabs
    navState.pushNamed('/performance');
    await tester.pump(const Duration(milliseconds: 800));
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 300));
    await _shot(tester, '09_aircraft_performance');

    final tabs = <String, String>{
      'T/O': '10_aircraft_takeoff',
      'L/D': '11_aircraft_landing',
      'Cruise': '12_aircraft_cruise',
      'W&B': '13_aircraft_wnb',
      'My Aircraft': '14_aircraft_my',
    };
    for (final entry in tabs.entries) {
      final f = find.text(entry.key);
      if (tester.any(f)) {
        await tester.tap(f.first);
        await tester.pump(const Duration(milliseconds: 600));
        await Future.delayed(const Duration(milliseconds: 400));
        await tester.pump(const Duration(milliseconds: 300));
        await _shot(tester, entry.value);
      }
    }
    navState.pop();
    await tester.pump(const Duration(milliseconds: 500));

    await goRoute('/logbook', '15_logbook_screen');

    // Notes screen with sheet picker and CRAFT
    navState.pushNamed('/notes');
    await tester.pump(const Duration(milliseconds: 800));
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 300));
    await _shot(tester, '16_notes_screen');

    fab = find.byIcon(Icons.note_alt_outlined);
    if (tester.any(fab)) {
      await tester.tap(fab.first);
      await tester.pump(const Duration(milliseconds: 700));
      await _shot(tester, '17_notes_sheet_picker');
      final craft = find.text('CRAFT');
      if (tester.any(craft)) {
        await tester.tap(craft.first);
        await tester.pump(const Duration(milliseconds: 700));
        await _shot(tester, '18_notes_craft');
      }
    }
    navState.pop();
    await tester.pump(const Duration(milliseconds: 500));

    // PLAN tab and actions
    fab = find.byTooltip('Create a flight plan');
    if (tester.any(fab)) {
      await tester.tap(fab);
      await tester.pump(const Duration(milliseconds: 700));
      await _shot(tester, '19_plan_tab');

      fab = find.widgetWithText(TextButton, 'Actions');
      if (tester.any(fab)) {
        await tester.tap(fab.first);
        await tester.pump(const Duration(milliseconds: 700));
        await _shot(tester, '20_plan_actions');
        // back
        final back = find.byTooltip('Back');
        if (tester.any(back)) {
          await tester.tap(back.first);
          await tester.pump(const Duration(milliseconds: 400));
        }
      }

      // Navigation log button
      fab = find.byTooltip('Navigation log and terrain');
      if (!tester.any(fab)) fab = find.byIcon(Icons.analytics_outlined);
      if (tester.any(fab)) {
        await tester.tap(fab.first);
        await tester.pump(const Duration(milliseconds: 900));
        await Future.delayed(const Duration(milliseconds: 500));
        await tester.pump(const Duration(milliseconds: 300));
        await _shot(tester, '21_plan_navlog');
        final back = find.byTooltip('Back');
        if (tester.any(back)) {
          await tester.tap(back.first);
          await tester.pump(const Duration(milliseconds: 400));
        }
      }
    }

    // FIND tab
    fab = find.byTooltip('Search for Airports, NavAids, etc.');
    if (tester.any(fab)) {
      await tester.tap(fab);
      await tester.pump(const Duration(milliseconds: 700));
      await _shot(tester, '22_find_tab');

      final searchField = find.ancestor(
        of: find.text('Search'),
        matching: find.byType(TextFormField),
      );
      if (tester.any(searchField)) {
        await tester.enterText(searchField.first, 'KSBA');
        await tester.pump(const Duration(milliseconds: 400));
        await Future.delayed(const Duration(seconds: 1));
        await tester.pump(const Duration(milliseconds: 400));
        await _shot(tester, '23_find_search_ksba');
      }
    }

    // PLATE tab
    fab = find.byTooltip('Look at approach plates, airport diagrams, CSUP, Minimums, etc.');
    if (tester.any(fab)) {
      await tester.tap(fab);
      await tester.pump(const Duration(milliseconds: 700));
      await _shot(tester, '24_plate_tab');
    }

    // Weight & Balance
    await goRoute('/wnb', '25_weight_balance_screen');

    // Weather / Documents-style route coverage already partly covered; show documents again if needed
    await goRoute('/documents', '26_documents_screen_repeat');

    // Intro/onboarding capture via separate fresh widget tree
    Storage().settings.setIntro(true);
    await tester.pumpWidget(RepaintBoundary(
      key: _rootKey,
      child: const MainApp(),
    ));
    await tester.pump(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    await tester.pump(const Duration(milliseconds: 400));
    await _shot(tester, '27_intro_welcome');

    // Step through a couple of onboarding pages
    fab = find.widgetWithIcon(TextButton, Icons.arrow_forward);
    if (tester.any(fab)) {
      await tester.tap(fab.first);
      await tester.pump(const Duration(milliseconds: 600));
      await _shot(tester, '28_intro_next');
      if (tester.any(fab)) {
        await tester.tap(fab.first);
        await tester.pump(const Duration(milliseconds: 600));
        await _shot(tester, '29_intro_next_2');
      }
    }

    // Restore non-intro for final map shot
    Storage().settings.setIntro(false);
    await tester.pumpWidget(RepaintBoundary(
      key: _rootKey,
      child: const MainApp(),
    ));
    await tester.pump(const Duration(seconds: 2));
    await _shot(tester, '30_map_after_intro_reset');

    // Optional IO route if available on platform
    final menu = find.widgetWithText(TextButton, 'Menu');
    if (tester.any(menu)) {
      await tester.tap(menu.first);
      await tester.pump(const Duration(milliseconds: 700));
      final ioItem = find.text('IO');
      if (tester.any(ioItem)) {
        await tester.tap(ioItem.first);
        await tester.pump(const Duration(milliseconds: 700));
        await _shot(tester, '31_io_screen');
        final back = find.byTooltip('Back');
        if (tester.any(back)) {
          await tester.tap(back.first);
          await tester.pump(const Duration(milliseconds: 400));
        }
      }
    }

    // Final map tab shot
    fab = find.byTooltip('View the maps and overlays');
    if (tester.any(fab)) {
      await tester.tap(fab.first);
      await tester.pump(const Duration(milliseconds: 700));
      await _shot(tester, '32_map_tab_final');
    }

    debugPrint('Screenshot test complete. Output dir: ${_outDir.path}');
  }, timeout: const Timeout(Duration(minutes: 8)));
}
