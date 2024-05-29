import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/user_profile_register_controller.dart';

class ProfileRegisterScreen extends ConsumerStatefulWidget {
  const ProfileRegisterScreen({super.key});

  @override
  ConsumerState<ProfileRegisterScreen> createState() => _ProfileRegisterState();
}

class _ProfileRegisterState extends ConsumerState<ProfileRegisterScreen> {
  Future<void> _createUser() async {
    if (!formKey.currentState!.validate()) return;
    ref.read(userProfileRegisterControllerProvider.notifier).createUser(
        email: _firstNameController.text,
        lastName: _lastNameController.text,
        firstName: _firstNameController.text,
        age: double.parse(_ageController.text),
        context: context);
  }

  late final formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Registro',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const SizedBox(height: 28),
                    TextFormField(
                      controller: _firstNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Ingresa tu Nombre',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 28),
                    TextFormField(
                      controller: _lastNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Ingresa tu Apellido',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 28),
                    TextFormField(
                      controller: _ageController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Ingresa tu Edad',
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          autofocus: true,
                          onPressed: _createUser,
                          child: const Text('Guardar ')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
