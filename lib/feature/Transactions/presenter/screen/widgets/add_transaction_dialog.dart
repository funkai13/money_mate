import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/feature/Transactions/presenter/screen/widgets/transaction_info_row.dart';

import '../../../domain/provider/transactions_provider.dart';

class AddTransactionDialog extends ConsumerWidget {
  const AddTransactionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAccount = ref.watch(selectedAccountProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Text(
                    "Agregar Transacción",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Plantillas',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => context.push('/select-account'),
                child: TransactionInfoRow(
                  title: 'Cuenta',
                  buttonText: selectedAccount ?? 'Seleccionar cuenta',
                  icon: Icons.account_balance_wallet,
                  containerColor: Colors.green,
                  buttonIcon: Icons.navigate_next,
                  iconColor: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () => context.push('/select-category'),
                child: TransactionInfoRow(
                  title: 'Categoría',
                  buttonText: selectedCategory ?? 'Seleccionar categoría',
                  icon: Icons.category,
                  containerColor: Colors.blue,
                  buttonIcon: Icons.navigate_next,
                  iconColor: Colors.white,
                ),
              ),
              // Más campos...
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el modal
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
