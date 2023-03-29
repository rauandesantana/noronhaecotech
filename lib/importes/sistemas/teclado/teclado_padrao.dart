import 'package:flutter/cupertino.dart';

class $SisTeclado {
  const $SisTeclado();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Teclado Estado
  bool estado(BuildContext context) {
    return (MediaQuery.of(context).viewInsets.bottom != 0);
  }
}
