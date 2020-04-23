import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String label;
  final Color background;
  final Color borderColor;
  final Color fontColor;
  final Function onTap;

  const LoginButton(
      {Key key,
      this.label,
      this.background,
      this.borderColor,
      this.fontColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 1
          )
        ),
        child: Text(label, style: TextStyle(
          color: fontColor,
          fontSize: 15,
          fontWeight: FontWeight.bold
        )),
      ),
    );
  }
}
