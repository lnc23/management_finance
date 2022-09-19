import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_finance/color/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../cubit/login and singup/auth_cubit.dart';
import '../../../cubit/login and singup/auth_state.dart';
import '../../widget/custom button/custom_button.dart';
import '../../widget/custom form text/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: "");

  TextEditingController hobbyController = TextEditingController(text: "");

  TextEditingController numberController = TextEditingController(text: "");

  TextEditingController passwordController = TextEditingController(text: "");

  TextEditingController emailController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget buttonBack() {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(left: defaultMargin, top: defaultMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Container(
                width: 37,
                height: 37,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_page');
                  },
                  icon: Image.asset('assets/ic_back.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  'Sign Up',
                  style: WhiteTextStyle.copyWith(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget inputsection() {
      Widget nameInput() {
        return customTextFormField(
          icon: Icon(
            Icons.badge,
            color: kWhiteColor,
          ),
          hinText: 'Name',
          controller: nameController,
        );
      }

      Widget emailInput() {
        return customTextFormField(
          icon: Icon(
            Icons.email,
            color: kWhiteColor,
          ),
          hinText: 'Email',
          controller: emailController,
        );
      }

      Widget numberInput() {
        return customTextFormField(
          icon: Icon(
            Icons.phone,
            color: kWhiteColor,
          ),
          hinText: 'Number Phone',
          controller: numberController,
        );
      }

      Widget passwordInput() {
        return customTextFormField(
          icon: Icon(
            Icons.key,
            color: kWhiteColor,
          ),
          hinText: 'Password',
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget signupButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
            if (state is AuthSuccess) {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setInt("value", 1);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: kRedColor, content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return customButton(
              title: 'SignUp',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                      no_telp: numberController.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: kRectangleColor,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            numberInput(),
            signupButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            buttonBack(),
            inputsection(),
          ],
        ),
      ),
    );
  }
}
