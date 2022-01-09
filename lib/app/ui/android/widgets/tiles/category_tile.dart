import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/animations/animated_selectable_tile/animated_selectable_tile.dart';

import 'package:flutter/material.dart';
import 'icon_leading.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final void Function() onTap;
  final void Function() onLongPress;
  final bool selected;
  const CategoryTile({
    Key key,
    @required this.category,
    @required this.onTap,
    this.onLongPress,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSelectableTile(
      onLongPress: onLongPress,
      selected: selected,
      onTap: onTap,
      leading: IconLeading(Icons.label),
      title: Text(
        category.name,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    );
  }
}
