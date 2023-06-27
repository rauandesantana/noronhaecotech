// ----------------------------------------------------------------------------- Código Ação
class CodigoAcao {
  late bool valido;
  final String acaoURL;
  final String modo;
  final String codigo;
  final String chaveAPI;
  final String idioma;

  CodigoAcao({
    required this.acaoURL,
    required this.modo,
    required this.codigo,
    required this.chaveAPI,
    required this.idioma,
  }) {
    valido = (acaoURL.isNotEmpty &&
            modo.isNotEmpty &&
            codigo.isNotEmpty &&
            chaveAPI.isNotEmpty &&
            idioma.isNotEmpty)
        ? true
        : false;
  }
  //////////////////////////////////////////////////////////////////////////////

  static String modoRecuperarSenha = "resetPassword";
}
