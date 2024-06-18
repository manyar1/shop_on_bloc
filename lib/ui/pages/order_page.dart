import 'package:flutter/material.dart';
import 'package:shop_on_block/feature/domain/entities/food_entity.dart';
import 'package:shop_on_block/ui/widget/order_widgets/order_form.dart';
import 'package:shop_on_block/ui/widget/order_widgets/order_item_container.dart';

class OrderPage extends StatelessWidget {
  final List<FoodEntity> cartData;
  final List<FoodEntity> allCartData;
  final double price;

  const OrderPage({Key? key, required this.cartData, required this.price, required this.allCartData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Оформление заказа',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 39, 39),
      ),
      backgroundColor: const Color.fromARGB(255, 41, 39, 39),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(),
            const Column(
              children: [
                ListTile(
                  title: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Введите имя:',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Введите телефон',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Введите адрес:',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Введите почту',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Сдача с:',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 100, child: OrderForm()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Стоимость: $price',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Сделать заказ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
            const Text(
              'Ваш заказ:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartData.length,
                  itemBuilder: (context, index) {
                    
                    return OrederItemContainer(cartData: cartData, index: index, allCartData: allCartData,);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
