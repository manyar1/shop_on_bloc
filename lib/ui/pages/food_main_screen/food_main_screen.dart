import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/widget/cart_widgets/add_in_cart_main.dart';
import 'package:shop_on_block/ui/widget/secondary_screens_widgets/price_and_gram.dart';

class FoodMainScreen extends StatefulWidget {
  final FoodEntity foodsList;
  const FoodMainScreen({super.key, required this.foodsList});

  @override
  State<FoodMainScreen> createState() => _FoodMainScreenState();
}

class _FoodMainScreenState extends State<FoodMainScreen> {
  @override
  Widget build(BuildContext context) {
     double value = 3.5;
    const i = 1;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.foodsList.title,
            style: const TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Hero(
              tag: widget.foodsList.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.foodsList.imgUrl), fit: BoxFit.contain),
                ),
              ),
            ),
                       Center(
          child: RatingStars(
            value: value,
            onValueChanged: (v) {
              //
              setState(() {
                value = v;
              });
            },
            starBuilder: (index, color) => Icon(
              Icons.star_rate,
              color: color,
            ),
            starCount: 5,
            starSize: 20,
            valueLabelColor: const Color(0xff9b9b9b),
            valueLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            valueLabelRadius: 10,
            maxValue: 5,
            starSpacing: 2,
            maxValueVisibility: true,
            valueLabelVisibility: true,
            animationDuration: Duration(milliseconds: 1000),
            valueLabelPadding:
                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            valueLabelMargin: const EdgeInsets.only(right: 8),
            starOffColor: const Color(0xffe7e8ea),
            starColor: Colors.yellow,
          ),
        ),
                    const SizedBox(height: 20,),
            Card(
              elevation: 5,
              margin: const EdgeInsets.only(right: 20, left: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.foodsList.title,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Text(
                      widget.foodsList.description,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PriceAndGram(
                      foodsList: widget.foodsList,
                      i: i,
                    ),
                  ],
                ),
              ),
            ),
 
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AddInCartMain(
                food: widget.foodsList,
                number: i,
              ),
            )
          ],
        ));
  }
}
