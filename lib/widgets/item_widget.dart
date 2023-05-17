import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spicy/models/food_model.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: () {
          if (kDebugMode) {
            print("${item.name} - Pressed");
          }
        },
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\₹${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
