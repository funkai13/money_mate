import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/feature/Transactions/domain/entity/income.dart';

import '../../controller/income_controller.dart';

class IncomeScreen extends ConsumerStatefulWidget {
  const IncomeScreen({super.key});

  @override
  ConsumerState<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends ConsumerState<IncomeScreen> {
  @override
  void initState() {
    super.initState();
    // Optionally, you can trigger fetching incomes here
    // ref.read(incomeControllerProvider.notifier).getAllIncomes(uid: 'user123', financeId: 'finance123');
  }

  @override
  Widget build(BuildContext context) {
    final incomeControllerState = ref.watch(incomeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Income Screen'),
      ),
      body: incomeControllerState.when(
        data: (status) {
          if (status == IncomeStatus.none) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(incomeControllerProvider.notifier).getAllIncomes(
                        uid: 'tx1IemVyAg4rZHwYrdxH',
                        financeId: 'oa9iqfIeqrVbfz78e6sG',
                      );
                },
                child: const Text('Fetch Incomes'),
              ),
            );
          } else if (status == IncomeStatus.success) {
            final incomes =
                ref.read(incomeControllerProvider.notifier).getAllIncomes(
                      uid: 'tx1IemVyAg4rZHwYrdxH',
                      financeId: 'oa9iqfIeqrVbfz78e6sG',
                    );

            return FutureBuilder<List<Income>>(
              future: incomes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No incomes found.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final income = snapshot.data![index];
                      return ListTile(
                        title: Text(income.description ?? ''),
                        subtitle: Text(income.amount.toString()),
                      );
                    },
                  );
                }
              },
            );
          }
          return Container();
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
