import 'package:mobx/mobx.dart';

part 'landing_controller.g.dart';

class LandingController = _LandingBase with _$LandingController;

abstract class _LandingBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
