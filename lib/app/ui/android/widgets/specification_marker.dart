import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecificationMarker extends StatelessWidget {
  final String spec;
  const SpecificationMarker(
    this.spec, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 6),
        SizedBox(
          width: 4.0,
        ),
        Text(
          spec,
          style: Get.textTheme.subtitle1,
        ),
      ],
    );
  }
}
