import 'package:flutter/material.dart';

class Recomend extends StatelessWidget {
  const Recomend({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Продукты по рекомендации',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 39, 39),
      ),
      backgroundColor: const Color.fromARGB(255, 41, 39, 39),
      body: _buildbody(),
    );
  }
}

Widget _buildbody() {
  return  const Card(
    color: Color.fromARGB(255, 41, 39, 39),
    margin: EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(
            '+7(111)888-88-88',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          leading: Icon(
            Icons.phone,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            'danielars@mail.ru',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          leading: Icon(
            Icons.mail,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            'ул. Пушкина, дом 36к2',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          leading: Icon(
            Icons.map,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
