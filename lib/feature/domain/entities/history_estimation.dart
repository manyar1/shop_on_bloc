import 'package:equatable/equatable.dart';

class HistoryEstimationEntity extends Equatable {
  final int idPerson;
  final int idFood;
  final String rating;

  const HistoryEstimationEntity({
    required this.idPerson,
    required this.idFood,
    required this.rating,
  });

  @override
  List<Object?> get props => [idPerson, idFood, rating];
  factory HistoryEstimationEntity.fromJson(Map<String, dynamic> json) {
    return HistoryEstimationEntity(
      idPerson: json['idPerson'],
      idFood: json['idFood'],
      rating: json['rating'],
    );
  }
}
