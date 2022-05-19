import 'package:flutter/material.dart';

import '../../model/CategoryModel.dart';

class routeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const routeAppBar({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Rota - ' + model.CityName),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
