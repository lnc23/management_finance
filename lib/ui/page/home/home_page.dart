// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:management_finance/color/theme.dart';

import '../../widget/custom button/custom_button_menu.dart';
import '../../widget/custom card view/total_expense_card_view.dart';
import '../../widget/custom card view/total_income_card_view.dart';
import '../../widget/custom history/history_income_expense.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget totalIncome() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              totalIncomeCardView(),
              totalExpenseCardView(),
            ],
          ),
        ),
      );
    }

    Widget date() {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(left: defaultMargin, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date',
                style: WhiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget History() {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'History Income & Expense',
                style: WhiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              )
            ],
          ),
        ),
      );
    }

    Widget isiHistory() {
      return Container(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    historyIncomeExpense(),
                    historyIncomeExpense(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget homePage() {
      return Container(
        width: 300,
        height: 112,
        child: Image(
          image: AssetImage('assets/illustration_home_page.png'),
        ),
      );
    }

    Widget homeButton() {
      return Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: kRectangleColor, width: 2),
            color: kRectangleColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(100.0),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.home,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonNavigation() {
      return Container(
        child: Padding(
          padding: EdgeInsets.all(
            defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonMenu(
                width: 150,
                margin: EdgeInsets.only(right: 18),
                backgroundColor: kBackgroundColor,
                title: 'Income',
                onPressed: () {
                  Navigator.pushNamed(context, '/income_page');
                },
              ),
              homeButton(),
              CustomButtonMenu(
                width: 150,
                margin: EdgeInsets.only(left: 18),
                backgroundColor: kBackgroundColor,
                title: 'Expense',
                onPressed: () {
                  Navigator.pushNamed(context, '/expense_page');
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            homePage(),
            buttonNavigation(),
            date(),
            totalIncome(),
            History(),
            isiHistory(),
          ],
        ),
      ),
    );
  }
}
