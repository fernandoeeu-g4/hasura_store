import 'package:flutter/material.dart';
import 'package:mobx_hasura/app/modules/settings/profile/profile_module.dart';
import 'package:mobx_hasura/app/modules/settings/settings_module.dart';
import 'package:mobx_hasura/app/modules/settings/settings_page.dart';

class SettingsPageRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'settings',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'settings':
            builder = (BuildContext _) => SettingsModule();
            break;
          case 'settings/profile':
            builder = (BuildContext _) => ProfileModule();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
