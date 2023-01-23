// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class DefaultTextFormField extends StatelessWidget {
  TextEditingController? controller;
  TextInputType keyboardType;
  String? label;
  TextStyle? textStyle;
  VoidCallback? onTap;
  String? Function(String?)? validator;
  Function(String)? onSubmitted;
  bool secure;
  IconData? prefix;
  Color? prefixColor;
  IconData? suffix;
  Color? suffixColor;
  VoidCallback? suffixPressed;
  bool? isClickable;
  DefaultTextFormField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.label,
    this.textStyle,
    this.onTap,
    required this.validator,
    this.onSubmitted,
    this.secure= false,
    this.prefix,
    this.prefixColor,
    this.suffix,
    this.suffixColor,
    this.suffixPressed,
    this.isClickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white60,
      ),
      child: TextFormField(
        style: textStyle,
        controller: controller,
        keyboardType: keyboardType,
        onTap: onTap,
        enabled: isClickable,
        validator: validator,
        obscureText: secure,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.blueAccent,fontSize: 16.0),
            prefixIcon: Icon(
              prefix,
              color: prefixColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(suffix),
              onPressed: suffixPressed,
              color: suffixColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
      ),
    );
  }
}
