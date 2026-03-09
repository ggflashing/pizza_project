import 'package:flutter/material.dart';

class Cakesmodel {
  String name;
  String image;
  Color colorbox;
  List<String> speciesLevel;
  String description;
  double price;


  Cakesmodel({
    required this.name, required this.image, required this.colorbox,required this.speciesLevel,
    required this.description, required this.price

});
  static List<Cakesmodel> getMainCakesModel() {
    List<Cakesmodel> mainListCakes = [];
    mainListCakes = [
      Cakesmodel(
          name: 'Cakes 88Chokolate',
          image: 'assets/images/cake88chokolate.jpg',
          colorbox: const Color(0xffcff5cf),
          speciesLevel: ['much very chokolate' , 'middle chokolate', 'no chokolate'],
          description: 'much  very species'      'Chokolate Cakes chokolate '
              'Chokolate Cakes chokolate Chokolate Cakes chokolate'
              'Chokolate Cakes much  very species  much  very species',
          price: 3.5
      ),

      Cakesmodel(
          name: 'Cakes 88lime',
          image: 'assets/images/cake88lime.jpg',
          colorbox: const Color(0xffcff5cf),
          speciesLevel: ['much very lime' , 'middle lime', 'no lime'],
          description: 'much  very species'      'lime Cakes lime '
              'lime Cakes lime lime Cakes lime'
              'lime Cakes much  very species  much  very species',
          price: 2.5

      ),

      Cakesmodel(
          name: 'Cakes 88yellow',
          image: 'assets/images/cake88yellow.jpg',
          colorbox: const Color(0xffcff5cf),
          speciesLevel: ['much very yellow' , 'middle yellow', 'no yellow'],
          description: 'much  very species'      'yellow Cakes yellow '
              'yellow Cakes yellow yellow Cakes yellow'
              'yellow Cakes much  very species  much  very species',
          price: 3.5

      ),



    ];

    return getMainCakesModel();

  }



}