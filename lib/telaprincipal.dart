import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Saldo', style: TextStyle(fontWeight: FontWeight.bold)),
    Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
    Text('Perfil', style: TextStyle(fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meu banco'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Saldo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white, // Define a cor do texto selecionado
          unselectedItemColor: Color(0xFFdcdcdc), // Define a cor do texto não selecionado
          backgroundColor: Colors.blue, // Define a cor de fundo da barra de navegação
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
