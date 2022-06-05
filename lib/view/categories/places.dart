import 'package:flutter/material.dart';
import 'package:flutter_development/factory/PlacesModelFactory.dart';
import 'package:flutter_development/model/PlacesModel.dart';

import '../../constants/colors.dart';
import '../shared/components/placesCard.dart';

class Places extends StatefulWidget {
  int typeId;
  Places({Key? key, required this.typeId}) : super(key: key);

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  @override
  Widget build(BuildContext context) {
    var model = PlacesModelFactory.preparePlacesListModel(widget.typeId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: RouteColors.dark,
        title: Column(
          children: [
            Text("${model.TypeName}"),
            Text(
              "İstanbul",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          Container(
            child: Column(
              children: createPlacesList(model.categories),
            ),
          ),
        ]), //ListView
      ),
    );
  }
}

List<Widget> createPlacesList(List<PlacesModel> items) {
  List<Widget> list = [];

  for (var i = 0; i < items.length; i++) {
    var item = items[i];
    list.add(CardLg(
      placesModel: item,
    ));
  }

  return list;
}
