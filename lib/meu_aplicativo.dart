import 'package:flutter/material.dart';
import 'package:projeto_loja/pages/tela_inicial.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //build desenha na tela
    return MaterialApp(
      title: 'Loja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: TelaInicialPage(),
    );
  }
}
