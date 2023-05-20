import 'package:spicy/models/cart.dart';
import 'package:spicy/models/food_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {

  late FoodModel food;
  late CartModel cart;

  MyStore() {
    food = FoodModel();
    cart = CartModel();
    cart.food = food;
  }
}
