import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';

// ----------------------------------------------------------------------------- Sistemas Navegador Padrão
class $SisNavegadorPadrao {
  const $SisNavegadorPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Navegador Padrão
  void padrao({
    required BuildContext context,
    required Pagina pagina,
    bool? fecharAnterior,
  }) {
    switch (fecharAnterior) {
      case true:
        Navigator.popAndPushNamed(context, pagina.caminho);
        break;
      default:
        Navigator.pushNamed(context, pagina.caminho);
        break;
    }
  }

  // =========================================================================== Navegador Voltar
  void voltar(BuildContext context) {
    switch (Navigator.of(context).canPop()) {
      case true:
        Navigator.pop(context);
        break;
      default:
        SystemNavigator.pop(animated: true);
        break;
    }
  }

  // =========================================================================== Navegador Abrir Dialogo
  Future<dynamic> abrirDialogo({
    required BuildContext context,
    required Widget dialogo,
    bool? persistente,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: !(persistente ?? false),
      builder: (context) {
        return dialogo;
      },
    );
  }

  // =========================================================================== Navegador Abrir Carregamento
  Future<dynamic> abrirCarregamento({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Componentes.dialogo.padrao(
              titulo: Idiomas.of(context).tituloCarregando,
              conteudo: (context, atualizar) {
                return Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Componentes.carregamento.circular(),
                );
              }),
        );
      },
    );
  }

  // =========================================================================== Abrir Gaveta Inferior
  Future<dynamic>? abrirGavetaInferior({
    required BuildContext context,
    VoidCallback? estadoInicial,
    void Function(StateSetter)? estadoMontado,
    void Function(StateSetter)? estadoDesmontado,
    VoidCallback? estadoDescarte,
    void Function(bool)? estadoGaveta,
    required StatefulWidgetBuilder conteudo,
    double? larguraMax,
    bool? persistente,
  }) {
    final tamanhoTela = MediaQuery.of(context).size;
    primaryFocus?.unfocus(disposition: UnfocusDisposition.scope);
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: !(persistente ?? false),
      constraints: BoxConstraints(
        maxWidth: larguraMax ?? tamanhoTela.width,
        maxHeight: tamanhoTela.height * 0.489,
      ),
      builder: (context) => Componentes.gaveta.inferior(
        estadoInicial: estadoInicial,
        estadoMontado: estadoMontado,
        estadoDesmontado: estadoDesmontado,
        estadoDescarte: estadoDescarte,
        estadoGaveta: estadoGaveta,
        conteudo: conteudo,
      ),
    );
  }
}
