import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Cadastro'),
      ),
      body: const Center(
        child: Text(
          'Esta é a página de cadastro!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
