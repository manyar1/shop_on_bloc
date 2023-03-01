import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final num price;
  final num gram;
  final String imgUrl;
  final String imgUrl2;

  FoodEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.gram,
    required this.imgUrl,
    required this.imgUrl2,
  });

  @override
  List<Object?> get props =>
      [id, title, description, price, gram, imgUrl, imgUrl2];
}
