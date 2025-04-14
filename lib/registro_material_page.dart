import 'package:flutter/material.dart';
import 'cash_modificador.dart'; // Importa a classe de estado global

//! PAGINA DE REGISTRO DE RECICLAGEM

class RegistroMaterialPage extends StatelessWidget {
  const RegistroMaterialPage({super.key});

  // Função para mostrar o popup com os campos de preenchimento
  void _showRegistroPopup(BuildContext context, String material) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController quantidadeController = TextEditingController();
        TextEditingController usuarioIdController = TextEditingController();

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text('Registrar $material'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: quantidadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantidade (kg)'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: usuarioIdController,
                decoration: const InputDecoration(labelText: 'ID do Usuário'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                int quantidade = int.tryParse(quantidadeController.text) ?? 0;

                // Incrementa o valor do "cash" com base na quantidade
                cashNotifier.addCash(quantidade);

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 255, 13),
              ),
              child: const Text('Registrar'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Texto no topo da tela
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              'Registrar Material Reciclado',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
          ),
          const SizedBox(height: 20), // Espaçamento abaixo do título
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                padding: const EdgeInsets.all(16.0),
                children: [
                  // Botão de plástico
                  _buildMaterialButton(
                      context, 'Plástico', Icons.local_drink, Colors.yellow),
                  // Botão de papel
                  _buildMaterialButton(
                      context, 'Papel', Icons.insert_drive_file, Colors.blue),
                  // Botão de vidro
                  _buildMaterialButton(
                      context, 'Vidro', Icons.wine_bar, Colors.green),
                  // Botão de metal
                  _buildMaterialButton(
                      context, 'Metal', Icons.construction, Colors.grey),
                  // Botão de eletrônicos
                  _buildMaterialButton(
                      context, 'Eletrônicos', Icons.devices, Colors.purple),
                  // Botão de outros materiais
                  _buildMaterialButton(
                      context, 'Outros', Icons.more_horiz, Colors.brown),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Função auxiliar para criar o botão de material com ícone
  Widget _buildMaterialButton(
      BuildContext context, String material, IconData icon, Color color) {
    return GestureDetector(
      onTap: () => _showRegistroPopup(context, material),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 36),
          ),
          const SizedBox(height: 8),
          Text(
            material,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
