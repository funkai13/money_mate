import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/provider/transactions_provider.dart';

class SelectAccount extends ConsumerWidget {
  const SelectAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Cuenta')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cuenta 1'),
            onTap: () {
              ref.read(selectedAccountProvider.notifier).state = 'Cuenta 1';
              context.pop();
            },
          ),
          ListTile(
            title: const Text('Cuenta 2'),
            onTap: () {
              ref.read(selectedAccountProvider.notifier).state = 'Cuenta 2';
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
