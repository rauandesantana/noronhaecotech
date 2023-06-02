import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Texto Campo Celular
class $ComTextoCampoCelular extends StatefulWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
  final ControladorCelular controlador;
  final FocusNode? foco;
  final bool? autoFoco;
  final TextInputAction? acaoBotaoTeclado;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final IconData? iconePrefixo;
  final EditableTextContextMenuBuilder? menuTexto;

  const $ComTextoCampoCelular({
    required Key? chave,
    required this.habilitado,
    required this.bloqueado,
    required this.botaoLimpar,
    required this.controlador,
    required this.foco,
    required this.autoFoco,
    required this.acaoBotaoTeclado,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.iconePrefixo,
    required this.menuTexto,
  }) : super(key: chave);

  @override
  State<$ComTextoCampoCelular> createState() => _$ComTextoCampoCelularState();
}

class _$ComTextoCampoCelularState extends State<$ComTextoCampoCelular> {
  FocusNode foco = FocusNode();

  @override
  void initState() {
    if (widget.foco != null) foco = widget.foco!;
    widget.controlador.focoCelular = foco;
    widget.controlador.carregarLista(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tipoDispositivo = Sistemas.dispositivo.info.tipo;

    return Row(
      children: <Widget>[
        (widget.controlador.pais.id == "#")
            ? Container(width: 0)
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () => widget.controlador.abrirGavetaInferior(
                    context,
                    setState,
                  ),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 70,
                      padding: (tipoDispositivo == Dispositivo.tipoMobile)
                          ? const EdgeInsets.only(
                              top: 11,
                              bottom: 11,
                              left: 10,
                            )
                          : const EdgeInsets.only(
                              top: 7,
                              bottom: 7,
                              left: 10,
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: (widget.textoErro != null)
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Componentes.imagem.arredondada(
                            arredondarBorda: BorderRadius.circular(5),
                            imagem: widget.controlador.pais.icone,
                            cacheLargura: 96,
                            cacheAltura: 64,
                            largura: 32,
                            altura: 22,
                          ),
                          Componentes.icone.padrao(
                            iconePrimario: Icons.arrow_drop_down_rounded,
                            corIcone: (widget.textoErro != null)
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        Expanded(
          child: Componentes.texto.campoPadrao(
            habilitado: widget.habilitado,
            bloqueado: widget.bloqueado,
            botaoLimpar: widget.botaoLimpar,
            controlador: widget.controlador,
            foco: foco,
            autoFoco: widget.autoFoco,
            tipoTeclado: TextInputType.phone,
            acaoBotaoTeclado: widget.acaoBotaoTeclado,
            formatacao: (widget.controlador.pais.formato != "+")
                ? Estilos.texto.formatar(
                    formato: FormatosTexto(
                      valorFormato: widget.controlador.pais.formato,
                      caractereNumero: "_",
                    ),
                  )
                : null,
            textoTitulo:
                widget.textoTitulo ?? Idiomas.of(context).tituloCelular,
            textoPrefixo: (widget.controlador.pais.id == "#")
                ? widget.controlador.pais.ddi
                : null,
            textoAjuda: widget.textoAjuda,
            textoErro: widget.textoErro,
            textoDica: (widget.controlador.pais.formato != "+")
                ? widget.textoDica ?? widget.controlador.pais.formato
                : widget.textoDica,
            componentePrefixo: Componentes.icone.padrao(
              iconePrimario: widget.iconePrefixo ?? Icons.phone_android_rounded,
            ),
            componenteSufixo: (widget.controlador.pais.id == "#")
                ? Componentes.botao.icone(
                    corDinamica: true,
                    aoPrecionar: () => widget.controlador.abrirGavetaInferior(
                      context,
                      setState,
                    ),
                    alternarIcone: widget.controlador.gavetaInferior,
                    iconePrimario: Icons.keyboard_double_arrow_up_rounded,
                    iconeSecundario: Icons.keyboard_double_arrow_down_rounded,
                  )
                : null,
            menuTexto: widget.menuTexto,
          ),
        ),
      ],
    );
  }
}
