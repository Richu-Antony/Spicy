import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/screens/entry/welcome_screen.dart';

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
      backgroundColor: isDarkMode
          ? AppColors.darkColorSecondary
          : AppColors.lightColorSecondary,
      child: Container(
        color: isDarkMode
            ? AppColors.darkColorSecondary
            : AppColors.lightColorSecondary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: isDarkMode
                    ? AppColors.darkColorSecondary
                    : AppColors.lightColorSecondary,
              ),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.darkColorSecondary
                      : AppColors.lightColorSecondary,
                ),
                margin: EdgeInsets.zero,
                accountName: Text(
                  "User Name",
                  style: TextStyle(
                    color: isDarkMode
                        ? AppColors.darkColorText
                        : AppColors.lightColorText,
                  ),
                ),
                accountEmail: Text(
                  "emailname@gmail.com",
                  style: TextStyle(
                    color: isDarkMode
                        ? AppColors.darkColorText
                        : AppColors.lightColorText,
                  ),
                ),
                currentAccountPicture: const CircleAvatar(
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
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: isDarkMode
                      ? AppColors.darkColorText
                      : AppColors.lightColorText,
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
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: isDarkMode
                      ? AppColors.darkColorText
                      : AppColors.lightColorText,
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
              title: Text(
                "Email Me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: isDarkMode
                      ? AppColors.darkColorText
                      : AppColors.lightColorText,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                MaterialCommunityIcons.logout,
                color: isDarkMode
                    ? AppColors.darkColorText
                    : AppColors.lightColorText,
              ),
              title: InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                },
                child: Text(
                  "Logout",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: isDarkMode
                        ? AppColors.darkColorText
                        : AppColors.lightColorText,
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
