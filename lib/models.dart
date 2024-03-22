import 'package:flutter/material.dart';

class Model {
  String name;
  String iconpath;
  String price;
  Color boxColor;

  Model(
      {required this.name,
      required this.iconpath,
      required this.price,
      required this.boxColor});

  static List<Model> getmodel() {
    List<Model> meals = [];

    meals.add(Model(
        name: 'Puranpoli',
        iconpath: 'lib/images/image (4).png',
        price: 'Rs 20/',
        boxColor: const Color.fromARGB(255, 255, 185, 34)));
    meals.add(Model(
        name: 'Sweets',
        iconpath: 'lib/images/image (4).png',
        price: 'Rs 350',
        boxColor: const Color.fromARGB(255, 255, 185, 34)));

    return getmodel();
  }
}