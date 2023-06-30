import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String country;
  final String story;
  final String pass;
  final String dostavka;
  final String vhod;

  const PersonEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.country,
    required this.story,
    required this.pass,
    required this.dostavka,
    required this.vhod,
    required this.id,
  });

  @override
  List<Object?> get props => [id, phone, email, country, story, pass, dostavka, vhod];
  factory PersonEntity.fromJson(Map<String, dynamic> json) {
    return PersonEntity(
      id: json['id'],
      phone: json['phone'],
      email: json['email'],
      country: json['country'],
      story: json['story'],
      pass: json['pass'],
      dostavka: json['dostavka'],
      vhod: json['vhod'],
      name: json['name'],
    );
  }
}
