import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../texts/app_texts.dart';

class SquareCardButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String label;
  final bool redOrGreen;
  const SquareCardButton({Key? key, required this.icon, required this.color, required this.label, required this.redOrGreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/addWalletMoviment", arguments: redOrGreen);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
        height: 115,
        //width: 180,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(3, 2)
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            //Icon(Icons.call_received),
            Text(label, style: label == "Adicionar Gasto" ? AppTexts.normal2 : AppTexts.normal)
          ],
        ),
      ),
    );
  }
}