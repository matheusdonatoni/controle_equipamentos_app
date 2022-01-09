import 'package:controle_equipamentos/app/ui/android/widgets/empty_object.dart';
import 'package:flutter/material.dart';

class EmptyItemList extends StatelessWidget {
  const EmptyItemList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyObject(
      userPhrase: 'Esta lista de peças ainda está vazia!',
      adminPhrase: 'Esta lista de peças ainda está vazia!\n\n'
          'Comece a dar vida à ela\ntocando no botão +',
    );
  }
}
