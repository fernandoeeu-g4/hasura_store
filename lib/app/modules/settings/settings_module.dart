import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx_hasura/app/modules/home/home_module.dart';
import 'package:mobx_hasura/app/modules/settings/settings_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_hasura/app/modules/settings/settings_page.dart';

class SettingsModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => SettingsController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SettingsPage()),
        Router('/teste', module: HomeModule())
      ];

  static Inject get to => Inject<SettingsModule>.of();

  @override
  // TODO: implement view
  Widget get view => SettingsPage();
}
