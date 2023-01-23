// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';

import '../utils/dimensions.dart';

class DefaultButton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  Color? backgroundColor;

  DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45,
      width: Dimensions.width45*4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          textStyle: TextStyle(
            fontSize: Dimensions.font20,
            fontWeight: FontWeight.bold,
          ),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Dimensions.radius10),
            ),
          ),
        ),
        child: BigText(
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
