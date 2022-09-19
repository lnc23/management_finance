// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_finance/color/theme.dart';
import 'package:management_finance/cubit/login%20and%20singup/auth_cubit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../cubit/login and singup/auth_state.dart';
import '../../widget/custom button/custom_button_menu.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  TextEditingController controllerKeterangan = TextEditingController(text: '');
  TextEditingController controllerNominal = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference addIncome = firestore.collection('income');
    DateTime date = DateTime(2022, 09, 13);
    _openPopup(context, String user) {
      Alert(
        context: context,
        title: "Add Income",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                DateTime? newdate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(9999),
                );
                if (newdate == null) return;
                setState(() => date = newdate);
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
              controller: controllerNominal,
              decoration: InputDecoration(
                icon: Icon(Icons.payments),
                labelText: 'Ammount',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pushNamed(context, '/income_page');
              addIncome.add(
                {
                  'id': user,
                  'date': date,
                  'keterangan': controllerKeterangan.text,
                  'nominal': controllerNominal.text,
                },
              );
            },
            child: Text(
              "Save",
              style: WhiteTextStyle.copyWith(fontSize: 20),
            ),
          )
        ],
      ).show();
    }

    Widget homePage() {
      return Container(
        width: 300,
        height: 112,
        child: Image(
          image: AssetImage('assets/illustration_income_page.png'),
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
                backgroundColor: kRectangleColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/income_page');
                },
              ),
              homeButton(),
              CustomButtonMenu(
                width: 150,
                backgroundColor: kBackgroundColor,
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

    Widget dateIncome() {
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
                    'Gajian Bulan Agustus',
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
                      'Rp 20.000.000',
                      style: GreenTextStyle.copyWith(
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
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
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
                    String user = state.user.id;
                    _openPopup(context, user);
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
          } else {
            return SizedBox();
          }
        },
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
            dateIncome(),
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
              height: 30,
            ),
            buttonAdd()
          ],
        ),
      ),
    );
  }
}
