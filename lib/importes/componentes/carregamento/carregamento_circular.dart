import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Carregamento Circular
class $ComCarregamentoCircular extends StatelessWidget {
  final double? valor;
  final Color? corBarra;
  final double? espessura;
  final Widget? conteudo;

  const $ComCarregamentoCircular({
    required Key? chave,
    required this.valor,
    required this.corBarra,
    required this.espessura,
    required this.conteudo,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return (conteudo != null)
        ? Stack(
            alignment: Alignment.center,
            children: <Widget>[
              conteudo!,
              SizedBox.expand(
                child: CircularProgressIndicator(
                  value: valor,
                  color: corBarra ?? Estilos.cor(context).primary,
                  strokeWidth: espessura ?? 4.0,
                ),
              ),
            ],
          )
        : CircularProgressIndicator(
            value: valor,
            color: corBarra ?? Estilos.cor(context).primary,
            strokeWidth: espessura ?? 4.0,
          );
  }
}
