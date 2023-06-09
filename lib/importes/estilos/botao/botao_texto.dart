import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Estilos Botão Texto
class $EstBotaoTexto extends ButtonStyle {
  $EstBotaoTexto({
    required BuildContext context,
    required bool habilitado,
    required Color? corPrimaria,
    required Color? corSecundaria,
    required Color? corFundo,
    required BorderRadius? arredondarBorda,
    required EdgeInsetsGeometry? espacoInterno,
  }) : super(
          iconColor: MaterialStatePropertyAll(
            (habilitado == false)
                ? corSecundaria ?? Estilos.cor(context).secondary
                : corPrimaria ?? Estilos.cor(context).primary,
          ),
          foregroundColor: MaterialStatePropertyAll(
            (habilitado == false)
                ? corSecundaria ?? Estilos.cor(context).secondary
                : corPrimaria ?? Estilos.cor(context).primary,
          ),
          overlayColor: MaterialStatePropertyAll(
            (corPrimaria ?? Estilos.cor(context).primary).withOpacity(0.2),
          ),
          backgroundColor: MaterialStatePropertyAll(
            corFundo,
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
