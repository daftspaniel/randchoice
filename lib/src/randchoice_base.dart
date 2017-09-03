// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';

/// Utitlity class for making random selections from [List]s.
class RandomChoice {
  static final Random rng = new Random();

  /// Returns a specified number of random choice(s) of from a [List] of items
  static List<T> choices<T>(List<T> population, [count = 1, weights = null]) {
    final List<T> results = [];

    if (population != null && population.length > 0) {
      if (weights != null) {
        population = buildWeightedPopulation(population, weights);
      }

      while (results.length < count) addRandomItemFromList(population, results);
    }
    return results;
  }

  static List<T> buildWeightedPopulation<T>(List<T> population, weights) {
    final List<T> weightedPopulation = [];

    for (int i = 0; i < population.length; i++) {
      List<T> values = new List.filled(weights[i], population[i]);
      weightedPopulation.addAll(values);
    }
    population = weightedPopulation;
    return population;
  }

  static void addRandomItemFromList(List population, List results) {
    int index = rng.nextInt(population.length);
    results.add(population.elementAt(index));
  }
}
