// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FoodModel {
  static final catModel = FoodModel._internal();

  FoodModel._internal();

  factory FoodModel() => catModel;

  static List<Item> items = [];

  // Get item by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String description;
  final String shortdesc;
  final String heading;
  final String recipe;
  final num price;
  final num stars;
  final String color;
  final String image;
  final String restaurant;
  final String location;
  final String flavor;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.shortdesc,
    required this.heading,
    required this.recipe,
    required this.price,
    required this.stars,
    required this.color,
    required this.image,
    required this.restaurant,
    required this.location,
    required this.flavor,
  });

  Item copyWith({
    int? id,
    String? name,
    String? description,
    String? shortdesc,
    String? heading,
    String? recipe,
    num? price,
    num? stars,
    String? color,
    String? image,
    String? restaurant,
    String? location,
    String? flavor,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      shortdesc: shortdesc ?? this.shortdesc,
      heading: heading ?? this.heading,
      recipe: recipe ?? this.recipe,
      price: price ?? this.price,
      stars: stars ?? this.stars,
      color: color ?? this.color,
      image: image ?? this.image,
      restaurant: restaurant ?? this.restaurant,
      location: location ?? this.location,
      flavor: flavor ?? this.flavor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'shortdesc': shortdesc,
      'heading': heading,
      'recipe': recipe,
      'price': price,
      'stars': stars,
      'color': color,
      'image': image,
      'restaurant': restaurant,
      'location': location,
      'flavor': flavor,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      shortdesc: map['shortdesc'] as String,
      heading: map['heading'] as String,
      recipe: map['recipe'] as String,
      price: map['price'] as num,
      stars: map['stars'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
      restaurant: map['restaurant'] as String,
      location: map['location'] as String,
      flavor: map['flavor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, description: $description, shortdesc: $shortdesc, heading: $heading, recipe: $recipe, price: $price, stars: $stars, color: $color, image: $image, restaurant: $restaurant, location: $location, flavor: $flavor)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.shortdesc == shortdesc &&
        other.heading == heading &&
        other.recipe == recipe &&
        other.price == price &&
        other.stars == stars &&
        other.color == color &&
        other.image == image &&
        other.restaurant == restaurant &&
        other.location == location &&
        other.flavor == flavor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        shortdesc.hashCode ^
        heading.hashCode ^
        recipe.hashCode ^
        price.hashCode ^
        stars.hashCode ^
        color.hashCode ^
        image.hashCode ^
        restaurant.hashCode ^
        location.hashCode ^
        flavor.hashCode;
  }
}
