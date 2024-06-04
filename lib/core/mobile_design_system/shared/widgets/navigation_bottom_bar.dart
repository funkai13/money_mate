import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/feature/Transactions/presenter/screen/widgets/add_transaction_dialog.dart';

import '../../../../routes.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      backgroundColor: Colors.black,
      fixedColor: Colors.black,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go(Routes.home);
          case 1:
            context.go(Routes.planning);
          case 2:
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => DraggableScrollableSheet(
                expand: false,
                builder: (context, scrollController) => SingleChildScrollView(
                  controller: scrollController,
                  child: AddTransactionDialog(),
                ),
              ),
            );
          case 3:
            context.go(Routes.incomes);
        }
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.update), label: 'Planificacion'),
        BottomNavigationBarItem(
          icon: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
          label: '',
        ),
        const BottomNavigationBarItem(
            icon: Icon(Icons.swipe_sharp), label: 'Estadisticas'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_rounded), label: 'mas'),
      ],
    );
  }
}

class BottomSheetDummyUI extends StatelessWidget {
  const BottomSheetDummyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      color: Colors.black12,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          color: Colors.black12,
                          height: 20,
                          width: 240,
                        ),
                      ),
                      SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          color: Colors.black12,
                          height: 20,
                          width: 180,
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
            ],
          )),
    );
  }
}
