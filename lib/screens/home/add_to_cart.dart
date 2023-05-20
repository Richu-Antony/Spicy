import 'package:flutter/material.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/models/cart.dart';
import 'package:spicy/models/food_model.dart';
import 'package:velocity_x/velocity_x.dart';

// class AddToCart extends StatelessWidget {
//   final Item food;
//   final _cart = CartModel();
//
//   AddToCart({
//     Key? key,
//     required this.food,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // final CartModel _cart = (VxState.store as MyStore).cart;
//     bool isInCart = _cart.items.contains(food) ?? false;
//
//     return ElevatedButton(
//       onPressed: () {
//         isInCart = isInCart.toggle();
//         if (!isInCart) {
//           final _food = FoodModel();
//           final _cart = CartModel();
//           _cart.food = _food;
//           _cart.add(food);
//           // setState(() {});
//         }
//         ;
//       },
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(
//           AppColors.darkBluishColor,
//         ),
//         shape: MaterialStateProperty.all(
//           const StadiumBorder(),
//         ),
//       ),
//       child: isInCart
//           ? const Icon(
//               Icons.done,
//               color: Colors.white,
//             )
//           : const Icon(
//               Icons.add_shopping_cart,
//               color: Colors.white,
//             ),
//     );
//   }
// }

class AddToCart extends StatefulWidget {
  final Item food;

  const AddToCart({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.food) ?? false;

    return ElevatedButton(
      onPressed: () {
        isInCart = isInCart.toggle();
        if (!isInCart) {
          final _food = FoodModel();
          final _cart = CartModel();
          _cart.food = _food;
          _cart.add(widget.food);
          setState(() {});
        }
        ;
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColors.darkBluishColor,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart
          ? const Icon(
              Icons.done,
              color: Colors.white,
            )
          : const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
    );
  }
}
