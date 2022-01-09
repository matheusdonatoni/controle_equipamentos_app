import 'package:controle_equipamentos/app/ui/android/widgets/empty_object.dart';
import 'package:flutter/material.dart';

class EmptyMachine extends StatelessWidget {
  const EmptyMachine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyObject(
      userPhrase: 'Sem dados para esta máquina',
      adminPhrase: 'Sem dados para esta máquina',
    );
  }
}
