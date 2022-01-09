import 'package:controle_equipamentos/app/ui/android/widgets/empty_object.dart';
import 'package:flutter/material.dart';

class EmptyItemsList extends StatelessWidget {
  const EmptyItemsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyObject(
      userPhrase: '',
      adminPhrase: 'Não existem peças cadastradas ainda.',
    );
  }
}
