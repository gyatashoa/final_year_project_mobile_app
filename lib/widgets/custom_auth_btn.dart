import 'package:flutter/material.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn(
      {Key? key, required this.text, this.backgroundColor, this.color})
      : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              primary: color ?? Colors.white,
              backgroundColor: backgroundColor ?? const Color(0xff0172C0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {},
          child: Text(text)),
    );
  }
}
