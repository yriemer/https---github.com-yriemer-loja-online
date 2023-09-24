import '../models/produto.dart';

class ProdutoRepository {
  static List<Produto> tabela = [
    Produto(icone: 'images/loja-online.png', nome: 'Loja Online', preco: 50.00),
    Produto(
        icone: 'images/adicionar-ao-carrinho.png',
        nome: 'Add carrinho',
        preco: 40),
  ];
}
