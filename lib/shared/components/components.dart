import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/module/cart/cart_screen.dart';

void navgate_to(
  BuildContext context, {
  required String routName,
}) {
  Navigator.pushNamed(context, routName);
}

Widget cartItem(BuildContext context, String? routname) => GestureDetector(
      onTap: () {
        if (routname == null) {
          return null;
        } else {
          navgate_to(context, routName: CartScreen.routName);
        }
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Icon(Icons.card_travel_rounded),
      ),
    );

void showToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

//enum toast color
enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}
