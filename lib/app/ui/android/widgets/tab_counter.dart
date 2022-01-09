import 'package:flutter/material.dart';

class TabCounter extends StatelessWidget {
  final int count;
  const TabCounter(
    this.count, {
    Key key,
  }) : super(key: key);

  String get text {
    if (count == null) return '0';

    if (count > 99) {
      return '99+';
    } else if (count == 0) {
      return '0';
    }

    return count.toString();
  }

  bool get isEmpty => count == null || count == 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.remove,
          size: 12,
        ),
        SizedBox(
          width: 6.0,
        ),
        Text(text),
      ],
    );
  }
}
