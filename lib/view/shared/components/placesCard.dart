import 'package:flutter/material.dart';
import 'package:flutter_development/model/PlacesModel.dart';

import '../../../constants/colors.dart';
import '../../categories/placeDetails.dart';

Widget _cardSm(String title, String spots, icon, String img) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('assets/images/$img.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 25,
              color: RouteColors.light,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: RouteColors.light),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(spots,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white.withOpacity(0.6)))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _cardLg(String title, String spots, icon, String img) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('assets/images/$img.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 30,
              color: RouteColors.light,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: RouteColors.light,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(spots,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white.withOpacity(0.6)))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _cardAlert(String title, String spots, icon, String img) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      height: 250,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('assets/images/$img.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 210,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: RouteColors.light,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: RouteColors.light,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: RouteColors.dark,
                        size: 30,
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 110,
                  child: Text(
                    spots.substring(0, 200) + "...",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class CardLg extends StatefulWidget {
  late PlacesModel placesModel;
  CardLg({
    Key? key,
    required this.placesModel,
  }) : super(key: key);

  @override
  State<CardLg> createState() => _CardLgState();
}

class _CardLgState extends State<CardLg> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 175.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(placesModel: widget.placesModel)));
                },
                onLongPress: () {
                  _showMyDialog(widget.placesModel, context);
                },
                child: _cardLg(
                    widget.placesModel.Name,
                    widget.placesModel.Description,
                    Icons.location_on,
                    widget.placesModel.ImageUrl),
              ),
            )),
      ],
    );
  }
}

class CardSm extends StatefulWidget {
  late PlacesModel first_place;
  late PlacesModel second_place;

  CardSm({
    Key? key,
    required this.first_place,
    required this.second_place,
  }) : super(key: key);

  @override
  State<CardSm> createState() => _CardSmState();
}

class _CardSmState extends State<CardSm> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      GestureDetector(
        onLongPress: () {
          _showMyDialog(widget.first_place, context);
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(placesModel: widget.first_place)));
        },
        child: Column(children: <Widget>[
          Container(
              height: 125.0,
              width: MediaQuery.of(context).size.width * .5,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _cardSm(
                    widget.first_place.Name,
                    widget.first_place.Description,
                    Icons.location_on,
                    widget.first_place.ImageUrl),
              )),
        ]),
      ),
      GestureDetector(
        onLongPress: () {
          _showMyDialog(widget.second_place, context);
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(placesModel: widget.second_place)));
        },
        child: Column(children: <Widget>[
          Container(
              height: 125.0,
              width: MediaQuery.of(context).size.width * .5,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _cardSm(
                    widget.second_place.Name,
                    widget.second_place.Description,
                    Icons.location_on,
                    widget.second_place.ImageUrl),
              )),
        ]),
      )
    ]);
  }
}

Future<void> _showMyDialog(
  PlacesModel placesModel,
  BuildContext context,
) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: Column(
            children: [
              _cardAlert(placesModel.Name, placesModel.Description,
                  Icons.location_on, placesModel.ImageUrl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: const Text(
                          'Listeye Dön',
                          style: TextStyle(color: RouteColors.dark),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(RouteColors.red)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text(
                          'Keşfet',
                          style: TextStyle(color: RouteColors.dark),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(RouteColors.green)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.start,
      );
    },
  );
}
