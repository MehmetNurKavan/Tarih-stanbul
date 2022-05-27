import 'package:flutter/material.dart';
import 'package:flutter_development/view/shared/components/cards.dart';

import '../../constants/colors.dart';
import '../../data/category.dart';
import '../../factory/CategoryModelFactory.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var model = CategoryModelFactory.prepareCategoryModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RouteColors.light,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.find_replace_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: RouteColors.dark,
        title: Column(
          children: [
            Text('Rota - ' + model.CityName),
            Text(
              "Kategoriler",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          Container(
            child: Column(
              children: createCategoryList(model.categories),
            ),
          ),
        ]), //ListView
      ), //Container
    );
  }
}

List<Widget> createCategoryList(List<Category> items) {
  List<Widget> list = [];

  for (var i = 0; i < items.length; i++) {
    var remainingItems = items.length - i;
    var item = items[i];
    var nextItem = items[i + 1];
    if (i == 0) {
      list.add(CardLg(
        category: item,
      ));
    } else {
      if (remainingItems == 1) {
        list.add(CardLg(
          category: item,
        ));
      } else {
        list.add(CardSm(first_category: item, second_category: nextItem));
        ++i;
      }
    }
  }

  return list;
}
