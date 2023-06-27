



import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextFormField(),
                const TextField(),
              ],
            ),
          ),
        ),
      ),
    )
  );
}







/*

import 'package:noronhaecotech/configuracoes/configuracao.dart';
import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

void main() {
  usePathUrlStrategy();
  runApp(Paginas.carregamento);
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    //////////////////////////////////////////////////////////////////////////// Carregar Dependencias
    Idiomas.load(Idiomas.delegate.supportedLocales.first),
    Sistemas.firebase.inicializar,
    ////////////////////////////////////////////////////////////////////////////
    Future.delayed(const Duration(seconds: 2)),
  ]).whenComplete(() {
    //////////////////////////////////////////////////////////////////////////// Configuração
    final config = Configuracao(
      tituloApp: "Noronha EcoTech",
      temaClaro: Estilos.tema.claro,
      temaEscuro: Estilos.tema.escuro,
      chaveNavegador: GlobalKey<NavigatorState>(),
      rotas: Paginas.rotas,
      idiomasSuportados: Idiomas.delegate.supportedLocales,
      idiomasDelegar: const [
        Idiomas.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
    ////////////////////////////////////////////////////////////////////////////
    runApp(config.materialApp);
  });
}



 */