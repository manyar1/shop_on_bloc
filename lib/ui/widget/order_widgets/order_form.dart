import 'package:flutter/material.dart';




class OrderForm extends StatefulWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {


  final _formKey = GlobalKey<FormState>();

  final List<String> _dostavka = [
    'Доставка курьером',
    'Самовывоз',
  ];
  String _selecteddDostavka = 'Доставка курьером';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),
          DropdownButtonFormField(
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              icon: Icon(
                Icons.directions_bike,
                color: Colors.white,
              ),
            ),
            items: _dostavka.map((dostavka) {
              return DropdownMenuItem(
                value: dostavka,
                child: Text(
                  dostavka,
                ),
              );
            }).toList(),
            onChanged: (dostavka) {
       
              setState(() {
                _selecteddDostavka = dostavka as String;
              });
            },
            value: _selecteddDostavka,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

// _scaffoldKey.currentState.showSnackBar(
// SnackBar(
// duration: Duration(seconds: 5),
// backgroundColor: Colors.red,
// content: Text(
// message,
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.w600,
// fontSize: 18.0,
// ),
// ),
//
// );
}
