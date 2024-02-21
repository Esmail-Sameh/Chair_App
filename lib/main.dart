import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/module/cart/cart_screen.dart';
import 'package:project/module/detilse/detilse.dart';
import 'package:project/module/home/home.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/observe.dart';
import 'package:project/shared/styles/themes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routName,
          routes: {
            HomeScreen.routName: (context) => HomeScreen(),
            DetilseScreen.routName: (context) => DetilseScreen(),
            CartScreen.routName: (context) => CartScreen(),
          },
          theme: lightTheme
      ),
    );
  }
}
