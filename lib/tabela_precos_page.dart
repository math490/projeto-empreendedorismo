import 'package:flutter/material.dart';

class TabelaPrecosPage extends StatefulWidget {
  const TabelaPrecosPage({Key? key}) : super(key: key);

  @override
  _TabelaPrecosPageState createState() => _TabelaPrecosPageState();
}

class _TabelaPrecosPageState extends State<TabelaPrecosPage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Mudar para as páginas correspondentes ao índice selecionado
    if (index == 0) {
      Navigator.pushReplacementNamed(
          context, '/paginaReciclagem'); // Ajuste a rota conforme necessário
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context,
          '/novaPaginaFuncionario'); // Ajuste a rota conforme necessário
    } else if (index == 2) {
      Navigator.pushReplacementNamed(
          context, '/registroMaterial'); // Ajuste a rota conforme necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Eco-Cash - Funcionário',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[800],
        toolbarHeight: 84.0,
        flexibleSpace: Image.asset(
          'assets/images/app_bar_icon.png',
          fit: BoxFit.cover,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tabela de Preços por Quilo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Tabela
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: const [
                TableRow(
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Material',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Valor ao Quilo',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Plástico',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '3\$',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Papel',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '1\$',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Nova Página',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Registrar Material',
          ),
        ],
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
