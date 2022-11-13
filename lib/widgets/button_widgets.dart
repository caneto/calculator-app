import 'package:flutter/material.dart';
import 'package:fluttercalculatorapp/utils/colors.dart';

class ButtonWidgets extends StatefulWidget {
  final String textButton;
  Color textColor;
  Color buttonBgColor;
  final VoidCallback? onPressed;
  
  ButtonWidgets({
    Key? key,
    required this.textButton,
    this.textColor = txtColor,
    this.buttonBgColor = buttonColor, 
    this.onPressed,
  }) : super(key: key);

  @override
  State<ButtonWidgets> createState() => _ButtonWidgetsState();
}

class _ButtonWidgetsState extends State<ButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(22),
            backgroundColor: widget.buttonBgColor,
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.textButton,
            style: TextStyle(
                fontSize: 18, color: widget.textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
