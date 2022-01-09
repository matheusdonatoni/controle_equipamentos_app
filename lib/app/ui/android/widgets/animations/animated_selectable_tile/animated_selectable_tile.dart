import 'package:flutter/material.dart';
import 'animated_selectable_tile_bloc.dart';
import '../../scalable_check_circle.dart';

class AnimatedSelectableTile extends StatefulWidget {
  final Widget title;
  final Widget leading;
  final Widget subtitle;
  final Widget trailing;
  final void Function() onTap;
  final void Function() onLongPress;
  final bool selected;
  final Color selectionColor;
  const AnimatedSelectableTile({
    Key key,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.selectionColor,
  }) : super(key: key);

  @override
  _AnimatedSelectableTileState createState() => _AnimatedSelectableTileState();
}

class _AnimatedSelectableTileState extends State<AnimatedSelectableTile> {
  AnimatedSelectableTileBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = AnimatedSelectableTileBloc(
      selectionColor: widget.selectionColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc.selected = widget.selected;

    return AnimatedBuilder(
      animation: bloc.controller,
      builder: (context, _) => ListTile(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        title: widget.title,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        tileColor: bloc.color.value,
        leading: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              widget.leading,
              Positioned(
                bottom: -7,
                right: -7,
                child: ScalableCheckCircle(
                  scale: bloc.size.value,
                  selectionColor: widget.selectionColor,
                ),
              ),
            ],
          ),
        ),
        subtitle: widget.subtitle,
        trailing: widget.trailing,
      ),
    );
  }
}
