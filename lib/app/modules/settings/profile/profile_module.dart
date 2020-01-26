import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx_hasura/app/modules/settings/profile/profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_hasura/app/modules/settings/profile/profile_page.dart';

class ProfileModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ProfilePage()),
      ];

  static Inject get to => Inject<ProfileModule>.of();

  @override
  // TODO: implement view
  Widget get view => ProfilePage();
}
