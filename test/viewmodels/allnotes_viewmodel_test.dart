import 'package:flutter_test/flutter_test.dart';
import 'package:unievents/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AllnotesViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
