import 'package:controle_equipamentos/app/ui/android/widgets/role_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyObject extends StatelessWidget {
  final String userPhrase;
  final String adminPhrase;
  const EmptyObject({
    Key key,
    @required this.userPhrase,
    @required this.adminPhrase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoleBuilder(
        userBuilder: () => Center(
          child: Text(
            userPhrase,
            style: Get.textTheme.headline6.copyWith(
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        adminBuilder: () => Center(
          child: Text(
            adminPhrase,
            style: Get.textTheme.headline6.copyWith(
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
