import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Module 1', () {
    final profileTap = find.byValueKey('tap_to_profile');
    final homeTap = find.byValueKey('home_tab');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    test('module 1', () async {
      await driver.tap(profileTap);

      await Future.delayed(Duration(seconds: 7));
      await driver.tap(homeTap);
    });
  });
}
