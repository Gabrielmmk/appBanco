import 'package:appbancoteste/usuario.dart';
import 'package:flutter/cupertino.dart';

class DadosUsuario extends InheritedWidget {
  final Widget child;
  List<Usuario> usuarios = [];

  DadosUsuario({
    required this.child,
  }) : super(child: child);

  static DadosUsuario? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DadosUsuario>();
  }

  bool updateShouldNotify(DadosUsuario widget) {
    return true;
  }
}
