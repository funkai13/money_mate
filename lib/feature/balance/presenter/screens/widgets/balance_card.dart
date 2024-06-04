import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routes.dart';

class BalanceCard extends StatelessWidget {
  final String? title;
  final double? balance;
  const BalanceCard({super.key, required this.title, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          context.go(Routes.balanceDetail,
              extra: {'title': title, 'balance': balance});
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.yellow[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.monetization_on_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  balance.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'GTQ',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
