import 'package:flutter/material.dart';

//! PAGINA EM RECICLAGEM AINDA EM DESENVOLVIMENTO

class PaginaReciclagem extends StatelessWidget {
  const PaginaReciclagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 16, horizontal: 8), // Espaçamento nas laterais e no topo
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Quadrados ocupam a largura total
          children: [
            _buildQuadrado(
              titulo: 'Os preços estão aumentando!!!',
              texto: 'O preço do plastico aumentou em 0,10 centavos.',
            ),
            _buildQuadrado(
              titulo: 'Metas alcançadas.',
              texto:
                  'A empresa Recicla Bem foi a 2ª colocada, das que mais reciclaram plastico.',
            ),
            _buildQuadrado(
              titulo: 'Aviso!!!',
              texto: 'A balança de numero 3 está danificada!!',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuadrado({required String titulo, required String texto}) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: 16), // Espaço inferior entre os quadrados
      padding: const EdgeInsets.all(8), // Espaçamento interno de 8px
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3), // Verde translúcido
        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 25, 75, 26), // Texto em verde escuro
            ),
          ),
          const SizedBox(height: 8), // Espaço entre título e texto
          Text(
            texto,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 12, 95, 15), // Texto em verde escuro
            ),
          ),
        ],
      ),
    );
  }
}
