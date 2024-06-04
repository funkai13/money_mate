import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/feature/balance/presenter/screens/widgets/balance_card.dart';

import '../../../domain/entity/balance.dart';
import 'add_account_card.dart';

class CardSwiper extends StatelessWidget {
  final List<AccountBalance> accountBalances;
  const CardSwiper({super.key, required this.accountBalances});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 200,
      child: Swiper(
        loop: false,
        viewportFraction: 0.6,
        scale: 1,
        itemWidth: 100,
        itemHeight: 150,
        itemCount: accountBalances.length + 1,
        pagination: const SwiperPagination(
          margin: EdgeInsets.all(1),
          builder: DotSwiperPaginationBuilder(
              color: Colors.black12,
              activeColor: Colors.white,
              activeSize: 8,
              size: 5,
              space: 3),
        ),
        itemBuilder: (context, int index) {
          if (index < accountBalances.length) {
            final accountBalance = accountBalances[index];
            return BalanceCard(
              title: accountBalance.title,
              balance: accountBalance.balance,
            );
          } else {
            return const AddAccountCard();
          }
        },
      ),
    );
  }
}
