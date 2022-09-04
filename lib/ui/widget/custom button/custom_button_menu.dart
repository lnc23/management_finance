import 'package:flutter/material.dart';
import 'package:management_finance/color/theme.dart';

class CustomButtonMenu extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;
  final Color backgroundColor;

  const CustomButtonMenu(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      required this.onPressed,
      this.margin = EdgeInsets.zero,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      margin: margin,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: backgroundColor,
          primary: Colors.white,
          side: BorderSide(
            color: kRectangleColor,
            width: 2,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: WhiteTextStyle.copyWith(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
