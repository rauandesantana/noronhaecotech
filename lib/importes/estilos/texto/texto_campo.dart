import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Estilos Texto Campo
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
                  color: (textoErro != null)
                      ? Estilos.cor(context).error
                      : Estilos.cor(context).primary,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: bordaDesabilitada ??
                BorderSide(
                  width: 1.0,
                  color: Estilos.cor(context).secondary,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: bordaFoco ??
                BorderSide(
                  width: 2.0,
                  color: (textoErro != null)
                      ? Estilos.cor(context).error
                      : Estilos.cor(context).primary,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: bordaErro ??
                BorderSide(
                  width: 1.0,
                  color: Estilos.cor(context).error,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: bordaFocoErro ??
                BorderSide(
                  width: 2.0,
                  color: Estilos.cor(context).error,
                ),
            borderRadius: arredondarBorda ?? BorderRadius.circular(15),
          ),
          icon: (componenteExterno != null) ? componenteExterno : null,
          iconColor: (textoErro != null)
              ? Estilos.cor(context).error
              : corIcone ?? Estilos.cor(context).primary,
          labelText: textoTitulo,
          labelStyle: estiloTitulo ??
              Estilos.texto.decorativo(
                tamanho: 14,
                corTexto: (textoErro != null)
                    ? Estilos.cor(context).error
                    : Estilos.cor(context).primary,
              ),
          helperText: textoAjuda,
          helperStyle: estiloAjuda ?? Estilos.texto.normal(),
          errorText: (textoErro == null || textoErro.isEmpty)
              ? null
              : "${utf8.decode([32]) * 6}$textoErro",
          errorStyle: estiloErro ?? Estilos.texto.normal(),
          hintText: textoDica,
          hintStyle: estiloDica ?? Estilos.texto.normal(tamanho: 16),
          prefixIcon: componentePrefixo,
          prefixText: (textoPrefixo == null) ? null : "$textoPrefixo ",
          prefixStyle: estiloTextoPrefixo ??
              Estilos.texto.normal(
                corTexto: (textoErro != null)
                    ? Estilos.cor(context).error
                    : corIcone ?? Estilos.cor(context).primary.withOpacity(0.8),
                tamanho: 16,
              ),
          prefixIconColor: (textoErro != null)
              ? Estilos.cor(context).error
              : corIcone ?? Estilos.cor(context).primary,
          suffixIcon: componenteSufixo,
          suffixText: (textoSufixo == null) ? null : " $textoSufixo",
          suffixStyle: estiloTextoSufixo ??
              Estilos.texto.normal(
                corTexto: (textoErro != null)
                    ? Estilos.cor(context).error
                    : corIcone ?? Estilos.cor(context).primary.withOpacity(0.8),
                tamanho: 16,
              ),
          suffixIconColor: (textoErro != null)
              ? Estilos.cor(context).error
              : corIcone ?? Estilos.cor(context).primary,
          contentPadding: espacoInterno ??
              EdgeInsets.only(
                top: 15,
                bottom: 15,
                left: (componentePrefixo == null) ? 15 : 0,
                right: (componenteSufixo == null) ? 15 : 0,
              ),
        );
}
