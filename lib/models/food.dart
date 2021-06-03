import 'food_size.dart';

class Food {
  int id;
  String imageUrl;
  String name;
  String tag;
  List<FoodSize> size;
  String description;
  double price;
  double rating;

  Food({
    this.id,
    this.imageUrl,
    this.name,
    this.tag,
    this.size,
    this.description,
    this.price,
    this.rating,
  });
}
