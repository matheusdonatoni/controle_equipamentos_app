import 'package:controle_equipamentos/app/ui/android/widgets/empty_object.dart';
import 'package:flutter/material.dart';

class NoCatalogWarning extends StatelessWidget {
  NoCatalogWarning({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyObject(
      userPhrase: 'Ops... Parece a que sua unidade\n'
          'ainda não possui um catálgo :/',
      adminPhrase: 'Ops... Parece a que sua unidade\n'
          'ainda não possui um catálgo :/',
    );
  }
}
