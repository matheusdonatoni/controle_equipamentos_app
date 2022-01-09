import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;
  final String message;
  const BottomSheetHeader({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 3.0,
              width: 30.0,
              decoration: BoxDecoration(
                color: Get.theme.dividerColor,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Text(
              title,
              style: Get.textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Text(
              message,
              style: Get.textTheme.subtitle1,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
