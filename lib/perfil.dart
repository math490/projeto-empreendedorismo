// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:projeto_eco/loja_page.dart';
import 'home_page.dart'; // Importa a HomePage para navegação
import 'selec_tipo_usuario.dart';
import 'cash_modificador.dart'; // Importe o CashNotifier

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  int nivel = 0;
  int currentIndex = 3; // Define o índice inicial como 3, para o PerfilPage

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const SelecaoPage()), // Redireciona para a tela de seleção
    );
  }

  // Histórico de atividades e valores de cash obtido para cada atividade
  final Map<String, List<Map<String, dynamic>>> historico = {
    'Hoje': [
      {'atividade': 'Reciclou 5 garrafas', 'cashObtido': 10},
      {'atividade': 'Contribuiu com 2 latas', 'cashObtido': 5}
    ],
    'Ontem': [
      {'atividade': 'Reciclou 3 plásticos', 'cashObtido': 8},
      {'atividade': 'Contribuiu com 4 papéis', 'cashObtido': 4}
    ],
    '25/10/2024': [
      {'atividade': 'Reciclou 1 garrafa', 'cashObtido': 2},
      {'atividade': 'Contribuiu com 3 papéis', 'cashObtido': 3}
    ],
  };

  @override
  void initState() {
    super.initState();
    _calculaCashTotal();
  }

  void _calculaCashTotal() {
    num total = 0;
    historico.forEach((_, atividades) {
      for (var atividade in atividades) {
        total += atividade['cashObtido'];
      }
    });
    // Atualiza o valor de cash utilizando o CashNotifier
    cashNotifier.value = total.toInt();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[800],
        toolbarHeight: 84.0,
        automaticallyImplyLeading: false,
        flexibleSpace: Image.asset(
          'assets/images/app_bar_icon.png',
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout, // Chama a função de logout
          ),
        ],
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: cashNotifier, // Observa o estado global do cash
        builder: (context, cash, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfoSection(cash), // Passa o valor de cash
              Divider(
                thickness: 1.5,
                color: Colors.grey[400],
                indent: 16.0,
                endIndent: 16.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: historico.keys.length,
                  itemBuilder: (context, index) {
                    String dia = historico.keys.elementAt(index);
                    List<Map<String, dynamic>> atividades = historico[dia]!;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dia,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                          ...atividades.map((atividade) => Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  '- ${atividade['atividade']} (Cash Obtido: ${atividade['cashObtido']})',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              )),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Loja',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
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
            label: 'Configurações',
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
                  Text("Cash: $cash", style: const TextStyle(fontSize: 16)), // Exibe o cash
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
}
