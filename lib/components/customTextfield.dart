import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String label;
  final Widget icon;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({Key key, this.label, this.icon, this.isPassword = false, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold,fontSize: 12),
      obscureText: isPassword,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0)
          ),
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFFF234253),fontWeight: FontWeight.bold),
          suffixIcon: icon
      ),

    );
  }
}