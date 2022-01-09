import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'implementations/models.dart';

class RxCategoryTab {
  Rxn<Widget> icon = Rxn<Widget>();
  Rxn<String> text = Rxn<String>();
  Rxn<int> tileCount = Rxn<int>();
}

class CategoryTab extends ModelImpl<CategoryTab> {
  CategoryTab({
    Widget icon,
    String text,
    int tileCount,
  }) {
    this.icon = icon ?? this.icon;
    this.text = text ?? this.text;
    this.tileCount = tileCount ?? this.tileCount;
  }

  final rx = RxCategoryTab();

  Widget get icon => rx.icon.value;
  set icon(Widget val) => rx.icon.value = val;

  String get text => rx.text.value;
  set text(String val) => rx.text.value = val;

  int get tileCount => rx.tileCount.value;
  set tileCount(int val) => rx.tileCount.value = val;

  String get tileCountIndicator {
    if (tileCount == null) return '-';

    if (tileCount > 99) {
      return '99+';
    } else if (tileCount == 0) {
      return '-';
    }
    return tileCount.toString();
  }

  @override
  void update(CategoryTab categoryTab) {
    this.icon = categoryTab.icon;
    this.text = categoryTab.text;
    this.tileCount = categoryTab.tileCount;
  }

  @override
  CategoryTab copyWith() => this;
}
