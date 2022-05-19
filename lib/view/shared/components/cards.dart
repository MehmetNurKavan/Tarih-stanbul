import 'package:flutter/material.dart';
import 'package:flutter_development/constants/colors.dart';
import 'package:flutter_development/data/category.dart';

Widget _cardSm(String title, String spots, icon, String img) {
  return GestureDetector(
    onLongPress: () => CardLongPress,
    child: Card(
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
    ),
  );
}

Widget _cardLg(String title, String spots, icon, String img) {
  return GestureDetector(
    onLongPress: () => CardLongPress,
    child: Card(
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
    ),
  );
}

class CardLg extends StatefulWidget {
  late Category category;
  CardLg({
    Key? key,
    required this.category,
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
                onTap: () {},
                child: _cardLg(
                    widget.category.name,
                    widget.category.description,
                    Icons.location_on,
                    widget.category.image),
              ),
            )),
      ],
    );
  }
}

class CardSm extends StatefulWidget {
  late Category first_category;
  late Category second_category;

  CardSm({
    Key? key,
    required this.first_category,
    required this.second_category,
  }) : super(key: key);

  @override
  State<CardSm> createState() => _CardSmState();
}

class _CardSmState extends State<CardSm> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(children: <Widget>[
        Container(
            height: 125.0,
            width: MediaQuery.of(context).size.width * .5,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: _cardSm(
                  widget.first_category.name,
                  widget.first_category.description,
                  Icons.location_on,
                  widget.first_category.image),
            )),
      ]),
      Column(children: <Widget>[
        Container(
            height: 125.0,
            width: MediaQuery.of(context).size.width * .5,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: _cardSm(
                  widget.second_category.name,
                  widget.second_category.description,
                  Icons.location_on,
                  widget.second_category.image),
            )),
      ])
    ]);
  }
}

void CardLongPress() {}
