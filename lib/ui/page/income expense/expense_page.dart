// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:management_finance/color/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../widget/custom button/custom_button_menu.dart';

final TextEditingController controllerDate = TextEditingController(text: "");
final TextEditingController controllerKeterangan =
    TextEditingController(text: "");
final TextEditingController controllerHarga = TextEditingController(text: "");
DateTime date = DateTime(2022, 12, 24);

_openPopup(context) {
  Alert(
    context: context,
    title: "Add Income",
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: () async {
            showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(1900),
              lastDate: DateTime(9999),
            );
          },
          child: Text(
            "Select Date",
            style: blackTextStyle,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: controllerKeterangan,
          decoration: InputDecoration(
            icon: Icon(Icons.subtitles),
            labelText: 'Text',
          ),
        ),
        TextField(
          controller: controllerHarga,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.payments),
            labelText: 'Ammount',
          ),
        ),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          "Save",
          style: WhiteTextStyle.copyWith(fontSize: 20),
        ),
      )
    ],
  ).show();
}

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget homePage() {
      return Container(
        width: 300,
        height: 112,
        child: Image(
          image: AssetImage('assets/illustration_expense_page.png'),
        ),
      );
    }

    Widget homeButton() {
      return Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: kRectangleColor, width: 2),
            color: kBackgroundColor,
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

    Widget mainMenu() {
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
                title: 'Income',
                backgroundColor: kBackgroundColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/income_page');
                },
              ),
              homeButton(),
              CustomButtonMenu(
                width: 150,
                backgroundColor: kRectangleColor,
                margin: EdgeInsets.only(left: 18),
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

    Widget isiHistory() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
                    'headset gaming',
                    style: WhiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: semibold),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Rp 350.000',
                      style: redTextStyle.copyWith(
                          fontSize: 18, fontWeight: black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget iconadd() {
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
              _openPopup(context);
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.add,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonAdd() {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              iconadd(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            homePage(),
            mainMenu(),
            date(),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    isiHistory(),
                    isiHistory(),
                    isiHistory(),
                    isiHistory(),
                    isiHistory(),
                    isiHistory(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buttonAdd(),
          ],
        ),
      ),
    );
  }
}
