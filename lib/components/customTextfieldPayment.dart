import 'package:flutter/material.dart';

class CustomTextFieldPayment extends StatelessWidget {

  final String label;
  final Widget icon;
  final bool isPassword;
  final TextEditingController controller;
  final Function onTap;

  const CustomTextFieldPayment({Key key, this.label, this.icon, this.isPassword = false, this.controller,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly: true,
      controller: controller,
      style: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold,fontSize: 12),
      obscureText: isPassword,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5)
          ),
          hintText: label,
          hintStyle: TextStyle(color: Color(0xFFF234253)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          )
      ),

    );
  }
}