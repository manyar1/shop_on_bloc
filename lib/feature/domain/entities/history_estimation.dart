import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final int idPerson;
  final int idFood;
  final String rating;

  const FoodEntity({
    required this.idPerson,
    required this.idFood,
    required this.rating,
  });

  @override
  List<Object?> get props => [idPerson, idFood, rating];
  factory FoodEntity.fromJson(Map<String, dynamic> json) {
    return FoodEntity(
      idPerson: json['idPerson'],
      idFood: json['idFood'],
      rating: json['rating'],
    );
  }
}
