import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/animations/animated_selectable_tile/animated_selectable_tile.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/tiles/rounded_picture_leading.dart';
import 'package:flutter/material.dart';

class MachineTile extends StatelessWidget {
  final Machine machine;
  final void Function() onTap;
  final void Function() onLongPress;
  final bool selected;
  const MachineTile({
    Key key,
    @required this.machine,
    @required this.onTap,
    this.onLongPress,
    this.selected = false,
  }) : super(key: key);

  Picture get picture => machine.picture;

  @override
  Widget build(BuildContext context) {
    return AnimatedSelectableTile(
      onTap: onTap,
      onLongPress: onLongPress,
      selected: selected,
      title: Text(
        machine.name,
      ),
      leading: RoundedPictureLeading(
        picture: picture,
        tag: machine.runtimeType.toString() + machine.id.toString(),
      ),
      subtitle: Text(
        machine.resume,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    );
  }
}
