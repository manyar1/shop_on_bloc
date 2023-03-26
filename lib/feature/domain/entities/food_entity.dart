import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final double gram;
  final String imgUrl;
  final String imgUrl2;

  const FoodEntity({
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
