import 'package:get/get.dart';

mixin AsyncTabCounterMixin<T> {
  Rx<int> _count = Rx<int>(0);
  int get count => _count.value;

  void updateCounter(Future<int> Function() asyncCount) async => _count(
        await asyncCount(),
      );
}
