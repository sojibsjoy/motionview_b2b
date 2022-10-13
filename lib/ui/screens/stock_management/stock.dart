import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter/material.dart';

class StockManagementScreen extends StatelessWidget {
  static String routeName = '/stock_management';
  const StockManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            CustomAppbar(
              title: 'Stock Management',
            )
          ],
        ),
      ),
    );
  }
}
