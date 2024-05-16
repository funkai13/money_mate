import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/feature/home/presenter/screen/widgets/balance_card.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

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
        itemCount: 3,
        pagination: const SwiperPagination(
          margin: EdgeInsets.all(1),
          builder: DotSwiperPaginationBuilder(
              color: Colors.black12,
              activeColor: Colors.green,
              activeSize: 8,
              size: 5,
              space: 3),
        ),
        itemBuilder: (context, int index) {
          return const BalanceCard();
        },
      ),
    );
  }
}
