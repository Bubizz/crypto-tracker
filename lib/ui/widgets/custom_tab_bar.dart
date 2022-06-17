import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({Key? key, required this.tabs}) : super(key: key);

  List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return 
    Material(
      color: Colors.black,
      child: TabBar(
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        tabs: tabs,
      ),
    );
  }
}
