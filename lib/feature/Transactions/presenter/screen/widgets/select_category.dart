import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/provider/transactions_provider.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Categoría')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Categoría 1'),
            onTap: () {
              ref.read(selectedCategoryProvider.notifier).state = 'Categoría 1';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Categoría 2'),
            onTap: () {
              ref.read(selectedCategoryProvider.notifier).state = 'Categoría 2';
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
