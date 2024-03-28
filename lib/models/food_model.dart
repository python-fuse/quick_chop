class Food {
  final String name;
  final String description;
  final String price;
  final String imagePath;
  final FoodCategory category;
  final double rating;
  List<Addon> availableAddons;

  Food(
      {required this.name,
      required this.description,
      required this.price,
      required this.rating,
      required this.imagePath,
      required this.category,
      required this.availableAddons});
}

// categories

enum FoodCategory { snack, breakfast, lunch, drinks }

// food addon
class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}
