import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados estáticos do ranking
    final ranking = [
      {
        "nome": "Macacalvo95",
        "cidade": "Ariquemes/RO",
        "nivel": 523,
        "foto": "assets/images/perfil1.png"
      },
      {
        "nome": "Marvis87",
        "cidade": "Ariquemes/RO",
        "nivel": 256,
        "foto": "assets/images/perfil2.png"
      },
      {
        "nome": "Claudesovaldo69",
        "cidade": "Ariquemes/RO",
        "nivel": 201,
        "foto": "assets/images/perfil3.png"
      },
      {
        "nome": "Vlademiro67",
        "cidade": "Ariquemes/RO",
        "nivel": 188,
        "foto": "assets/images/perfil4.png"
      },
      {
        "nome": "SofiaHamus",
        "cidade": "Ariquemes/RO",
        "nivel": 169,
        "foto": "assets/images/perfil5.png"
      },
      {
        "nome": "SodrifoHamus",
        "cidade": "Ariquemes/RO",
        "nivel": 153,
        "foto": "assets/images/perfil6.png"
      },
    ];

    // Dados estáticos para o usuário
    final userPosition = {
      "nome": "Macaco123",
      "cidade": "Ariquemes/RO",
      "nivel": 32,
      "posicao": 249,
      "foto": "https://i.imgur.com/l0yKzzk.jpeg"
    };

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ranking Geral",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Lista estática dos 6 primeiros colocados usando Map
          Column(
            children: ranking.map((player) {
              return Card(
                color: Colors.green[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.imgur.com/l0yKzzk.jpeg'), // Substitua pela URL real
                    radius: 40,
                  ),
                  title: Text('${player["nome"]}'), // Nome do jogador
                  subtitle: Text('${player["cidade"]}'), // Cidade e estado
                  trailing: Text(
                    "NV: ${player["nivel"]}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Botão "Ver Mais"
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão (ex.: carregar mais, navegar)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Carregar mais usuários!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Ver Mais",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Posição fixa do usuário
          Card(
            color: Colors.green[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('${userPosition["foto"]!}'), // URL da imagem
                radius: 40,
              ),
              title: Text('${userPosition["nome"]}'), // Nome do usuário
              subtitle: Text(
                  '${userPosition["cidade"]}'), // Cidade e estado do usuário
              trailing: Text(
                "Posição: ${userPosition["posicao"]}\nNV: ${userPosition["nivel"]}",
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
