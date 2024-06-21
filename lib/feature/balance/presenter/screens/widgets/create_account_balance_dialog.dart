import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/mobile_design_system/shared/widgets/dialog_form_field.dart';

import '../../controller/balance_controller.dart';

class CreateAccountBalanceDialog extends ConsumerStatefulWidget {
  final bool isEditing;
  final String? title;
  final double? balance;
  const CreateAccountBalanceDialog({
    super.key,
    required this.isEditing,
    required this.title,
    required this.balance,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateAccountBalanceDialog();
}

class _CreateAccountBalanceDialog
    extends ConsumerState<CreateAccountBalanceDialog> {
  Future<void> _processAccountBalance() async {
    final isEditing = widget.isEditing;
    if (isEditing) {
      await _updateAccountBalance();
    } else {
      await _createAccountBalance();
    }
  }

  Future<void> _createAccountBalance() async {
    if (!formKey.currentState!.validate()) return;
    try {
      await ref.read(balanceControllerProvider.notifier).createAccountBalance(
            title: _accountNameController.text,
            balance: double.parse(_balanceController.text),
            creationDate: DateTime.now(),
            updateDate: DateTime.now(),
          );
      if (mounted) {
        ref.refresh(balanceControllerProvider);
        Navigator.of(context).pop();
        Future.delayed(const Duration(milliseconds: 100)).then((_) {
          context.go('/home');
        });
      }
    } catch (e) {
      print('Error creating account: $e');
      // Manejo adicional de errores si es necesario
    }
  }

  Future<void> _updateAccountBalance() async {
    if (!formKey.currentState!.validate()) return;
    await ref.read(balanceControllerProvider.notifier).updateOne(
          currentTitle: widget.title ?? '',
          newTitle: _accountNameController.text,
          balance: double.parse(_balanceController.text),
        );
    if (mounted) {
      ref.refresh(balanceControllerProvider);
      Navigator.of(context).pop();
      Future.delayed(const Duration(milliseconds: 100)).then((_) {
        context.go('/home');
      });
    }
  }

  Future<void> _deleteAccountBalance() async {
    await ref
        .read(balanceControllerProvider.notifier)
        .delete(currentTitle: widget.title ?? '');
    if (mounted) {
      ref.refresh(balanceControllerProvider);
      Navigator.of(context).pop();
      Future.delayed(const Duration(milliseconds: 100)).then((_) {
        context.go('/home');
      });
    }
  }

  late final formKey = GlobalKey<FormState>();
  final _accountNameController = TextEditingController();
  final _balanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _accountNameController.text = widget.title ?? '';
    _balanceController.text = widget.balance?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Text(
                    "Configurar Cuenta",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                  const SizedBox(width: 120),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 12,
              left: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'General',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    DialogFormField(
                        hintText: 'mi cuenta',
                        labelText: 'Nombre de la Cuenta ',
                        icon: Icons.text_snippet,
                        containerColor: Colors.blueAccent,
                        iconColor: Colors.white,
                        controller: _accountNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                    DialogFormField(
                        hintText: '0.00',
                        labelText: 'Balance Actual',
                        icon: Icons.calculate,
                        containerColor: Colors.orangeAccent,
                        iconColor: Colors.white,
                        controller: _balanceController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(),
                onPressed: _processAccountBalance,
                child: const Text(
                  'Guardar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (widget.isEditing)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: _deleteAccountBalance,
                  child: const Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
