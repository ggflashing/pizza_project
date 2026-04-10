
import 'package:flutter/material.dart';

import 'package:pizza_project/LocalData/models/burgerModel.dart';
import 'package:pizza_project/LocalData/models/category.dart';
import 'package:pizza_project/LocalData/models/drinkModel.dart';
import 'package:pizza_project/LocalData/models/pizzaModel.dart';
import 'package:pizza_project/LocalData/pages/details.dart';

import 'LocalData/models/cakesModel.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Burgermodel> burgerData = Burgermodel.getMainListBurgers();
  final List<DrinkModel> drinkData = DrinkModel.getMainListJuices();
  final List<CategoryModel> categoryData = CategoryModel.getCategories();
  final List<CakesModel> cakesData = CakesModel.getMainCakesModel();
  final List<pizzaModel> pizzaData = pizzaModel.getMainpizzaModel();



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
        currentCategoryList = List.from(cakesData);
        break;
      case 3:
        currentCategoryList = List.from(pizzaData);
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

        }else
          if (item is CakesModel) searchText = item.name;
        if (item is DrinkModel) searchText = item.d_name;
        if (item is pizzaModel) searchText = item.name;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              categories(),
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
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(8),
                borderRadius: BorderRadius.circular(22.0),
                image: const DecorationImage(image: AssetImage('assets/images/pizza_simple.jpg')),

              ),
            )
          ]),

          const Text(
            'Welcome \n to Drive',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color(0xff1824ef)),

          ),
          const SizedBox(height: 8),
          TextField(
            controller: _searchController,// Назначаем контроллер
            decoration: InputDecoration(
              hintText: 'Search all snaks...',
              hintStyle: TextStyle(fontWeight: FontWeight.w200),
              filled: true,
              fillColor: Colors.white,
              prefixIcon:
                Icon(Icons.search,color: Colors.black,size: 25),
              // Кнопка очистик текстового поля(серый крестик справа)
              suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                icon: Icon(Icons.clear),
              onPressed: () {
                  _searchController.clear();
                  //Прослушивать будет из _preformSearch()

              })
                  :null,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50.0)))),
          )

        ]
      )
    );

  }

  Column categories(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Categories",
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600))),
        Container(
            height: 94,
        margin: const EdgeInsets.all(10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index ){
                return GestureDetector(
                  onTap: (){
                    for(var item in categoryData){
                      item.isSelected = false;}
                    categoryData[index].isSelected = true;
                    selectedCategoryIndex = index;
                    //Очистим поиск при изменении категории
                    if(_searchQuery.isNotEmpty){
                      _searchController.clear();
                      //Это активирует прослушиватель
                      //Для вызова _performSearchCategory()
                      //Который затем использует _updateListsOnCategory()

                    }else{
                      //Если поиск уже пуст просто обновится список на основе новой категории
                      _updateListOnCategory();
                    }
                    setState(()  {}
                    );
                      //обновится виджет списка  интерфейса

                  },

                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: categoryData[index].isSelected
                              ? const Color(0xff84e38c).withOpacity(0.9)
                              : const Color(0xffe4addf).withOpacity(0.22),
                          offset: const Offset(0, 4),
                          blurRadius: 35)
                      ],
                      color: categoryData[index].isSelected
                        ? const Color(0xff84e38c)
                          :Colors.white,
                    ),
                    child: Image(
                        image:AssetImage(categoryData[index].vector),
                      height: 40,
                      width: 40,
                      fit: BoxFit.scaleDown,
                    )),

                );
              },
            separatorBuilder: (context,index) => const SizedBox(width: 25),
            itemCount: categoryData.length))

      ],
    );
  }
  //ListView.separated в виджете snacks()
//должен формировать свои элементы на основе листа itemsToDisplay
Widget snacks() {
  //Показывать сообщение если результыт не найдены
  if (itemsToDisplay.isEmpty) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          _searchQuery.isNotEmpty
              ? 'No results founds for "$_searchQuery"'
              : 'No items in this category yet',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (context, index) {
        dynamic universalModel = itemsToDisplay[index];
        String name = '';
        String imagePath = '';
        Color itemColorBox = Colors.grey; // Цвет по умолчанию
        List<String> itemSpeciesLevel = [];
        double itemPrice = 0.0;

        if (universalModel is Burgermodel) {
          name = universalModel.name;
          imagePath = universalModel.image;
          itemColorBox = universalModel.colorbox;
          itemSpeciesLevel = universalModel.speciesLevel;
          itemPrice = universalModel.price;
        } else if (universalModel is CakesModel) {
          name = universalModel.name;
          imagePath = universalModel.image;
          itemColorBox = universalModel.colorbox;
          itemSpeciesLevel = universalModel.speciesLevel;
          itemPrice = universalModel.price;
        } else if (universalModel is DrinkModel) {
          name = universalModel.d_name;
          imagePath = universalModel.image;
          itemColorBox = Colors.grey;
          itemSpeciesLevel = ['', '', ''];
          itemPrice = universalModel.price;
        } else if (universalModel is pizzaModel) {
          name = universalModel.name;
          imagePath = universalModel.image;
          itemColorBox = universalModel.colorbox;
          itemSpeciesLevel = universalModel.speciesLevel;
          itemPrice = universalModel.price;
        }

        return GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                      snackModel: itemsToDisplay[index],
                    )
                ),
            );
          },

          child: Container(
            height: 109,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const  Color(0xff2f4f73).withOpacity(0.22),
                  offset: const Offset(0, 4),
                  blurRadius: 20)
              ]),
            child: Row(
              children: [
                Container(
                  width: 105,
                  decoration: BoxDecoration(
                    color: itemColorBox,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        alignment:Alignment.bottomCenter,
                      image: AssetImage(imagePath))),
                ),
                //Чтобы предотвратить переполнения - Expanded если текст окажется длинный
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name, //Используем извлеченный name
                            style: const TextStyle(
                              fontSize: 18,fontWeight: FontWeight.w600),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (itemSpeciesLevel.isNotEmpty)
                            Text(
                              itemSpeciesLevel.length > 1
                                  ? itemSpeciesLevel[1]
                                  :itemSpeciesLevel[0],
                            ),
                          Spacer(),
                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(4.0),
                                child: Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/priceRedSmolliconLable.png'),
                                  )),
                                ),
                              ),
                              Text(
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                                itemPrice.toString(),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                )
              ],
            ),
          ),

        );


      },
    separatorBuilder: (context, index) => const SizedBox(height: 12),
    itemCount: itemsToDisplay.length);

}

}