import 'package:flutter/material.dart';
import 'package:projeto_loja/models/produto.dart';
import 'package:intl/intl.dart';

class CarrinhoPage extends StatefulWidget {
  final List<Produto> carrinho;

  CarrinhoPage({required this.carrinho});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: widget.carrinho.isEmpty
          ? Center(
              child: Text(
                'Carrinho vazio',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.carrinho.length,
              itemBuilder: (context, index) {
                final produto = widget.carrinho[index];
                return ListTile(
                  leading: Image.asset(produto.icone), // Ícone do produto
                  title: Text(produto.nome), // Nome do produto
                  trailing: Text(
                    // Preço do produto
                    NumberFormat.currency(locale: 'pt_BR', name: 'R\$')
                        .format(produto.preco),
                  ),
                  // Você também pode adicionar mais informações sobre o produto aqui.
                );
              },
            ),
    );
  }
}
