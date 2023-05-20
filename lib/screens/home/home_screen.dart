import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/constants/routes.dart';
import 'package:spicy/models/food_model.dart';
import 'package:spicy/widgets/drawer_widget.dart';
import 'package:spicy/widgets/staggered_dots_wave_progress_indication_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'foodlist_list.dart';
import 'foodlist_header.dart';

// Stateful Main Widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// All Main Operations
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var foodproductjson =
        await rootBundle.loadString("assets/json/food_products.json");
    var decodeData = jsonDecode(foodproductjson);
    var productsData = decodeData["products"];
    FoodModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    if (kDebugMode) {
      print(productsData);
    }
  }

  // Context Builder Area
  @override
  Widget build(BuildContext context) {
    // final dummylist = List.generate(12, (index) => FoodModel.items[0]);
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Spicy',
          style: TextStyle(
            color:
                isDarkMode ? AppColors.darkColorText : AppColors.lightColorText,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: isDarkMode
                  ? AppColors.darkColorText
                  : AppColors.lightColorText,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartScreenRoute);
        },
        backgroundColor: isDarkMode
            ? AppColors.lightColorTextVarient
            : AppColors.darkColorText,
        child: Icon(
          CupertinoIcons.cart,
          color:
              isDarkMode ? AppColors.darkColorText : AppColors.lightColorText,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FoodlistHeader(),
              if (FoodModel.items.isNotEmpty)
                const FoodlistList().expand()
              else
                const Expanded(
                  child: Center(
                    child: StaggeredDotsWaveProgressIndicationWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
