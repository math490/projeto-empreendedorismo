import 'package:flutter/material.dart';
import 'package:projeto_eco/home_page.dart';
import 'perfil.dart'; // Importa PerfilPage para navegação
import 'package:projeto_eco/selec_tipo_usuario.dart';

class LojaPage extends StatefulWidget {
  const LojaPage({super.key});

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends State<LojaPage> {
  int total = 0;
  int currentIndex = 0;

  // Função para adicionar ao carrinho
  void _adicionarAoCarrinho(double preco) {
    setState(() {
      total += preco.toInt();
    });
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

  // Função para definir a animação de transição entre as páginas
  void _navigateToPage(int index) {
    if (index == currentIndex) {
      return; // Evita a navegação se o índice for o mesmo
    }

    Widget targetPage;

    switch (index) {
      case 0:
        targetPage = const LojaPage(); // Página da loja
        break;
      case 2:
        targetPage = const HomePage(); // Página inicial
        break;
      case 3:
        targetPage = const PerfilPage(); // Página de perfil
        break;
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
        var slideTransition =
            Tween(begin: beginOffset, end: endOffset).animate(animation);

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
          'Loja',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[800],
        toolbarHeight: 84.0,
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
            _buildItemCard(
              imageUrl: 'https://i.imgur.com/coca.png',
              descricao: '60% 500ML Coca Cola',
              loja: 'Mercado Irmãos Gonçalves',
              preco: 150.0,
              desconto: 0.6,
              onAdicionarAoCarrinho: _adicionarAoCarrinho,
            ),
            _buildItemCard(
              imageUrl: 'https://i.imgur.com/havaianas.png',
              descricao: '50% Chinelo Havaianas',
              loja: 'Mercado Irmãos Gonçalves',
              preco: 150.0,
              desconto: 0.5,
              onAdicionarAoCarrinho: _adicionarAoCarrinho,
            ),
            _buildItemCard(
              imageUrl: 'https://i.imgur.com/camisa.png',
              descricao: '70% Camisa',
              loja: '3 Irmãos',
              preco: 160.0,
              desconto: 0.7,
              onAdicionarAoCarrinho: _adicionarAoCarrinho,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
}

Widget _buildItemCard({
  required String imageUrl,
  required String descricao,
  required String loja,
  required double preco,
  required double desconto,
  required void Function(double) onAdicionarAoCarrinho,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  descricao,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  loja,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'R\$ ${preco.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () =>
                          onAdicionarAoCarrinho(preco * (1 - desconto)),
                      child: const Text("Colocar nos pedidos"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
