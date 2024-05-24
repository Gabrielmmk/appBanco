import 'package:flutter/material.dart';

class SaldoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saldo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  size: 40,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text(
                  'Seu saldo atual:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$100.00', // Saldo fictício
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Nada adicionado
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Cor de fundo do botão
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Cor do texto
            ),
            child: Text(
              'Atualizar Saldo',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Transações Recentes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Transação ${index + 1}'),
                  subtitle: Text('Valor: \$10.00'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Implementar a ação ao clicar em uma transação
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
