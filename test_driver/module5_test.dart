import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Module 5', () {
    final profileTap = find.byValueKey('tap_to_profile');
    final homeTap = find.byValueKey('home_tab');
    final favoriteTap = find.byValueKey('favorite_tab');
    final bookmarkTap = find.byValueKey('bookmark_tab');
    final loadedImagesParent = find.byValueKey('loaded_images_parent');
    final loadedImage = find.byValueKey('loaded_image');

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

    test('Module 5', () async {
      await driver.tap(profileTap);
      await Future.delayed(Duration(seconds: 7));
      await driver.tap(homeTap);
      await Future.delayed(Duration(seconds: 5));
      await driver.tap(find.descendant(
          of: loadedImagesParent, matching: loadedImage, firstMatchOnly: true));
      await driver.tap(favoriteTap);
      await Future.delayed(Duration(seconds: 5));
      await driver.tap(find.descendant(
          of: loadedImagesParent, matching: loadedImage, firstMatchOnly: true));
      await driver.tap(bookmarkTap);
      await Future.delayed(Duration(seconds: 5));
      await driver.tap(find.descendant(
          of: loadedImagesParent, matching: loadedImage, firstMatchOnly: true));
    });
  });
}
