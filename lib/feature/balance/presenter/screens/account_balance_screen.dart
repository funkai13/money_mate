import 'package:flutter/material.dart';
import 'package:money_mate/feature/Transactions/presenter/screen/widgets/transaction_info_row.dart';
import 'package:money_mate/feature/balance/presenter/screens/widgets/create_account_balance_dialog.dart';
import 'package:money_mate/feature/home/presenter/screen/widgets/chart_card.dart';

import '../../../../core/mobile_design_system/shared/widgets/keyboard_responsive_bottomsheet.dart';
import '../../../Transactions/presenter/screen/widgets/add_transaction_dialog.dart';

class AccountBalanceScreen extends StatelessWidget {
  final String title;
  final double balance;

  const AccountBalanceScreen({
    super.key,
    required this.title,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text(title),
        actions: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                enableDrag: false,
                backgroundColor: Colors.white,
                elevation: 0.0,
                context: context,
                isScrollControlled: true,
                builder: (context) => KeyboardResponsiveBottomSheet(
                  initialChildSize: 0.60,
                  child: CreateAccountBalanceDialog(
                    isEditing: true,
                    title: title,
                    balance: balance,
                  ),
                ),
              );
            },
            child: const Text(
              'Editar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => DraggableScrollableSheet(
                  expand: false,
                  builder: (context, scrollController) => SingleChildScrollView(
                    controller: scrollController,
                    child: const AddTransactionDialog(),
                  ),
                ),
              );
            },
            backgroundColor: Colors.green,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              'Agregar Registro',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  color: Colors.lightBlue,
                  padding: const EdgeInsets.all(12),
                  child: const ChartCard()),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      15.0), // Radio de esquinas redondeadas
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Sombra
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0,
                          1), // Cambiar el offset si deseas ajustar la sombra
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TransactionInfoRow(
                      title: title,
                      buttonText: title,
                      icon: Icons.abc_outlined,
                      containerColor: Colors.green,
                      buttonIcon: Icons.navigate_next,
                      iconColor: Colors.pink,
                    ),
                    // Agrega aquí las demás filas de información
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
