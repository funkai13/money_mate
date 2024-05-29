import 'package:flutter/material.dart';

class TransactionInfoRow extends StatelessWidget {
  final String title;
  final String buttonText;
  final IconData icon;
  final Color containerColor;
  final IconData buttonIcon;
  final Color iconColor;
  const TransactionInfoRow(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.icon,
      required this.containerColor,
      required this.buttonIcon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                buttonText,
                style: TextStyle(color: Colors.black),
              ),
              Icon(
                buttonIcon,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ],
    );
  }
}
