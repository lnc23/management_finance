import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_finance/cubit/add%20expense%20and%20income/add_cubit.dart';
import 'package:management_finance/ui/page/halaman%20utama/login.dart';
import 'package:management_finance/ui/page/halaman%20utama/signup.dart';
import 'package:management_finance/ui/page/halaman%20utama/splash_screen.dart';
import 'package:management_finance/ui/page/home/home_page.dart';
import 'package:management_finance/ui/page/income%20expense/expense_page.dart';
import 'package:management_finance/ui/page/income%20expense/income_page.dart';

import 'cubit/login and singup/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AddCubit(),
        ),
      ],
      child: MaterialApp(
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffefefef)),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/login_page': (context) => LoginPage(),
          '/sign_up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/income_page': (context) => IncomePage(),
          '/expense_page': (context) => ExpensePage(),
        },
      ),
    );
  }
}
