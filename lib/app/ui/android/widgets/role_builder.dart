import 'package:controle_equipamentos/app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleBuilder extends GetView<AuthServices> {
  final Widget Function() userBuilder;
  final Widget Function() adminBuilder;
  final Widget Function() superUserBuilder;
  RoleBuilder({
    Key key,
    this.userBuilder,
    this.adminBuilder,
    this.superUserBuilder,
  }) : super(key: key);

  Widget superCascadeBuilder() {
    if (superUserBuilder != null) {
      return superUserBuilder();
    }
    return adminCascadeBuilder();
  }

  Widget adminCascadeBuilder() {
    if (adminBuilder != null) {
      return adminBuilder();
    }
    return userCascadeBuilder();
  }

  Widget userCascadeBuilder() {
    if (userBuilder != null) {
      return userBuilder();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.user.isSuperUser)
          return superCascadeBuilder();
        else if (controller.user.isAdmin)
          return adminCascadeBuilder();
        else
          return userCascadeBuilder();
      },
    );
  }
}
