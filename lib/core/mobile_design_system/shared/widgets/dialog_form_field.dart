import 'package:flutter/material.dart';

class DialogFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final Color containerColor;
  final Color iconColor;
  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;
  final TextInputType keyboardType;
  const DialogFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.icon,
      required this.containerColor,
      required this.iconColor,
      required this.controller,
      required this.autovalidateMode,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              autovalidateMode: autovalidateMode,
              keyboardType: keyboardType,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
