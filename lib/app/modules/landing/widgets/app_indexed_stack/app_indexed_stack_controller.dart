import 'package:mobx/mobx.dart';

part 'app_indexed_stack_controller.g.dart';

class AppIndexedStackController = _AppIndexedStackBase
    with _$AppIndexedStackController;

abstract class _AppIndexedStackBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
