import 'package:flutter/material.dart';

class AppIndexedStackWidget extends StatelessWidget {
  AppIndexedStackWidget({
    this.bodyList,
    this.currentIndex
  });

  final int currentIndex;
  final List<Widget> bodyList;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: bodyList,
    );
  }
}