import 'package:flutter/cupertino.dart';

class Usuario {
  final String nome;
  final String email;
  final String cpf;
  final String senha;

  const Usuario({
    required this.nome,
    required this.email,
    required this.cpf,
    required this.senha,
  });
}
