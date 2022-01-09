import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/role_builder.dart';
import 'package:flutter/material.dart';

class PopupActionButton extends StatelessWidget {
  final void Function(ObjectAction) onSelected;
  final List<PopupMenuItem<ObjectAction>> extraOptions;
  const PopupActionButton({
    Key key,
    this.onSelected,
    this.extraOptions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoleBuilder(
      adminBuilder: () => PopupMenuButton<ObjectAction>(
        onSelected: onSelected,
        itemBuilder: (context) => [
          PopupMenuItem<ObjectAction>(
            value: ObjectAction.edit,
            child: Text('Editar'),
          ),
          ...extraOptions,
          PopupMenuItem<ObjectAction>(
            value: ObjectAction.delete,
            child: Text('Deletar'),
          ),
        ],
      ),
    );
  }
}
