import 'package:flutter/material.dart';
import 'package:mobx_hasura/app/modules/settings/profile/profile_module.dart';
import 'package:mobx_hasura/app/modules/settings/settings_module.dart';
import 'package:mobx_hasura/app/modules/settings/settings_page.dart';

class SettingsPageRouter extends StatefulWidget {
  @override
  _SettingsPageRouterState createState() => _SettingsPageRouterState();
}

class _SettingsPageRouterState extends State<SettingsPageRouter> with AutomaticKeepAliveClientMixin {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('pop scope settings page router');
        final isFirstRouteInCurrentTab =
            !await _navigatorKey.currentState.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Navigator(
        key: _navigatorKey,
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
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
