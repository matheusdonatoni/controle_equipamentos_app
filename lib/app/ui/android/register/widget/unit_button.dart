import 'package:controle_equipamentos/app/data/models/unit.dart';
import 'package:controle_equipamentos/app/ui/android/register/widget/unit_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitButton extends FormField<Unit> {
  UnitButton({
    Key key,
    FormFieldSetter<Unit> onSaved,
    FormFieldValidator<Unit> validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<Unit> state) {
            var themeData = Theme.of(state.context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48.0,
                  width: MediaQuery.of(state.context).size.width,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.resolveWith((_) {
                        return BorderSide(
                          color: state.hasError
                              ? themeData.errorColor
                              : themeData.colorScheme.onSurface
                                  .withOpacity(0.35),
                        );
                      }),
                    ),
                    onPressed: () async {
                      var unit = await Get.bottomSheet<Unit>(UnitBottomSheet());
                      state.didChange(unit);
                      onSaved(unit);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.value == null
                              ? 'Unidade JBS'
                              : '${state.value.code} - ${state.value.name}',
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      top: 8.0,
                    ),
                    child: Text(
                      state.errorText,
                      style: themeData.textTheme.caption
                          .copyWith(
                            color: themeData.errorColor,
                          )
                          .merge(
                            themeData.inputDecorationTheme.errorStyle,
                          ),
                    ),
                  )
              ],
            );
          },
        );
}
