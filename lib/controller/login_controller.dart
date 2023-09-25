import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  final TextEditingController controller;

  const LoginFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Email ou Senha',
        hintText: 'Digite seu email ou senha',
        prefixIcon: Icon(Icons.account_circle),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira seu email ou senha.';
        }
        // Você pode adicionar validações personalizadas aqui, se necessário.
        return null;
      },
    );
  }
}
