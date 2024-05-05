import 'package:flutter/material.dart';
import 'home.dart';
import 'perfil.dart';
import 'saldo.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove completamente a AppBar
      body: Center(
        child: _getPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Saldo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white, // Define a cor do texto selecionado
        unselectedItemColor: Color(0xFFDCDCDC), // Define a cor do texto não selecionado
        backgroundColor: Colors.blue, // Define a cor de fundo da barra de navegação
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return SaldoPage();
      case 1:
        return HomePage(); // Não retorna nada para o índice 1
      case 2:
        return PerfilPage();
      default:
        return SaldoPage();
    }
  }
}
