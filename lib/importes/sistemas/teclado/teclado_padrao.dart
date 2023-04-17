import 'package:flutter/cupertino.dart';

class $SisTecladoPadrao {
  const $SisTecladoPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Teclado Estado
  bool estado(BuildContext context) {
    return (MediaQuery.of(context).viewInsets.bottom != 0);
  }
}
