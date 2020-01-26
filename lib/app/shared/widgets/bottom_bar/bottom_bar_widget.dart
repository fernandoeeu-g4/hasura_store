import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {

  BottomBarWidget({
    this.onTap,
    this.currentIndex,
    this.items
  });

  final onTap;
  final int currentIndex;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
