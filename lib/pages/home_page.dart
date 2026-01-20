import 'package:flutter/material.dart';
import '../models/transacao_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Variáveis simples para simular dados
    const String usuario = 'Desenvolvedor';
    const double saldo = 1250.50;
    const double despesas = 450.00;

    final List<Transacao> transacoes = [
      Transacao(
        id: '1',
        titulo: 'Salário',
        valor: 2500.0,
        data: DateTime.now(),
        tipo: TipoTransacao.receita,
      ),
      Transacao(
        id: '2',
        titulo: 'Aluguel',
        valor: 1000.0,
        data: DateTime.now(),
        tipo: TipoTransacao.despesa,
      ),
      Transacao(
        id: '3',
        titulo: 'Supermercado',
        valor: 350.0,
        data: DateTime.now(),
        tipo: TipoTransacao.despesa,
      ),
      Transacao(
        id: '4',
        titulo: 'Combustível',
        valor: 45.68,
        data: DateTime.now(),
        tipo: TipoTransacao.despesa,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Dinheiro'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Cartão de saldo
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.teal.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Olá, $usuario', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet),
                    SizedBox(width: 8),
                    Text(
                      'Saldo Atual: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  'R\$ ${saldo.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
          // Cartão de transações
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Últimas transações:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '- R\$ ${despesas.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.all(16.0),
            child: Text(
              'Histórico',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // ListView deve estar dentro de um Expanded para não dar erro de tamanho infinito
          Expanded(
            child: ListView.builder(
              itemCount: transacoes.length,
              itemBuilder: (context, index) {
                final tr = transacoes[index];
                return ListTile(
                  onTap: () {
                    print(tr.titulo);
                  },
                  leading: CircleAvatar(
                    backgroundColor: tr.tipo == TipoTransacao.receita
                        ? Colors.green
                        : Colors.red,
                    child: Icon(
                      tr.tipo == TipoTransacao.receita
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(tr.titulo),
                  subtitle: Text(
                    '${tr.data.day}/${tr.data.month}/${tr.data.year}',
                  ),
                  trailing: Text(
                    'R\$ ${tr.valor.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: tr.tipo == TipoTransacao.receita
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
