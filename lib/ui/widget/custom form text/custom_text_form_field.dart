import 'package:flutter/material.dart';
import 'package:management_finance/color/theme.dart';

class customTextFormField extends StatelessWidget {
  final String hinText;
  final Icon icon;
  final bool obscureText;
  final TextEditingController controller;

  const customTextFormField({
    Key? key,
    required this.icon,
    required this.hinText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: kGreyColor,
            obscureText: obscureText,
            controller: controller,
            style: TextStyle(color: kWhiteColor),
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: hinText,
              icon: icon,
              labelStyle: TextStyle(color: kWhiteColor, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
