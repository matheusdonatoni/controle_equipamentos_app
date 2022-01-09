import 'package:controle_equipamentos/app/data/models/measurement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'measurement_bottom_sheet.dart';

class MeasurementButton extends FormField<Measurement> {
  final void Function(Measurement value) onChanged;

  MeasurementButton({
    @required this.onChanged,
    Key key,
    FormFieldSetter<Measurement> onSaved,
    FormFieldValidator<Measurement> validator,
    Measurement initialValue,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.disabled,
            builder: (FormFieldState<Measurement> state) {
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
                        var measurement = await Get.bottomSheet<Measurement>(
                          MeasurementBottomSheet(),
                        );

                        state.didChange(measurement);

                        onChanged(measurement);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.value == null
                                ? 'Unidade de medida'
                                : 'Unidade de medida: ${state.value.name}',
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
            });
}
