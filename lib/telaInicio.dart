import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'main.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(), // Definindo SplashScreen como a tela inicial
  ));
}


class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Cor de fundo azul
      child: Scaffold(
        backgroundColor: Colors.transparent, // Deixa o background do Scaffold transparente
        body: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(20),
                minScale: 0.1,
                maxScale: 5,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 150, // Define a posição vertical da animação de carregamento
              left: 0, // Define a posição horizontal da animação de carregamento
              right: 0,
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen(context);
  }

  void _navigateToNextScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 7)); // Aguarda 3 segundos
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyFormPage()),
    ); // Navega para a próxima tela e substitui a tela atual
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Caminho da imagem da tela de splash
              width: 400, // Largura da imagem
              height: 400, // Altura da imagem
            ),
            SizedBox(height: 20),
            LoadingAnimationWidget.inkDrop(
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
