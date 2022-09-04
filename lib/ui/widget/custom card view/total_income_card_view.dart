import 'package:flutter/material.dart';
import 'package:management_finance/color/theme.dart';

class totalIncomeCardView extends StatelessWidget {
  const totalIncomeCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        left: defaultMargin,
        right: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 25,
      ),
      decoration: BoxDecoration(
        color: kRectangleColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Total Income',
            style: WhiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: extrabold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Center(
              child: Text(
                'Rp 20.000.000',
                style: GreenTextStyle.copyWith(fontSize: 32, fontWeight: black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
