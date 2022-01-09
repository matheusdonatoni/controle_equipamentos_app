import 'dart:async';

import 'package:get/get.dart';

import 'state_mixin_extension.dart';

abstract class GetxControllerImpl<T> extends GetxController with StateMixin<T> {
  T get initial;

  StreamSubscription<T> _subscription;

  Stream<T> get stream;

  /// callback for every state change;
  void onData(T value) {}

  void _subscribe() async {
    assign(initial);

    if (stream != null) {
      _subscription = stream.listen((newState) {
        assign(newState);

        if (onData != null) onData(newState);
      });
    }
  }

  void _closeSubscription() {
    if (_subscription != null) {
      _subscription.cancel();
    }
  }

  @override
  void onInit() {
    super.onInit();

    _subscribe();
  }

  @override
  void onClose() {
    _closeSubscription();

    super.onClose();
  }
}
