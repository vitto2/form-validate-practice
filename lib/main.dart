import 'package:flutter/material.dart';

void main() {
  runApp(const MyForm());
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>();

  String email = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  onChanged: (value) => email = value,
                  validator: validateEmail,
                  decoration: const InputDecoration(
                    hintText: "insert your E-mail",
                    label: Text("E-mail"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) => setState(() {
                    password = value;
                  }),
                  validator: validatePassword,
                  decoration: const InputDecoration(
                    hintText: "insert your password",
                    label: Text("Password"),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: email.isEmpty || password.isEmpty ? null : submit,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      debugPrint("Form submited!");
    }
  }

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return "O campo e-mail é obrigatório!";
    }
    if (value.contains("@") == false) {
      return "Insira um e-mail válido!";
    }
    return null;
  }

  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return "O campo senha é obrigatorio";
    } else {
      if (value.length < 5) {
        return "Sua senha precisa ter mais que 5 caracteres!";
      }
    }
    return null;
  }
}
