import 'package:flutter/material.dart';
import 'package:projeto_loja/pages/tela_inicial.dart';
import 'package:projeto_loja/pages/usuario.dart';
import 'package:projeto_loja/pages/carrinho.dart';
import '../models/produto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Produto> carrinho = [];
  int pagAtual = 0;
  late PageController paginaController;

  @override
  void initState() {
    super.initState();
    paginaController = PageController(initialPage: pagAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      pagAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: paginaController,
        children: [
          TelaInicialPage(),
          CarrinhoPage(carrinho: carrinho),
          UsuarioPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pagAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Meu Carrinho'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Meu Perfil'),
        ],
        onTap: (pagina) {
          paginaController.animateToPage(pagina,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}
