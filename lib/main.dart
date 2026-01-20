import 'package:financas_pessoais/pages/home_page.dart';
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
      home: Scaffold(body: HomePage()),
    );
  }
}
