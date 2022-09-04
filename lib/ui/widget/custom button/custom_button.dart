import 'package:flutter/material.dart';
import 'package:management_finance/color/theme.dart';

class customButton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  const customButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      required this.onPressed,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: kGreyColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius))),
        child: Text(
          title,
          style: WhiteTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
