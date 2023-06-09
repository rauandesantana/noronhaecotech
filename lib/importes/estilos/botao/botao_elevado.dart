import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Estilos Botão Elevado
class $EstBotaoElevado extends ButtonStyle {
  $EstBotaoElevado({
    required BuildContext context,
    required bool habilitado,
    required Color? corPrimaria,
    required Color? corSecundaria,
    required BorderSide? borda,
    required BorderRadius? arredondarBorda,
    required EdgeInsetsGeometry? espacoInterno,
  }) : super(
          iconColor: MaterialStatePropertyAll(
            Estilos.cor(context).background,
          ),
          backgroundColor: MaterialStatePropertyAll(
            (habilitado == false)
                ? corSecundaria ?? Estilos.cor(context).secondary
                : corPrimaria ?? Estilos.cor(context).primary,
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
                  vertical: 5,
                ),
          ),
          alignment: Alignment.center,
        );
}
