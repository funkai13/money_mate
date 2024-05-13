import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/feature/auth/presenter/controller/sign_in_controller.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  static const String route = 'sign_in';

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  Future<void> _anonymousSign() async {
    ref.read(signInControllerProvider.notifier).signInAnonymous();
  }

  Future<void> _signIn() async {
    if (!formKey.currentState!.validate()) return;
    ref.read(signInControllerProvider.notifier).signIn(
        email: _emailController.text, password: _passwordController.text);
  }

  late final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
          child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Inicar Sesion',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(height: 28),
            TextFormField(
              controller: _emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu Correo',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 28),
            TextFormField(
              controller: _passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu Contraseña',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            ElevatedButton(
                onPressed: _signIn, child: const Text('Iniciar Sesion'))
          ],
        ),
      )),
    )));
  }
}
