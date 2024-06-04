import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/core/mobile_design_system/shared/widgets/navigation_bottom_bar.dart';
import 'package:money_mate/feature/Transactions/presenter/screen/widgets/transaction_info_row.dart';

class AccountBalanceScreen extends ConsumerStatefulWidget {
  final String title;
  final double balance;

  const AccountBalanceScreen({
    super.key,
    required this.title,
    required this.balance,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AccountBalanceScreenState();
}

class _AccountBalanceScreenState extends ConsumerState<AccountBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBottomBar(),
      body: SafeArea(
        child: Column(
          children: [
            TransactionInfoRow(
              title: widget.title,
              buttonText: 'Mi cuenta',
              icon: Icons.text_fields,
              containerColor: Colors.blueAccent,
              buttonIcon: Icons.navigate_next,
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
