import 'package:flutter/material.dart';
import 'package:money_mate/feature/Transactions/presenter/screen/widgets/transaction_segmented_button.dart';

import 'transaction_info_row.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  // Variables to store the transaction details
  DateTime? _date;
  double? _amount;
  String? _category;
  String? _label;
  String? _description;
  List<bool> _selections = List.generate(3, (_) => false);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                        const Text(
                          "Agregar Transaccion",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 17),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Plantillas',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SegmentedButtonExample(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              'GTQ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 325,
                          child: TextFormField(
                            //controller: _emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 25),
                            textDirection: TextDirection.rtl,
                            decoration: const InputDecoration(
                                hintText: 'Ingresa una Cantidad',
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    const Text('General'),
                    const TransactionInfoRow(
                      title: 'Cuenta',
                      buttonText: 'Mi cuenta',
                      icon: Icons.monetization_on_rounded,
                      containerColor: Colors.green,
                      buttonIcon: Icons.navigate_next,
                      iconColor: Colors.white,
                    ),
                    const TransactionInfoRow(
                      title: 'Categoria',
                      buttonText: 'Requerido',
                      icon: Icons.question_mark_sharp,
                      containerColor: Colors.grey,
                      buttonIcon: Icons.navigate_next,
                      iconColor: Colors.white,
                    ),
                    const TransactionInfoRow(
                      title: 'Etiqueta',
                      buttonText: 'Etiqueta',
                      icon: Icons.label_outlined,
                      containerColor: Colors.transparent,
                      buttonIcon: Icons.navigate_next,
                      iconColor: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Detalles'),
                    const TransactionInfoRow(
                      title: 'Nota',
                      buttonText: '',
                      icon: Icons.edit_note_outlined,
                      containerColor: Colors.transparent,
                      buttonIcon: Icons.navigate_next,
                      iconColor: Colors.grey,
                    ),
                    const TransactionInfoRow(
                      title: 'Status',
                      buttonText: '',
                      icon: Icons.hourglass_empty_outlined,
                      containerColor: Colors.transparent,
                      buttonIcon: Icons.navigate_next,
                      iconColor: Colors.grey,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Guardar'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
