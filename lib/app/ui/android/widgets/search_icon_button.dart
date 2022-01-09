import 'package:flutter/material.dart';

class SearchIconButton extends StatelessWidget {
  final void Function() onPressed;
  const SearchIconButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: 'Abrir barra de pesquisa',
      icon: Icon(
        Icons.search,
      ),
    );
  }
}
