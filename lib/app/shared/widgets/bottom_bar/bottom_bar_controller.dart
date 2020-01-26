import 'package:mobx/mobx.dart';

part 'bottom_bar_controller.g.dart';

class BottomBarController = _BottomBarBase with _$BottomBarController;

abstract class _BottomBarBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
