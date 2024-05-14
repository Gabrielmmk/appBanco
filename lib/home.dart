import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nome = 'João Pedro';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Início',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue, // Cor de fundo da AppBar
        automaticallyImplyLeading: false, // Remove a seta de voltar
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade800],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                nome,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconCard(
                    icon: Icons.description,
                    label: 'Extratos',
                  ),
                  IconCard(
                    icon: Icons.swap_horiz,
                    label: 'Transferências',
                  ),
                  IconCard(
                    icon: Icons.phone_android,
                    label: 'Recargas',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconCard(
                    icon: Icons.payment,
                    label: 'Pagamentos',
                  ),
                  IconCard(
                    icon: Icons.monetization_on,
                    label: 'Empréstimos',
                  ),
                  IconCard(
                    icon: Icons.trending_up,
                    label: 'Investimentos',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconCard({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(
            icon,
            size: 30,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
