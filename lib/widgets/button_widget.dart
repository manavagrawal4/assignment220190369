import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function? onButtonPressed;
  ButtonWidget({
    required this.title,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed == null
          ? null
          : () {
              onButtonPressed!();
            },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          primary: Theme.of(context).primaryColor),
    );
  }
}
