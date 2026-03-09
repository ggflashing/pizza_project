import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pizza_project/LocalData/models/CakesModel.dart';
import 'package:pizza_project/LocalData/models/burgerModel.dart';
import 'package:pizza_project/LocalData/models/category.dart';
import 'package:pizza_project/LocalData/models/drinkModel.dart';
import 'package:pizza_project/LocalData/models/pizzaModel.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Burgermodel> burgerData = Burgermodel.getMainListBurgers();
  final List<DrinkModel> drinkData = DrinkModel.getMainListJuices();
  final List<CategoryModel> categoryData = CategoryModel.getCategories();
  final List<Cakesmodel> cakesData = Cakesmodel.getMainCakesModel();
  final List<pizzaModel> pizzaData = pizzaModel.getMainpizzaModel()

 // final List<TastyModel> cakesData = TastyModel.getCategories();
 // final List<PizzaModel> pizzaData = PizzaModel.getCategories();

  List<Object> itemsToDisplay = [];
  //Обьявляем лист для текущего демонстрирования

  int selectedCategoryIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  List<Object> allSnacks = [];

  void initState() {
    super.initState();
    allSnacks.addAll(burgerData);
    allSnacks.addAll(drinkData);
    allSnacks.addAll(cakesData);
    allSnacks.addAll(pizzaData);
    _updateListOnCategory();
    //Прослушивание изменений в текстовом поле поиска
    _searchController.addListener((){
      setState(() {
        _searchQuery = _searchController.text;
        _perfromSearch();


      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    //Надо при каждом разе утилизировать
    super.dispose();
  }



  void _updateListOnCategory() {
    List<Object> currentCategoryList = [];
    switch (selectedCategoryIndex) {
      case 0:
          currentCategoryList = List.from(burgerData); //List.from для создания изменяемой копии
    break;
      case 1:
    currentCategoryList = List.from(drinkData);
    break;
      case 2:
        currentCategoryList = List.from(pizzaData);
        break;
      case 3:
        currentCategoryList = List.from(cakesData);
        break;

      default:
        currentCategoryList = List.from(burgerData);
        break;

    }

    //После обновления применяем текущий категорию
    itemsToDisplay = currentCategoryList;

  }

  void _perfromSearch() {

    if(_searchQuery.isEmpty){
      //Если поисковый запрос пуст,
      // Покажем все элементы из текущуй категории
      _updateListOnCategory();


    }else{
      //Если поисковый запрос есть фильтруем все снэки
      itemsToDisplay = allSnacks.where((item){
        String searchText = '';
        //Нам надо безопасно получить доступ к свойству 'name'
        if(item is Burgermodel){
          searchText = item.name;

        }else if (item is Cakesmodel) searchText = item.name;
        if (item is DrinkModel) searchText = item.d_name;
        return searchText.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();

    }


  }





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1800,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start
            children: [
              header(),
              category(),
              snacks()
          ],

        ),

        ),
      ),


    );
  }

  Container header(){
    return Container(
      height: 320,
      color: const Color(0xfffaf4ab),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Drive Alisa Delicious',
              style: TextStyle(fontSize: 18, color: Color(0xff1824ef)),
            ),
            Container()
          ],)
        ],

      ),

    )

  }



}