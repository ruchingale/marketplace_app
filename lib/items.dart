import 'package:flutter/material.dart';

class Item {
  String name;
  Color boxcolor;

  Item({required this.name, required this.boxcolor});

  static List<Item> getitem() {
    List<Item> categories = [];
    categories
        .add(Item(name: "Sweets", boxcolor: Color.fromARGB(255, 189, 147, 64)));
    categories.add(
        Item(name: "Namkeens", boxcolor: Color.fromARGB(255, 189, 147, 64)));
    categories
        .add(Item(name: "Spices", boxcolor: Color.fromARGB(255, 189, 147, 64)));
    categories.add(
        Item(name: "BreakFast", boxcolor: Color.fromARGB(255, 189, 147, 64)));
    categories
        .add(Item(name: "Lunch", boxcolor: Color.fromARGB(255, 189, 147, 64)));
    categories
        .add(Item(name: "Health", boxcolor: Color.fromARGB(255, 189, 147, 64)));
    categories
        .add(Item(name: "Drinks", boxcolor: Color.fromARGB(255, 189, 147, 64)));
    categories.add(Item(
        name: "Packaged Food", boxcolor: Color.fromARGB(255, 189, 147, 64)));

    return categories;
  }
}
