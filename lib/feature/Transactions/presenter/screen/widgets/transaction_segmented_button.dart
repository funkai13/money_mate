import 'package:flutter/material.dart';

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({super.key});

  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

enum Transaction { salida, ingreso, transferencia }

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  Transaction transactionView = Transaction.salida;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Transaction>(
      style: SegmentedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        selectedForegroundColor: Colors.white,
        selectedBackgroundColor: Colors.blue,
      ),
      segments: const <ButtonSegment<Transaction>>[
        ButtonSegment<Transaction>(
          value: Transaction.salida,
          label: Text('Salida'),
        ),
        ButtonSegment<Transaction>(
          value: Transaction.ingreso,
          label: Text('Ingreso'),
        ),
        // ButtonSegment<Transaction>(
        //     value: Transaction.transferencia,
        //     label: Text('transferencia'),
        //     icon: Icon(Icons.calendar_view_month)),
      ],
      selected: <Transaction>{transactionView},
      onSelectionChanged: (Set<Transaction> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          transactionView = newSelection.first;
        });
      },
    );
  }
}
