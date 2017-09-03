// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:randchoice/randchoice.dart';
import 'package:test/test.dart';

void main() {
  group('A group of happy path choice tests', () {
    test('Empty List', () {
      expect(RandomChoice.choices([]).length, 0);
    });

    test('Short list should return the single item', () {
      expect(RandomChoice.choices([1]).length, 1);
    });

    test('List of 1 should return the single item', () {
      expect(RandomChoice.choices([1])[0], 1);
    });

    test('List should return the single item from selection', () {
      expect(RandomChoice.choices([1, 2, 3])[0], anyOf(1, 2, 3));
    });

    test('List should return the 2 items from selection', () {
      List<int> results = RandomChoice.choices([1, 2, 3], 3);
      expect(results[0], anyOf(1, 2, 3));
      expect(results[1], anyOf(1, 2, 3));
      expect(results.length, 3);
    });

    test('List should return the 10 items from selection', () {
      List<String> results =
          RandomChoice.choices(['elephant', 'frog'], 10, [4, 1]);
      expect(results.length, 10);
      results.forEach((String entry) {
        expect(entry, anyOf(['elephant', 'frog']));
      });
    });
  });
}
