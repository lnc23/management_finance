// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_finance/color/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../cubit/auth_cubit.dart';
import '../../widget/custom button/custom_button.dart';
import '../../widget/custom form text/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget illustration() {
      return Container(
        width: 300,
        height: 250,
        child: Image(
          image: AssetImage('assets/illustration_login.png'),
        ),
      );
    }

    Widget inputSection() {
      Widget inputEmail() {
        return customTextFormField(
          icon: Icon(
            Icons.email,
            color: kWhiteColor,
          ),
          hinText: 'Email',
          controller: emailController,
        );
      }

      Widget inputPassword() {
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

      Widget buttonLogin() {
        return customButton(
          title: 'Sign In',
          width: 200,
          margin: EdgeInsets.only(top: 10),
          onPressed: () async {
            Navigator.pushNamed(context, '/home');
            context.read<AuthCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
          },
        );
      }

      Widget register() {
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign_up');
              },
              child: Text(
                'Sign up',
                style: WhiteTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      }

      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.setInt("value", 1);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(
              top: 70,
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
                inputEmail(),
                inputPassword(),
                buttonLogin(),
                register(),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            illustration(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
