import 'package:flutter/material.dart';
import 'package:flutter_development/constants/colors.dart';
import 'package:flutter_development/model/PlacesModel.dart';

class DetailPage extends StatelessWidget {
  final PlacesModel placesModel;
  DetailPage({Key? key, required this.placesModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            value: 0,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        // "\$20",
        "İstanbul - " + placesModel.District,
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Icon(
          Icons.location_on,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 40.0,
          child: new Divider(color: RouteColors.light),
        ),
        SizedBox(height: 10.0),
        Text(
          placesModel.Name,
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      placesModel.CategoryName,
                      style: TextStyle(color: Colors.white),
                    ))),
            Container(child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: 400,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image:
                    new AssetImage("assets/images/${placesModel.ImageUrl}.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: 400,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromARGB(100, 9, 4, 32)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Container(
      height: 230.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          placesModel.Description,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
