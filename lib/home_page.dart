// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:projeto_eco/loja_page.dart';
import 'package:projeto_eco/ranking.dart';
import 'perfil.dart'; // Importa PerfilPage para navegação
import 'package:projeto_eco/selec_tipo_usuario.dart';
import 'cash_modificador.dart'; // Importe o CashNotifier para o gerenciamento global

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 2;

  void _navigateToPage(int index) {
    if (index == currentIndex) return; // Evita a navegação se o índice for o mesmo

    Widget targetPage;

    switch (index) {
      case 0:
        targetPage = const LojaPage(); // Página da loja
        break;
      // case 1:
      //   targetPage = RecompensasPage(); // Página de recompensas
      //   break;
      case 2:
        targetPage = const HomePage(); // Página inicial
        break;
      case 3:
        targetPage = const PerfilPage(); // Página de perfil
        break;
      // case 4:
      //   targetPage = ConfiguracoesPage(); // Página de configurações
      //   break;
      default:
        return;
    }

    // Atualiza o índice atual e executa a navegação com animação
    setState(() {
      currentIndex = index;
    });

    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => targetPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset beginOffset = index < currentIndex
            ? const Offset(-1.0, 0.0)
            : const Offset(1.0, 0.0);
        Offset endOffset = Offset.zero;
        var slideTransition = Tween(begin: beginOffset, end: endOffset).animate(animation);

        return SlideTransition(
          position: slideTransition,
          child: child,
        );
      },
    ));
  }

  // Função de logout
  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const SelecaoPage()), // Navega para a página de seleção
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        toolbarHeight: 84.0,
        title: const Text(
          'Eco-Cash',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout, // Chama a função de logout
          ),
        ],
        flexibleSpace: Image.asset(
          'assets/images/app_bar_icon.png',
          fit: BoxFit.cover,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: cashNotifier, // Observa o estado global do cash
              builder: (context, cash, child) {
                return _buildUserInfoSection(cash); // Atualiza o cash dinamicamente
              },
            ),
            _buildNewsSection(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Loja',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Recompensas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_sharp),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Mais',
          ),
        ],
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _navigateToPage(index); // Chama a função de navegação personalizada
        },
      ),
    );
  }

  Widget _buildUserInfoSection(int cash) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.imgur.com/l0yKzzk.jpeg'), // Substitua pela URL real
            radius: 40,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Nível: 30", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Text("Cash: $cash", style: const TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  const Text("XP: "),
                  const SizedBox(width: 4),
                  SizedBox(
                    width: 100, // Definindo uma largura fixa para o progresso
                    child: LinearProgressIndicator(
                      value: 0.48,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation(Colors.green),
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
              const Text("Macaco123", style: TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Ranking()],
      ),
    );
  }
}
