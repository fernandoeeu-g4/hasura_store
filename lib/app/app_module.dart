import 'package:mobx_hasura/app/shared/widgets/bottom_bar/bottom_bar_controller.dart';
import 'package:mobx_hasura/app/modules/landing/landing_module.dart';
import 'package:mobx_hasura/app/shared/widgets/label/label_controller.dart';
import 'package:mobx_hasura/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx_hasura/app/app_widget.dart';
import 'package:mobx_hasura/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BottomBarController()),
        Bind((i) => LabelController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LandingModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
