import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validação TextFormField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  key: emailKey,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'E-mail Obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Senha'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Senha Obrigatório';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.validate();
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    emailKey.currentState?.validate();
                  },
                  child: const Text('Esqueceu sua senha?'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
