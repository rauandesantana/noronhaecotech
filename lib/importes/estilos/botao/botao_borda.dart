import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Estilos Botão Borda
class $EstBotaoBorda extends ButtonStyle {
  $EstBotaoBorda({
    required BuildContext context,
    required bool habilitado,
    required Color? corPrimaria,
    required Color? corSecundaria,
    required Color? corFundo,
    required double? borda,
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
          side: MaterialStatePropertyAll(
            BorderSide(
              width: borda ?? 2,
              color: (habilitado == false)
                  ? corSecundaria ?? Estilos.cor(context).secondary
                  : corPrimaria ?? Estilos.cor(context).primary,
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
