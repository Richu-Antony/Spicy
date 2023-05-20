import 'package:flutter/material.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/models/food_model.dart';
import 'package:spicy/screens/home/home_detail_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'add_to_cart.dart';
import 'foodlist_image.dart';

class FoodlistList extends StatelessWidget {
  const FoodlistList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: FoodModel.items.length,
      itemBuilder: (context, index) {
        final fooditem = FoodModel.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailScreen(
                  fooditem: fooditem,
                ),
              ),
            );
          },
          child: FoodlistItem(fooditem: fooditem),
        );
      },
    );
  }
}

class FoodlistItem extends StatelessWidget {
  final Item fooditem;

  const FoodlistItem({
    Key? key,
    required this.fooditem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
        height: 160,
        child: Card(
          color: isDarkMode
              ? AppColors.darkColorTrinaryButtonVarient
              : AppColors.lightColorSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Row(
            children: [
              Hero(
                tag: Key(fooditem.id.toString()),
                child: FoodlistImage(image: fooditem.image),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(fooditem.name)
                        .text
                        .lg
                        .color(
                          isDarkMode
                              ? AppColors.darkColorText
                              : AppColors.lightColorText,
                        )
                        .bold
                        .make(),
                    Text(fooditem.shortdesc)
                        .text
                        .textStyle(context.captionStyle)
                        .make(),
                    // const SizedBox(height: 10),
                    const Expanded(child: SizedBox()),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 8),
                      child: ButtonBar(
                        buttonPadding: EdgeInsets.zero,
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("₹${fooditem.price}").text.bold.xl.make(),
                          AddToCart(food: fooditem),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
