import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Module 4', () {
    final profileTap = find.byValueKey('tap_to_profile');
    final profileName = find.byValueKey('profile_name');

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

    test('module 4', () async {
      await driver.tap(profileTap);

      await Future.delayed(Duration(seconds: 7));
      expect(await driver.getText(profileName), isNotEmpty);
    });
  });
}
