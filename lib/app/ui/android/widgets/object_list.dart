import 'package:flutter/material.dart';

class ObjectList extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const ObjectList({
    Key key,
    @required this.itemCount,
    @required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: itemBuilder,
    );
  }
}
