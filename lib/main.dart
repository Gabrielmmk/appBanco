import 'package:appbancoteste/telaInicio.dart';
import 'package:appbancoteste/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:appbancoteste/dados_usuario.dart';
import 'cadastro.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'telaprincipal.dart'; // Importe o arquivo da tela principal aqui
import 'package:collection/collection.dart';

void main() {
  runApp(
    DadosUsuario(
        child: MaterialApp(
      home: SplashScreen(),
    )),
    // Definindo SplashScreen como a tela inicial
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DadosUsuario(
      // Envolver toda a parte do aplicativo com DadosUsuario
      child: MaterialApp(
        title: 'Paradox Bank',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyFormPage(),
        routes: {
          //lista de usuario
        },
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paradox Bank',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                inputFormatters: [cpfFormatter],
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'CPF',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu CPF';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: _obscureText == false ? true : false,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  suffixIcon: GestureDetector(
                    child: Icon(_obscureText == false
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua Senha';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DadosUsuario? dadosUsuario = DadosUsuario.of(context);
                      if (dadosUsuario != null) {
                        // Validando se o usuário existe com base no CPF e na senha
                        Usuario? user = dadosUsuario.usuarios.firstWhereOrNull(
                            (user) =>
                                user.cpf == _nameController.text &&
                                user.senha == _emailController.text);
                        if (user != null) {
                          // Usuário autenticado com sucesso
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Login bem-sucedido!'),
                            ),
                          );
                          // Navegue para a tela principal
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TelaPrincipal()),
                          );
                        } else {
                          // Credenciais inválidas
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                  'Credenciais inválidas. Por favor, tente novamente.'),
                            ),
                          );
                        }
                      }
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)))),
                  child: Text('Entrar'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navegar para a página de cadastro
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroPage(
                              label: 'Nome', // Label para o campo Nome
                              isPassword: false, // Não é uma senha
                              controller: TextEditingController(),
                            )),
                  );
                },
                child: const Text(
                  'Não tem cadastro? Clique aqui para se cadastrar!',
                  style: TextStyle(
                    color: Colors.blue, // Cor do texto clicável
                    decoration: TextDecoration
                        .underline, // Adiciona sublinhado ao texto
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
