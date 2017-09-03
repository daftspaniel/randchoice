// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';

/// Utility class for making random selections from [List]s.
class RandomChoice {
  static final Random rng = new Random();

  /// Returns a specified number of random choice(s) of from a [List] of items
  static List<T> choices<T>(List<T> population, [count = 1, weights = null]) {
    final List<T> results = [];

    if (population != null && population.length > 0) {
      if (weights != null) {
        population = buildWeightedPopulation(population, weights);
      }

      while (results.length < count) addRandomItem(population, results);
    }
    return results;
  }

  /// Returns a [List] of items each weighted by particular value
  static List<T> buildWeightedPopulation<T>(
      List<T> population, List<int> weights) {
    final List<T> weightedPopulation = [];

    for (int i = 0; i < population.length; i++) {
      List<T> values = new List.filled(weights[i], population[i]);
      weightedPopulation.addAll(values);
    }
    population = weightedPopulation;
    return population;
  }

  /// Adds a random item from one list to another [List]
  static void addRandomItem(List population, List results) {
    int index = rng.nextInt(population.length);
    results.add(population.elementAt(index));
  }
}
