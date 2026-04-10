import 'package:flutter/material.dart';

class pizzaModel {
  String name;
  String image;
  Color colorbox;
  List<String> speciesLevel;
  String description;
  double price;


  pizzaModel({
    required this.name, required this.image, required this.colorbox,required this.speciesLevel,
    required this.description, required this.price

  });
  static List<pizzaModel> getMainpizzaModel() {
    List<pizzaModel> mainListpizza = [];
    mainListpizza = [
      pizzaModel(
          name: 'pizza_simple',
          image: 'assets/images/pizza_simple.jpg',
          colorbox: const Color(0xffcff5cf),
          speciesLevel: ['much very pizza_simple' , 'middle pizza_simple', 'no pizza_simple'],
          description: 'much  very species'      'pizza_simple '
              'pizza_simple pizza_simple'
              'pizza_simple Cakes much  very species  much  very species',
          price: 7.5
      ),

      pizzaModel(
          name: 'pizzaPit',
          image: 'assets/images/pizzaicon12.png',
          colorbox: const Color(0xffcff5cf),
          speciesLevel: ['much very pizzaPit' , 'middle pizzaPit', 'no pizzaPit'],
          description: 'much  very species'      'pizzaPit pizzaPit '
              'pizzaPit pizza pizzaPit pizza pizzaPit'
              'pizzaPit Cakes much  very species  much  very species',
          price: 8.5

      ),



    ];

    return mainListpizza;
  }



}