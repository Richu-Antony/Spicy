import 'package:spicy/models/food_model.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // Food field
  late FoodModel _foodModel;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get food
  FoodModel get food => _foodModel;

  set food(FoodModel newfood) {
    assert(newfood != null);
    _foodModel = newfood;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _foodModel.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
