import 'package:mobx_hasura/app/modules/landing/widgets/app_indexed_stack/app_indexed_stack_controller.dart';
import 'package:mobx_hasura/app/modules/home/home_module.dart';
import 'package:mobx_hasura/app/modules/landing/landing_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_hasura/app/modules/landing/landing_page.dart';

class LandingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppIndexedStackController()),
        Bind((i) => LandingController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LandingPage()),
        Router('/home', module: HomeModule()),
        // Router('')
      ];

  static Inject get to => Inject<LandingModule>.of();
}
