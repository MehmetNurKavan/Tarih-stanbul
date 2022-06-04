import '../data/category.dart';
import '../model/CategoryModel.dart';

class CategoryModelFactory {
  static CategoryModel prepareCategoryModel() {
    var model = new CategoryModel();

    model.CityName = "İstanbul";

    model.categories.add(Category(1, "Camiiler", "camii",
        "İstanbul'un camiilerini keşfet!"));
    model.categories.add(Category(2, "Çeşmeler", "cesme",
        "İstanbul'un çeşmelerini keşfet!"));
    model.categories.add(Category(3, "Hamamlar", "hamam",
        "İstanbul'un hamamlarını keşfet!"));
    model.categories.add(Category(4, "Kaleler", "kale",
        "İstanbul'un kalelerini keşfet!"));
    model.categories.add(Category(5, "Köprüler", "kopru",
        "İstanbul'un köprülerini keşfet!"));
    model.categories.add(Category(6, "Medreseler", "medrese",
        "İstanbul'un medreselerini keşfet!"));
    model.categories.add(Category(7, "Müzeler", "muze",
        "İstanbul'un müzelerini keşfet!"));
    model.categories.add(Category(8, "Parklar", "park",
        "İstanbul'un parklarını keşfet!"));
    model.categories.add(Category(9, "Türbeler", "turbe",
        "İstanbul'un türbelerini keşfet!"));

    return model;
  }
}
