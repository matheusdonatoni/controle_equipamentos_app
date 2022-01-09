import 'package:controle_equipamentos/app/ui/android/widgets/empty_object.dart';
import 'package:flutter/material.dart';

class EmptyCategory extends StatelessWidget {
  const EmptyCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyObject(
      userPhrase: 'Esta subseção ainda está vazia!',
      adminPhrase: 'Esta subseção ainda está vazia!\n\n'
          'Comece a dar vida à ela\ntocando no botão +',
    );
  }
}
