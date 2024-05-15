import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/feature/auth/presenter/controller/sign_in_controller.dart';
import 'package:money_mate/routes.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  Future<void> _anonymousSign() async {
    ref.read(signInControllerProvider.notifier).signInAnonymous(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoneyMate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(Routes.login);
              },
              child: const Text('Iniciar sesión'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.signUp);
              },
              child: const Text('Registrarse'),
            ),
            const SizedBox(height: 20),
            // Botón de sesión anónima
            ElevatedButton(
              onPressed: _anonymousSign,
              child: const Text('Sesión anónima'),
            ),
          ],
        ),
      ),
    );
  }
}
