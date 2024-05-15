import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/feature/auth/presenter/controller/sign_out_controller.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Planning'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Back'),
          BottomNavigationBarItem(icon: Icon(Icons.swipe_sharp), label: 'Back'),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded), label: 'more'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Card(
                  color: Colors.white,
                  elevation: 9,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.payments),
                        ListTile(
                          title: Text('Card title'),
                          subtitle: Text('Q 10000'),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
