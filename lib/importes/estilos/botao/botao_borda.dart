import 'package:flutter/material.dart';

class $EstBotaoBorda extends ButtonStyle {
  $EstBotaoBorda({
    required BuildContext context,
    required bool habilitado,
    required Color? corPrimaria,
    required Color? corSecundaria,
    required Color? corDesabilitado,
    required Color? corFundo,
    required double? borda,
    required BorderRadius? arredondarBorda,
    required EdgeInsetsGeometry? espacoInterno,
  }) : super(
          iconColor: MaterialStatePropertyAll(
            (habilitado == false)
                ? corDesabilitado ?? Theme.of(context).disabledColor
                : corPrimaria ?? Theme.of(context).primaryColor,
          ),
          foregroundColor: MaterialStatePropertyAll(
            (habilitado == false)
                ? corDesabilitado ?? Theme.of(context).disabledColor
                : corPrimaria ?? Theme.of(context).primaryColor,
          ),
          overlayColor: MaterialStatePropertyAll(
            (corPrimaria ?? Theme.of(context).primaryColor).withOpacity(0.2),
          ),
          backgroundColor: MaterialStatePropertyAll(
            corFundo,
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              width: borda ?? 2,
              color: (habilitado == false)
                  ? corDesabilitado ?? Theme.of(context).disabledColor
                  : corPrimaria ?? Theme.of(context).primaryColor,
            ),
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
