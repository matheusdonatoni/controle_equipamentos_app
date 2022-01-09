import 'package:controle_equipamentos/app/data/models/sector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sector_bottom_sheet.dart';

class SectorButton extends FormField<Sector> {
  SectorButton({
    Key key,
    FormFieldSetter<Sector> onSaved,
    FormFieldValidator<Sector> validator,
    Sector initialValue,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.disabled,
          builder: (FormFieldState<Sector> state) {
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
                              ? Get.theme.errorColor
                              : Get.theme.colorScheme.onSurface
                                  .withOpacity(0.35),
                        );
                      }),
                    ),
                    onPressed: () async {
                      var sector = await showModalBottomSheet<Sector>(
                        context: state.context,
                        builder: (context) => SectorBottomSheet(),
                      );
                      if (sector != null) state.didChange(sector);
                      state.save();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.value == null
                              ? 'Setor'
                              : 'Setor: ${state.value.name}',
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
                      style: Get.textTheme.caption
                          .copyWith(
                            color: Get.theme.errorColor,
                          )
                          .merge(
                            Get.theme.inputDecorationTheme.errorStyle,
                          ),
                    ),
                  )
              ],
            );
          },
        );
}
