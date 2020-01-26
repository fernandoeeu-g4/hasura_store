import 'package:flutter/material.dart';
import 'package:mobx_hasura/app/modules/home/home_module.dart';
import 'package:mobx_hasura/app/modules/landing/widgets/app_indexed_stack/app_indexed_stack_widget.dart';
import 'package:mobx_hasura/app/modules/settings/settings_module.dart';
import 'package:mobx_hasura/app/modules/settings/settings_page_router.dart';
import 'package:mobx_hasura/app/shared/app_constants.dart';
import 'package:mobx_hasura/app/shared/widgets/bottom_bar/bottom_bar_widget.dart';

class LandingPage extends StatefulWidget {
  final String title;
  const LandingPage({Key key, this.title = "Landing"}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
    
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarWidget(
        items: AppConstants.bottomNavigationItems,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        children: <Widget>[
          HomeModule(),
          SettingsPageRouter(),
        ],
      ),
    );
  }
}
