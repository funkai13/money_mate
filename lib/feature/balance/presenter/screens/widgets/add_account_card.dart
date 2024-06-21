import 'package:flutter/material.dart';
import 'package:money_mate/feature/balance/presenter/screens/widgets/create_account_balance_dialog.dart';

import '../../../../../core/mobile_design_system/shared/widgets/keyboard_responsive_bottomsheet.dart'; // Asegúrate de importar correctamente

class AddAccountCard extends StatelessWidget {
  const AddAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          enableDrag: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          context: context,
          isScrollControlled: true,
          builder: (context) => const KeyboardResponsiveBottomSheet(
            child: CreateAccountBalanceDialog(
              isEditing: false,
              title: '',
              balance: null,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          color: Colors.white.withOpacity(0.2),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.add, size: 40, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Agregar Cuenta')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
