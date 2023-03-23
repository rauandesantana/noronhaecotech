import 'package:flutter/material.dart';

class $EstBotaoElevado extends ButtonStyle {
  $EstBotaoElevado({
    required BuildContext context,
    required bool habilitado,
    required Color? corPrimaria,
    required Color? corSecundaria,
    required Color? corDesabilitado,
    required BorderSide? borda,
    required BorderRadius? arredondarBorda,
    required EdgeInsetsGeometry? espacoInterno,
  }) : super(
          backgroundColor: MaterialStatePropertyAll(
            (habilitado == false)
                ? corDesabilitado ?? Theme.of(context).disabledColor
                : corPrimaria ?? Theme.of(context).primaryColor,
          ),
          iconColor: MaterialStatePropertyAll(
            corSecundaria ?? Theme.of(context).scaffoldBackgroundColor,
          ),
          side: MaterialStatePropertyAll(
            borda,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: arredondarBorda ?? BorderRadius.circular(15),
            ),
          ),
          padding: MaterialStatePropertyAll(
            espacoInterno ??
                const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
          ),
          alignment: Alignment.center,
        );
}
