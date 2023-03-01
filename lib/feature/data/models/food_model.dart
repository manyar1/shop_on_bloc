import 'package:shop_on_block/feature/domain/entities/food_entity.dart';


class FoodModel extends FoodEntity {
  FoodModel(
      {required id,
      required title,
      required description,
      required price,
      required gram,
      required imgUrl,
      required imgUrl2})
      : super(
            id: id,
            title: title,
            description: description,
            price: price,
            gram: gram,
            imgUrl: imgUrl,
            imgUrl2: imgUrl2);
}