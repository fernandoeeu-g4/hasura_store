import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primaryColor: Color(0xffa1caff),
        accentColor: Color(0xffFF5A5F)
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
