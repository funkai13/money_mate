import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/core/mobile_design_system/shared/widgets/navigation_bottom_bar.dart';
import 'package:money_mate/feature/auth/presenter/controller/sign_out_controller.dart';
import 'package:money_mate/feature/home/presenter/screen/widgets/card_swiper.dart';
import 'package:money_mate/feature/home/presenter/screen/widgets/chart_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MoneyMate'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Log out'),
              onTap: () {
                ref.read(logoutControllerProvider.notifier).signOut(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const NavigationBottomBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CardSwiper(),
            ),
            Center(
              child: ChartCard(),
            ),
          ],
        ),
      ),
    );
  }
}
