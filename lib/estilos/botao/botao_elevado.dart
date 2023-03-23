import 'package:flutter/material.dart';

class $EstBotaoElevado extends ButtonStyle {
  $EstBotaoElevado({
    required BuildContext context,
    required Color? corPrimaria,
    required Color? corSecundaria,
    required BorderSide? borda,
    required BorderRadius? arredondarBorda,
    required EdgeInsetsGeometry? espacoInterno,
  }) : super(
          backgroundColor: MaterialStatePropertyAll(
            corPrimaria ?? Theme.of(context).primaryColor,
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
            espacoInterno ?? EdgeInsets.zero,
          ),
          alignment: Alignment.center,
        );
}
