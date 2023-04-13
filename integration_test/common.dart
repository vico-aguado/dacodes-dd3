import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
export 'package:flutter_test/flutter_test.dart';
export 'package:patrol/patrol.dart';

void patrol(
  String description,
  Future<void> Function(PatrolTester) callback, {
  int? secondsTimeout,
}) {
  patrolTest(
    description,
    ($) async {
      await callback($);
    },
    timeout: const Timeout(Duration(minutes: 5)),
    config: patrolTesterConfig(secondsTimeout ?? 10),
    nativeAutomation: true,
    nativeAutomatorConfig: nativeAutomatorConfig,
  );
}

PatrolTesterConfig patrolTesterConfig(int secondsTimeout) => PatrolTesterConfig(
      visibleTimeout: Duration(seconds: secondsTimeout),
      existsTimeout: Duration(seconds: secondsTimeout),
      settleTimeout: Duration(seconds: secondsTimeout),
    );

const nativeAutomatorConfig = NativeAutomatorConfig(
  packageName: 'dacodes_dd3',
  bundleId: 'com.example.dacodes_dd3',
);
