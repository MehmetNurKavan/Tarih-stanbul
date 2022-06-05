class PlacesModel {
  late String Name;
  late String Description;
  late String Type;
  late String District;
  late String ImageUrl;
  late String CategoryName;
}

class PlacesListModel {
  late String TypeName;
  late List<PlacesModel> categories = [];
}
