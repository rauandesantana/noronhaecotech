import 'package:flutter/material.dart';

class $EstBotaoTexto extends ButtonStyle {
  $EstBotaoTexto({
    required BuildContext context,
    required bool habilitado,
    required Color? corPrimaria,
    required Color? corSecundaria,
    required Color? corDesabilitado,
    required BorderRadius? arredondarBorda,
    required EdgeInsetsGeometry? espacoInterno,
  }) : super(
    iconColor: MaterialStatePropertyAll(
      (habilitado == false)
          ? corDesabilitado ?? Theme.of(context).disabledColor
          : corPrimaria ?? Theme.of(context).primaryColor,
    ),
    side: const MaterialStatePropertyAll(
      BorderSide.none,
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
            vertical: 5,
          ),
    ),
    alignment: Alignment.center,
  );
}
