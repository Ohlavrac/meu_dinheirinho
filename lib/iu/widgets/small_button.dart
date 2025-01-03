import 'package:flutter/material.dart';

import '../texts/app_texts.dart';

class SmallButon extends StatefulWidget {
  final int movimentID;
  final String label;
  final Icon icon;
  final Function onPressed;
  final Color color;
  const SmallButon({Key? key, required this.movimentID, required this.label, required this.icon, required this.onPressed, required this.color}) : super(key: key);

  @override
  State<SmallButon> createState() => _SmallButonState();
}

class _SmallButonState extends State<SmallButon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: widget.icon,
      onPressed: widget.onPressed(),
      label: Text(widget.label, style: AppTexts.subtitle,),
      style:ElevatedButton.styleFrom(
        backgroundColor: widget.color
      ),
    );
  }
}