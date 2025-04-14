import 'package:flutter/material.dart';
import 'package:projeto_eco/selec_tipo_usuario.dart';
import 'package:projeto_eco/cash_modificador.dart'; // Importe o CashNotifier

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco-Cash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 54, 102, 0)),
        useMaterial3: true,
      ),
      // Envolve a página inicial com o ValueListenableBuilder para gerenciar o cash
      home: ValueListenableBuilder<int>(
        valueListenable: cashNotifier, // Observa o estado global do cash
        builder: (context, cash, child) {
          return const SelecaoPage(); // Página inicial permanece inalterada
        },
      ),
    );
  }
}
