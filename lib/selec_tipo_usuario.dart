import 'package:flutter/material.dart';
import 'home_page.dart';
import 'funcionario_home.dart';

//!PAGINA DE SELÇÃO DO FUNCIONARIO OU USUARIO

class SelecaoPage extends StatelessWidget {
  const SelecaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Eco-Cash',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[800],
        toolbarHeight: 84.0,
        flexibleSpace: Image.asset(
          'assets/images/app_bar_icon.png',
          fit: BoxFit.cover,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HomePage()), // Vai para a home do usuário
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 90, 216, 96),
              ),
              child: const Text('Usuário'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const FuncionarioHome()), // Vai para a nova home do funcionário
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 79, 218, 86),
              ),
              child: const Text('Funcionário'),
            ),
          ],
        ),
      ),
    );
  }
}
