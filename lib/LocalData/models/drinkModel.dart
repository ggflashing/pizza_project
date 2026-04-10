class DrinkModel {
  String d_name;
  String image;
  String descpiption;
  List<String> speicesLevel;
  double price;

  DrinkModel({
    required this.d_name,
    required this.image,
    required this.descpiption,
    required this.speicesLevel,
    required this.price});
  static List<DrinkModel> getMainListJuices(){
    List<DrinkModel> mainListJuices = [];
    mainListJuices = [
      DrinkModel(
        d_name: 'Peppers burger',
        image: 'assets/images/pomelo_juice.png',
        descpiption: 'much  very species'   'Peppers Burger Peppers '
            'Burger Peppers Burger Peppers Burger'

            'Peppers Burger much  very species  much  very species',
        speicesLevel: ['.','.',''],
        price: 5.5,
      ),
      DrinkModel(
        d_name: 'Peppers burger',
        image: 'assets/images/strawberry_juice.png',
        descpiption: 'much  very species'      'Peppers Burger Peppers '
            'Burger Peppers Burger Peppers Burger'

            'Peppers Burger much  very species  much  very species',
        speicesLevel: ['.','.',''],
        price: 5.5,
      ),
      DrinkModel(
        d_name: 'Peppers burger',
        image: 'assets/images/orange_juice.png',
        descpiption: 'much  very species'      'Peppers Burger Peppers '
            'Burger Peppers Burger Peppers Burger'

            'Peppers Burger much  very species  much  very species',
        speicesLevel: ['.','.',''],
        price: 5.5,
      ),
      DrinkModel(
        d_name: 'Peppers burger',
        image: 'assets/images/lemon_juice.png',
        descpiption: 'much  very species'      'Peppers Burger Peppers '
            'Burger Peppers Burger Peppers Burger'

            'Peppers Burger much  very species  much  very species',
        speicesLevel: ['.','.',''],
        price: 5.5,
      ),
    ];
    return mainListJuices;
  }


}