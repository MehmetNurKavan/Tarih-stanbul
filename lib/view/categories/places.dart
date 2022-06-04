import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Places extends StatefulWidget {
  const Places({Key? key}) : super(key: key);

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(

        backgroundColor: RouteColors.dark,
        title: Column(
          children: [
            Text('Rota - '),
            Text(
              "Kategoriler",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),


    );
  }
}
