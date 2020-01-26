import 'package:flutter/material.dart';

class AppConstants {
  static const List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Feed')),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Reviews')),
    BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('Profile')),
  ];
}