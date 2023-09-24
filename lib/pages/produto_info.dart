import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/produto.dart';
import 'package:intl/intl.dart';

class ProdutosInfoPage extends StatefulWidget {
  Produto produto;

  ProdutosInfoPage({Key? key, required this.produto}) : super(key: key);

  @override
  _ProdutosInfoPageState createState() => _ProdutosInfoPageState();
}

class _ProdutosInfoPageState extends State<ProdutosInfoPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(widget.produto.icone),
                    width: 50,
                  ),
                  Container(width: 10),
                  Text(
                    real.format(widget.produto.preco),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  suffix: Text(
                    'reais',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
