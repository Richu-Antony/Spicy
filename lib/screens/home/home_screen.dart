import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/models/food_model.dart';
import 'package:spicy/widgets/drawer_widget.dart';
import 'package:spicy/widgets/item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

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
    var productsData = decodeData("products");
    FoodModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    if (kDebugMode) {
      print(productsData);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Home Screen");
    }
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: isDarkMode ? Colors.transparent : Colors.transparent,
    //   statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    //   systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
    //   systemNavigationBarDividerColor:
    //   isDarkMode ? Colors.transparent : Colors.transparent,
    //   systemNavigationBarIconBrightness:
    //   isDarkMode ? Brightness.light : Brightness.dark,
    // ));
    // final dummylist = List.generate(12, (index) => FoodModel.items[0]);

    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.darkColorPrimary : AppColors.lightColorPrimary,
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? AppColors.darkColorPrimary
            : AppColors.lightColorPrimary,
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Spicy",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (FoodModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: FoodModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: FoodModel.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),

      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     ElevatedButton(
      //         style: ButtonStyle(
      //           backgroundColor:
      //           MaterialStateProperty.all(AppColors.lightColorAccent),
      //         ),
      //         onPressed: () async {
      //           await FirebaseAuth.instance.signOut();
      //           // ignore: use_build_context_synchronously
      //           Navigator.pushReplacement(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const WelcomeScreen()));
      //         },
      //         child: const Text("Sign Out"))
      //   ],
      // ),

      drawer: const DrawerWidget(),
    );
  }
}
