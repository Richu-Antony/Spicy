import 'package:flutter/material.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/models/food_model.dart';
import 'package:spicy/screens/home/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailScreen extends StatelessWidget {
  final Item fooditem;

  const HomeDetailScreen({
    Key? key,
    required this.fooditem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness currentBrightness =
        MediaQuery.of(context).platformBrightness;
    final isDarkMode = currentBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: isDarkMode
            ? AppColors.darkColorPrimary
            : AppColors.lightColorPrimary,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("₹${fooditem.price}").text.bold.xl4.red800.make(),
            AddToCart(food: fooditem).wh(120, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(fooditem.id.toString()),
              child: Image.asset(
                fooditem.image,
                height: MediaQuery.of(context).size.height * .35,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.zero,
                child: VxArc(
                  height: 20.0,
                  arcType: VxArcType.CONVEX,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: isDarkMode
                        ? AppColors.darkColorPrimary
                        : AppColors.lightColorPrimary,
                    width: context.screenWidth,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                fooditem.name,
                                style: const TextStyle(
                                  fontSize: 32,
                                  color: AppColors.lightColorText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Stars: ${fooditem.stars}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  "${fooditem.flavor}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Description:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                fooditem.description,
                                style: context.captionStyle!
                                    .copyWith(fontSize: 16),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Location: ${fooditem.location}",
                                style: context.captionStyle!
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Restaurant: ${fooditem.restaurant}",
                                style: context.captionStyle!
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                fooditem.heading,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              fooditem.recipe,
                              style:
                                  context.captionStyle!.copyWith(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
