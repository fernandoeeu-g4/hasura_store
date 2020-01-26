import 'package:mobx/mobx.dart';

part 'label_controller.g.dart';

class LabelController = _LabelBase with _$LabelController;

abstract class _LabelBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
