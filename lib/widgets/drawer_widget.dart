import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spicy/constants/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: isDarkMode ? Colors.transparent : Colors.transparent,
    //   statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    //   systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
    //   systemNavigationBarDividerColor:
    //       isDarkMode ? Colors.transparent : Colors.transparent,
    //   systemNavigationBarIconBrightness:
    //       isDarkMode ? Brightness.light : Brightness.dark,
    // ));
    const imageUrl =
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50";
    return Drawer(
      child: Container(
        color: isDarkMode
            ? AppColors.darkColorSecondary
            : AppColors.lightColorSecondary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Richu Antony"),
                accountEmail: Text("richuantony38@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: isDarkMode
                    ? AppColors.darkColorText
                    : AppColors.lightColorText,
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: isDarkMode
                    ? AppColors.darkColorText
                    : AppColors.lightColorText,
              ),
              title: const Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: isDarkMode
                    ? AppColors.darkColorText
                    : AppColors.lightColorText,
              ),
              title: const Text(
                "Email Me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
