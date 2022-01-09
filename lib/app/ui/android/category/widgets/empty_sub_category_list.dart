import 'package:controle_equipamentos/app/ui/android/widgets/empty_object.dart';
import 'package:flutter/material.dart';

class EmptySubCategoryList extends StatelessWidget {
  const EmptySubCategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyObject(
      userPhrase: 'Esta lista de subseções ainda está vazia!',
      adminPhrase: 'Esta lista de subseções ainda está vazia!\n\n'
          'Comece a dar vida à ela\ntocando no botão +',
    );
  }
}
