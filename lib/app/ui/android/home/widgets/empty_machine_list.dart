import 'package:controle_equipamentos/app/ui/android/widgets/empty_object.dart';
import 'package:flutter/material.dart';

class EmptyMachineList extends StatelessWidget {
  const EmptyMachineList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyObject(
      userPhrase: 'Ops.. Não há nenhum equipamento cadastrado ainda.',
      adminPhrase: 'Ops.. Não há nenhum equipamento cadastrado ainda.',
    );
  }
}
