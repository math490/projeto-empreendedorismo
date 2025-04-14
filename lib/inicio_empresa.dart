import 'package:flutter/material.dart';
import 'tabela_precos_page.dart'; // Importando a página de tabela de preços

class NovaPaginaFuncionario extends StatelessWidget {
  const NovaPaginaFuncionario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto da Empresa em Círculo e Nome da Empresa
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/logo_empresa.png'), // Substitua pelo nome do arquivo da logo     //! AQUI AAAAAAAAAAAAAAAAA
                ),
                SizedBox(width: 10),
                Text(
                  'Recicle Bem',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/funcimag.png'), //! AQUI AAAAAAAAAAAAAAAAA
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Lucia Santos Laddaga',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Botão para a Tabela de Preços
            ElevatedButton(
              onPressed: () {
                // Navegação para a página de Tabela de Preços
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabelaPrecosPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  'Tabela de Preços',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Espaço para conteúdo adicional abaixo do botão
            const Text(
              'Outros conteúdos podem ser exibidos aqui.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
