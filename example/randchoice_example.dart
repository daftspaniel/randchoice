// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:randchoice/randchoice.dart';

main() {
  print('\nExample 1 - Pick 1 from a list.');
  print(RandomChoice.choices(['a', 'b', 'c'])[0]);

  print('\nExample 2 - Pick 2 from a list.');
  var results = RandomChoice.choices(['red', 'green', 'blue', 'alpha'], 2);
  print(results[0]);
  print(results[1]);

  print('\nExample 3 - Pick 10 from a list and ');
  print('weight the elephants to be twice as likely.');
  results = RandomChoice.choices(['elephant', 'frog'], 10, [2, 1]);
  results.forEach((String animal) => print('\t$animal'));

  print('\nExample 4 - Pick 10 from a list and ');
  print('weight the elephants to be four times as likely.');
  results = RandomChoice.choices(['elephant', 'frog'], 10, [4, 1]);
  results.forEach((String animal) => print('\t$animal'));
}
