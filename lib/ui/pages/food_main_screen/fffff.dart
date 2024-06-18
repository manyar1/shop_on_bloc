import 'dart:math';



Map<String, Map<String, double>> ratings = {
  'user1': {'item1': 3, 'item2': 4, 'item3': 5},
  'user2': {'item1': 4, 'item2': 3, 'item3': 2},
  'user3': {'item1': 5, 'item2': 2, 'item3': 3},
};




Map<String, double> calculateMeanRatings(Map<String, Map<String, double>> ratings) {
  Map<String, double> meanRatings = {};
  ratings.forEach((user, items) {
    items.forEach((item, rating) {
      if (!meanRatings.containsKey(item)) {
        meanRatings[item] = 0;
      }
      meanRatings[item] = meanRatings[item]! + rating;
    });
  });
  meanRatings.forEach((item, totalRating) {
    meanRatings[item] = meanRatings[item]! / ratings.length.toDouble();
  });
  return meanRatings;
}

// Функция для вычисления корреляции Пирсона между двумя товарами
double pearsonCorrelation(
    Map<String, double> ratings1, Map<String, double> ratings2) {
  double sumXY = 0, sumX = 0, sumY = 0, sumXSquare = 0, sumYSquare = 0;
  int n = 0;

  ratings1.forEach((user, rating) {
    if (ratings2.containsKey(user)) {
      sumXY += rating * ratings2[user]!;
      sumX += rating;
      sumY += ratings2[user]!;
      sumXSquare += pow(rating, 2);
      sumYSquare += pow(ratings2[user]!, 2);
      n++;
    }
  });

  if (n == 0) {
    return 0; // Если нет общих пользователей, возвращаем 0
  }

  double numerator = sumXY - (sumX * sumY / n);
  double denominator = sqrt((sumXSquare - pow(sumX, 2) / n) *
      (sumYSquare - pow(sumY, 2) / n));

  if (denominator == 0) {
    return 0; // Если знаменатель равен 0, возвращаем 0
  }

  return numerator / denominator;
}

void main() {
  // Вычисляем средние оценки для каждого товара
  Map<String, double> meanRatings = calculateMeanRatings(ratings);

  // Вычисляем корреляцию Пирсона между товарами
  ratings.keys.forEach((user) {
    ratings[user]!.forEach((item1, rating1) {
      ratings[user]!.forEach((item2, rating2) {
        if (item1 != item2) {
          // ignore: unused_local_variable
          final double correlation = pearsonCorrelation(
              {user: rating1 - meanRatings[item1]!},
              {user: rating2 - meanRatings[item2]!});
        }
      });
    });
  });
}