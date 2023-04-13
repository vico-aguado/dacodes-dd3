import 'package:dacodes_dd3/main.dart';
import 'package:dacodes_dd3/src/utils/keys.dart';
import 'package:dacodes_dd3/src/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'common.dart';

void main() {
  group('App', () {
    patrol(
      'Test Theme & Languaje buttons',
      (PatrolTester $) async {
        WidgetsFlutterBinding.ensureInitialized();
        await preferences.init();
        await $.pumpWidgetAndSettle(SuperHeoresApp());
        await Future.delayed(const Duration(milliseconds: 600), () {});
        await $.pumpAndSettle();
        expect($(AppKeys.themeButtonKey), findsOneWidget);
        await $(AppKeys.themeButtonKey).tap();
        await $.pumpAndSettle();
        expect(find.text('Personajes'), findsOneWidget);
        expect($(AppKeys.languajeButtonKey), findsOneWidget);
        await $(AppKeys.languajeButtonKey).tap();
        await $.pumpAndSettle();
        expect(find.text('Characters'), findsOneWidget);
      },
    );
  });
}
