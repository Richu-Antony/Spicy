// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FoodModel {
  static List<Item> items = [];
}

class Item {
  final int id;
  final String name;
  final String description;
  final String? shortdesc;
  final String? heading;
  final String? recipe;
  final num price;
  final num? stars;
  final String? color;
  final String image;
  final String? restaurant;
  final String? location;
  final String? flavor;

  Item({
    required this.id,
    required this.name,
    required this.description,
    this.shortdesc,
    this.heading,
    this.recipe,
    required this.price,
    this.stars,
    this.color,
    required this.image,
    this.restaurant,
    this.location,
    this.flavor,
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
      shortdesc: map['shortdesc'] != null ? map['shortdesc'] as String : null,
      heading: map['heading'] != null ? map['heading'] as String : null,
      recipe: map['recipe'] != null ? map['recipe'] as String : null,
      price: map['price'] as num,
      stars: map['stars'] != null ? map['stars'] as num : null,
      color: map['color'] != null ? map['color'] as String : null,
      image: map['image'] as String,
      restaurant:
          map['restaurant'] != null ? map['restaurant'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      flavor: map['flavor'] != null ? map['flavor'] as String : null,
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
