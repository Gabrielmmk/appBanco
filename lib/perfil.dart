import 'package:flutter/material.dart';
import 'package:appbancoteste/dados_usuario.dart';

import 'main.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DadosUsuario? dadosUsuario = DadosUsuario.of(context);

    if (dadosUsuario != null && dadosUsuario.usuarios.isNotEmpty) {
      String nome = dadosUsuario.usuarios.first.nome;
      String email = dadosUsuario.usuarios.first.email;
      String cpf = dadosUsuario.usuarios.first.cpf;

      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Perfil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 5),
              Text(
                nome,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'E-mail:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 5),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'CPF:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 5),
              Text(
                cpf,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyFormPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Sair da conta',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyFormPage()),
      );
      return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
        ),
        body: Center(
          child: Text(
            'Nenhum usuário logado!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }
  }
}
