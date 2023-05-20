import 'package:flutter/material.dart';
import 'package:spicy/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CartModel _cart = (VxState.store as MyStore).cart;
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "₹${_cart.totalPrice}".text.xl.color(Colors.redAccent).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Product Buy Successfully".text.make(),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.orangeAccent)),
            child: "Buy".text.color(Colors.white).make(),
          ).w32(context),
        ],
      ),
    );
  }
}

// class _CartList extends StatelessWidget {
//   // final _cart = CartModel();
//
//   const _CartList({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final CartModel _cart = (VxState.store as MyStore).cart;
//     return _cart.items.isEmpty
//         ? "Nothing to show".text.xl3.makeCentered()
//         : ListView.builder(
//             itemCount: _cart.items.length,
//             itemBuilder: (context, index) => ListTile(
//               leading: const Icon(Icons.done),
//               trailing: IconButton(
//                 icon: const Icon(Icons.remove_circle_outline),
//                 onPressed: () {
//                   _cart.remove(_cart.items[index]);
//                 },
//               ),
//               title: _cart.items[index].name.text.make(),
//             ),
//           );
//   }
// }

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                  setState(() {});
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
