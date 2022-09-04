// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:management_finance/color/theme.dart';

class historyIncomeExpense extends StatelessWidget {
  const historyIncomeExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12,
        left: defaultMargin,
        right: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: kRectangleColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '03/08/2022',
                  style: WhiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: semibold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Gajian Bulan Agustus',
                  style: WhiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: semibold),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  'Rp 20.000.000',
                  textAlign: TextAlign.right,
                  style: GreenTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
