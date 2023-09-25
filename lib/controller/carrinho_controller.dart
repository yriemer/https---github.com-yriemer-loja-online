import 'package:flutter/material.dart';
import 'package:projeto_loja/models/produto.dart';

class CarrinhoController extends ChangeNotifier {
  List<Produto> carrinho = [];

  void adicionarAoCarrinho(Produto produto) {
    carrinho.add(produto);
    notifyListeners();
  }

  void removerDoCarrinho(Produto produto) {
    carrinho.remove(produto);
    notifyListeners();
  }
}
