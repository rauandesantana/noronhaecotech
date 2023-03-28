import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $EstTextoCampo extends InputDecoration {
  $EstTextoCampo({
    required BuildContext context,
    required BorderSide? bordaHabilitada,
    required BorderSide? bordaDesabilitada,
    required BorderSide? bordaFoco,
    required BorderSide? bordaErro,
    required BorderSide? bordaFocoErro,
    required BorderRadius? arredondarBorda,
    required EdgeInsetsGeometry? espacoInterno,
    required Color? corIcone,
    required IconData? iconeExterno,
    required String? textoTitulo,
    required TextStyle? estiloTitulo,
    required String? textoAjuda,
    required TextStyle? estiloAjuda,
    required String? textoErro,
    required TextStyle? estiloErro,
    required String? textoDica,
    required TextStyle? estiloDica,
    required Widget? componentePrefixo,
    required String? textoPrefixo,
    required TextStyle? estiloTextoPrefixo,
    required Widget? componenteSufixo,
    required String? textoSufixo,
    required TextStyle? estiloTextoSufixo,
  }) : super(
          isDense: true,
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderSide: bordaHabilitada ??
                BorderSide(
                  width: 1.0,
                  color: Theme.of(context).primaryColor,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: bordaDesabilitada ??
                BorderSide(
                  width: 1.0,
                  color: Theme.of(context).disabledColor,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: bordaFoco ??
                BorderSide(
                  width: 2.0,
                  color: Theme.of(context).primaryColor,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: bordaErro ??
                BorderSide(
                  width: 1.0,
                  color: Theme.of(context).colorScheme.error,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: bordaFocoErro ??
                BorderSide(
                  width: 2.0,
                  color: Theme.of(context).colorScheme.error,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          icon: (iconeExterno != null)
              ? Componentes.icone.padrao(icone: iconeExterno)
              : null,
          iconColor: (textoErro != null)
              ? Theme.of(context).colorScheme.error
              : corIcone ?? Theme.of(context).primaryColor,
          labelText: textoTitulo,
          labelStyle: estiloTitulo ??
              Estilos.texto.decorativo(
                tamanho: 14,
                corTexto: (textoErro != null)
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).primaryColor,
              ),
          helperText: textoAjuda,
          helperStyle: estiloAjuda ?? Estilos.texto.normal(),
          errorText: textoErro,
          errorStyle: estiloErro ?? Estilos.texto.normal(),
          hintText: textoDica,
          hintStyle: estiloDica ?? Estilos.texto.normal(),
          prefixIcon: componentePrefixo,
          prefixText: (textoPrefixo == null) ? null : "$textoPrefixo ",
          prefixStyle: estiloTextoPrefixo ?? Estilos.texto.normal(),
          prefixIconColor: (textoErro != null)
              ? Theme.of(context).colorScheme.error
              : corIcone ?? Theme.of(context).primaryColor,
          suffixIcon: componenteSufixo,
          suffixText: (textoSufixo == null) ? null : " $textoSufixo",
          suffixStyle: estiloTextoSufixo ?? Estilos.texto.normal(),
          suffixIconColor: (textoErro != null)
              ? Theme.of(context).colorScheme.error
              : corIcone ?? Theme.of(context).primaryColor,
          contentPadding: espacoInterno ??
              EdgeInsets.only(
                top: 15,
                bottom: 15,
                left: (componentePrefixo == null) ? 15 : 0,
                right: (componenteSufixo == null) ? 15 : 0,
              ),
        );
}
