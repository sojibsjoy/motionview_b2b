import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerSetup extends StatelessWidget {
  static String routeName = '/home';
  const DrawerSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      duration: const Duration(milliseconds: 400),
      angle: -10,
      borderRadius: 35.0,
      showShadow: true,
      mainScreenTapClose: true,
      androidCloseOnBackTap: true,
      style: DrawerStyle.defaultStyle,
      menuScreenWidth: double.infinity,
      shadowLayer2Color:
          // context.isDarkMode ? ConstantColors.k1F2225 :
          ConstantColors.kLightTheme2,
      shadowLayer1Color:
          // context.isDarkMode ? ConstantColors.k0F1113 :
          ConstantColors.kLightTheme3,
      menuScreen: const MenuScreen(),
      mainScreen: const HomeScreen(),
    );
  }
}
