import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';

class EditModeAppBar extends StatelessWidget {
  final int counter;
  final void Function() onClosePress;
  final List<Widget> singleSelectionActions;
  final List<Widget> multiSelectionActions;
  final PreferredSizeWidget bottom;
  const EditModeAppBar({
    Key key,
    @required this.counter,
    @required this.onClosePress,
    this.singleSelectionActions = const [],
    this.multiSelectionActions = const [],
    this.bottom,
  }) : super(key: key);

  List<Widget> get animatedSingleSelectionActions => List.generate(
        singleSelectionActions.length,
        (index) => AnimatedSwitcher(
          duration: kDuration,
          child:
              counter == 1 ? singleSelectionActions[index] : SizedBox.shrink(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onClosePress,
        icon: Icon(
          Icons.close,
        ),
      ),
      title: Text('$counter'),
      bottom: bottom,
      actions: [
        ...animatedSingleSelectionActions,
        ...multiSelectionActions,
      ],
    );
  }
}
