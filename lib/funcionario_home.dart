// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'avisosPage.dart'; // Página de reciclagem
import 'registro_material_page.dart'; // Página de registro de material reciclado
import 'package:projeto_eco/selec_tipo_usuario.dart';

import 'inicio_empresa.dart'; // Nova página adicionada

//! PAGINA PRINCIPAL DO FUNCIONARIO
class FuncionarioHome extends StatefulWidget {
  const FuncionarioHome({super.key});

  @override
  _FuncionarioHomeState createState() => _FuncionarioHomeState();
}

class _FuncionarioHomeState extends State<FuncionarioHome> {
  int _currentIndex = 0;

  // Lista de páginas com a nova página incluída no índice 1
  final List<Widget> _pages = [
    const PaginaReciclagem(), // Página de reciclagem
    const NovaPaginaFuncionario(), // Nova página do funcionário
    const RegistroMaterialPage(), // Página de registro de material reciclado
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
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
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout, // Chama a função de logout
          ),
        ],
      ),
      body: _pages[
          _currentIndex], // Exibe a página selecionada pelo BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped, // Alterna entre as páginas ao tocar no item
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Ícone da nova página no meio
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
