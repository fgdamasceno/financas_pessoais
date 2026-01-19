import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador Financeiro',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        body: Center(
          child: Text('Bem-vindo ao seu app de finanças!'),
        ),
      ),
    );
  }
}
