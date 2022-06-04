import 'package:flutter_development/model/PlacesModel.dart';

class PlacesModelFactory {
  static PlacesListModel preparePlacesListModel() {
    var model = new PlacesListModel();

    model.categories.add(_createPlacesModel(
        "Yahya Efendi Türbesi",
        "İstanbul'un Beşiktaş ilçesinde, Çırağan Sarayı karşısında, Yahya Efendi Tekkesi'nin bitişiğinde bulunan 1571 tarihli Mimar Sinan eseri kâgir türbedir.\nI. Süleyman devrinin ünlü mutasavvıf, âlim ve şairi Yahya Efendi'ye ait türbe, ilk inşası Mimar Sinan tarafından yapılan tekke-tevhithane-medreseden oluşan külliyenin içindedir. Kare plan üzerine tek kubbeli bir ahşap yapıdır.",
        "8",
        "Beşiktaş",
        ""));

    return model;
  }

  static _createPlacesModel(String name, String description, String type,
      String district, String imageUrl) {
    var model = new PlacesModel();

    model.Name = name;
    model.Description = description;
    model.Type = type;
    model.District = district;
    model.ImageUrl = imageUrl;

    return model;
  }
}
