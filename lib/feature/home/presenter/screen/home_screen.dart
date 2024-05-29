import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/core/mobile_design_system/shared/widgets/navigation_bottom_bar.dart';
import 'package:money_mate/feature/auth/presenter/controller/sign_out_controller.dart';
import 'package:money_mate/feature/home/presenter/screen/widgets/card_swiper.dart';
import 'package:money_mate/feature/home/presenter/screen/widgets/chart_card.dart';
import 'package:money_mate/feature/home/presenter/screen/widgets/last_records.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      bottomNavigationBar: const NavigationBottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.blue[700],
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Hola usuario',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {
                              ref
                                  .read(logoutControllerProvider.notifier)
                                  .signOut(context);
                            },
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 15),
                      child: CardSwiper(),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[300],
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: ChartCard(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: LastRecords(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
