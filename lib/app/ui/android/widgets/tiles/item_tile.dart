import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/animations/animated_selectable_tile/animated_selectable_tile.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/tiles/rounded_picture_leading.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  final void Function() onTap;
  final void Function() onLongPress;
  final bool selected;
  final Color color;
  const ItemTile({
    Key key,
    @required this.item,
    @required this.onTap,
    this.onLongPress,
    this.selected = false,
    this.color,
  }) : super(key: key);

  Picture get picture => item.picture;

  @override
  Widget build(BuildContext context) {
    return AnimatedSelectableTile(
      onTap: onTap,
      onLongPress: onLongPress,
      selected: selected,
      selectionColor: color,
      title: Text(
        item.name,
      ),
      leading: RoundedPictureLeading(
        picture: picture,
        tag: item.runtimeType.toString() + item.id.toString(),
      ),
      subtitle: Text(
        item.resume,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    );
  }
}
