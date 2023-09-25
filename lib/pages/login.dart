import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginFormField(controller: loginController),
            // Adicione um botão para fazer login aqui
          ],
        ),
      ),
    );
  }
}
