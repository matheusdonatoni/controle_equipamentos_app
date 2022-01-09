import 'package:controle_equipamentos/app/ui/android/widgets/empty_object.dart';
import 'package:flutter/material.dart';

class EmptyPictureList extends StatelessWidget {
  const EmptyPictureList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  EmptyObject(
      userPhrase: 'Ops... Parece a que ainda não\n'
          'existem imagens cadastradas :/',
      adminPhrase: 'Ops... Parece a que ainda não\n'
          'existem imagens cadastradas :/',
    );
  }
}