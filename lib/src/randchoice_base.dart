// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';

/// Returns a random choice from a [List] of items
class RandomChoice {
  static List<T> choices<T>(List<T> population,
      [count = 1, weights = null]) {
    List<T> results = [];

    if (population != null && population.length > 0) {
      if (weights != null) {
        population = buildWeightedPopulation(population, weights);
      }

      while (results.length < count) addRandomItemFromList(population, results);
    }
    return results;
  }

  static List<T> buildWeightedPopulation<T>(List<T> population, weights) {
    List<T> weightedPopulation = [];
    for (int i; i < population.length; i++) {
      List<T> values = new List.filled(weights[i], population[i]);
      weightedPopulation.addAll(values);
    }
    population = weightedPopulation;
    return population;
  }

  static void addRandomItemFromList(List population, List results) {
    Random rng = new Random();
    int index = rng.nextInt(population.length);
    results.add(population.elementAt(index));
  }
}
