import 'package:flutter/material.dart';
import 'package:get/get.dart';


extension StateExt<T> on StateMixin<T> {
  Widget simpleObx(
    NotifierBuilder<T> widget, {
    Widget onEmpty = const SizedBox.shrink(),
  }) {
    return SimpleBuilder(builder: (_) {
      if (status.isSuccess) {
        return widget(value);
      }
      if (status.isEmpty) return onEmpty;
      return const SizedBox.shrink();
    });
  }

  bool get isLoadingMore => status.isLoadingMore;
  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isError => status.isError;
  bool get isEmpty => status.isEmpty;

  /// Change only the status.
  void _changeStatus(RxStatus status) {
    change(value, status: status);
  }

  /// Change status to Loading;
  void changeToLoading() {
    _changeStatus(RxStatus.loading());
  }

  /// Change status to isLoadingMore;
  void changeToLoadingMore() {
    _changeStatus(RxStatus.loadingMore());
  }

  /// Change status to Success;
  void changeToSuccess() {
    _changeStatus(RxStatus.success());
  }

  /// Change status to Empty;
  void changeToEmpty() {
    _changeStatus(RxStatus.empty());
  }

  RxStatus _assignState(T newState) {
    if (newState is Iterable) {
      return newState.isEmpty ? RxStatus.empty() : RxStatus.success();
    }

    return newState == null ? RxStatus.empty() : RxStatus.success();
  }

  void assign(T newState) {
    change(
      newState,
      status: _assignState(newState),
    );
  }
}
