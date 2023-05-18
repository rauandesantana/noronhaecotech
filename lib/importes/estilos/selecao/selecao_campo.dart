import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Estilos Seleção Campo
class $EstSelecaoCampo extends InputDecoration {
  $EstSelecaoCampo({
    required BuildContext context,
    required bool? habilitado,
    required BorderSide? bordaHabilitada,
    required BorderSide? bordaDesabilitada,
    required BorderSide? bordaFoco,
    required BorderSide? bordaErro,
    required BorderSide? bordaFocoErro,
    required BorderRadius? arredondarBorda,
    required EdgeInsetsGeometry? espacoInterno,
    required Color? corIcone,
    required String? textoTitulo,
    required String? textoAjuda,
    required String? textoErro,
    required String? textoDica,
    required String? textoPrefixo,
    required String? textoSufixo,
    required Widget? componenteExterno,
    required Widget? componentePrefixo,
    required Widget? componenteSufixo,
    required TextStyle? estiloTitulo,
    required TextStyle? estiloAjuda,
    required TextStyle? estiloErro,
    required TextStyle? estiloDica,
    required TextStyle? estiloTextoPrefixo,
    required TextStyle? estiloTextoSufixo,
  }) : super(
          isDense: true,
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderSide: bordaHabilitada ??
                BorderSide(
                  width: 1.0,
                  color: (habilitado == false)
                      ? Theme.of(context).disabledColor
                      : Theme.of(context).primaryColor,
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
          icon: (componenteExterno != null) ? componenteExterno : null,
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
          prefixStyle: estiloTextoPrefixo ??
              Estilos.texto.normal(
                corTexto: (textoErro != null)
                    ? Theme.of(context).colorScheme.error
                    : corIcone ??
                        Theme.of(context).primaryColor.withOpacity(0.8),
                tamanho: 16,
              ),
          prefixIconColor: (textoErro != null)
              ? Theme.of(context).colorScheme.error
              : corIcone ?? Theme.of(context).primaryColor,
          suffixIcon: componenteSufixo,
          suffixText: (textoSufixo == null) ? null : " $textoSufixo",
          suffixStyle: estiloTextoSufixo ??
              Estilos.texto.normal(
                corTexto: (textoErro != null)
                    ? Theme.of(context).colorScheme.error
                    : corIcone ??
                        Theme.of(context).primaryColor.withOpacity(0.8),
                tamanho: 16,
              ),
          suffixIconColor: (textoErro != null)
              ? Theme.of(context).colorScheme.error
              : corIcone ?? Theme.of(context).primaryColor,
          contentPadding: espacoInterno ??
              EdgeInsets.only(
                top: 12,
                bottom: 12,
                left: (componentePrefixo == null) ? 15 : 0,
                right: (componenteSufixo == null) ? 5 : 0,
              ),
        );
}
