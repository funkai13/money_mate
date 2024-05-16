import 'package:flutter/material.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      backgroundColor: Colors.black,
      fixedColor: Colors.black,
      unselectedItemColor: Colors.black,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.update), label: 'Planear'),
        BottomNavigationBarItem(
          icon: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
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
