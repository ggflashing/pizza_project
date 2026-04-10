import 'package:flutter/material.dart';

class Burgermodel {
  String name;
  String image;
  Color colorbox;
  List<String> speciesLevel;
  String description;
  double price;

  Burgermodel({required this.name, required this.image, required this.colorbox,
    required this.speciesLevel,
    required this.description, required this.price});

  static List<Burgermodel> getMainListBurgers() {
    List<Burgermodel> mainListBurgers = [];
    mainListBurgers =[
      Burgermodel(
        name: 'Peppers burger',
        image: 'assets/images/hot_pepper_burger.png',
        colorbox: const Color(0xffcff5cf),
        speciesLevel: ['much very peppers', 'Middle papers', 'no peppers'
        ],
        description: 'much  very species'      'Peppers Burger Peppers '
            'Burger Peppers Burger Peppers Burger'
            'Peppers Burger much  very species  much  very species',
        price: 5.5,
      ),
      Burgermodel(
        name: 'Cheese burger',
        image: 'assets/images/cheese_burger03.png',
        colorbox: const Color(0xffcff5cf),
        speciesLevel: ['much very cheese', 'Middle cheese'
        ],
        description:
        'much  very delishions cheese burger '
            'much  very delishions cheese burger'
            'much  very delishions cheese burger',
        price: 6.5,
      ),
      Burgermodel(
        name: 'Veget burger',
        image: 'assets/images/veget_bureger02.png',
        colorbox: const Color(0xffcff5cf),
        speciesLevel: ['much very vegetables', 'Middle vegetables'
        ],
        description:
        'Veget burger Veget burger Veget burger '
            'Veget burger Veget burger Veget burger'
            'Veget burger Veget burger Veget burger',
        price: 4.5,
      ),
      Burgermodel(
        name: 'Super double burger',
        image: 'assets/images/double_burger.png',
        colorbox: const Color(0xffcff5cf),
        speciesLevel: ['much very vegetables', 'Middle vegetables'
        ],
        description:
        'Veget burger Veget burger Veget burger '
            'Veget burger Veget burger Veget burger'
            'Veget burger Veget burger Veget burger',
        price: 2.5,
      ),


    ];
    return mainListBurgers;

  }

}