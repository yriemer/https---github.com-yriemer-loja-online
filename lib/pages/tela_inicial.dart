import 'package:flutter/material.dart';
import 'package:projeto_loja/models/produto.dart';
import 'package:projeto_loja/pages/produto_info.dart';
import 'package:projeto_loja/repositories/produto_repository.dart';
import 'package:intl/intl.dart';

class TelaInicialPage extends StatefulWidget {
  const TelaInicialPage({super.key});

  @override
  State<TelaInicialPage> createState() => _TelaInicialPageState();
}

class _TelaInicialPageState extends State<TelaInicialPage> {
  List<Produto> selecionados = [];
  final tabela = ProdutoRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  appBarDinamica() {
    if (selecionados.isEmpty) {
      return AppBar(
        title: const Text('Itens Populares'),
      );
    } else {
      return AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                selecionados = [];
              });
            },
          ),
          title: Text('${selecionados.length} selecionados'),
          backgroundColor: Colors.grey[50],
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.black87),
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    }
  }

  mostrarDetalhes(Produto produto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProdutosInfoPage(produto: produto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int produto) {
          return ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            leading: (selecionados.contains(tabela[produto]))
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    child: Image.asset(tabela[produto].icone),
                    width: 40,
                  ),
            title: Text(tabela[produto].nome,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            trailing: Text(real.format(tabela[produto].preco)),
            selected: selecionados.contains(tabela[produto]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (selecionados.contains(tabela[produto]))
                    ? selecionados.remove(tabela[produto])
                    : selecionados.add(tabela[produto]);
              });
            },
            onTap: () => mostrarDetalhes(tabela[produto]),
          );
        },
        padding: const EdgeInsets.all(15),
        separatorBuilder: (_, ____) => const Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionados.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              label: const Text(
                'Adicionar ao Carrinho',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
