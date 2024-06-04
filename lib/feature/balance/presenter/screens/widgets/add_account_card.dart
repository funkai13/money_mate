import 'package:flutter/material.dart';
import 'package:money_mate/feature/balance/presenter/screens/widgets/create_account_balance_dialog.dart';

class AddAccountCard extends StatelessWidget {
  const AddAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.grey[300],
          context: context,
          isScrollControlled: true,
          builder: (context) => KeyboardResponsiveBottomSheet(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          color: Colors.white.withOpacity(0.2),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.add, size: 40, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Agregar Cuenta')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KeyboardResponsiveBottomSheet extends StatefulWidget {
  @override
  _KeyboardResponsiveBottomSheetState createState() =>
      _KeyboardResponsiveBottomSheetState();
}

class _KeyboardResponsiveBottomSheetState
    extends State<KeyboardResponsiveBottomSheet> with WidgetsBindingObserver {
  double _initialChildSize = 0.5;
  double _maxChildSize = 0.95;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _initialChildSize = bottomInset > 0 ? 0.95 : 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: _initialChildSize,
      maxChildSize: _maxChildSize,
      expand: false,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: CreateAccountBalanceDialog(),
      ),
    );
  }
}
