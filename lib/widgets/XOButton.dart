import 'package:flutter/material.dart';

class XorObutton extends StatelessWidget {
  String buttonText;
  Function ifButtonClicked;
  int index ;
  XorObutton({ required this.buttonText,required this.index,required this.ifButtonClicked});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              ifButtonClicked(index);
            },
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 35),
            ),
          ),
        ));
  }
}
