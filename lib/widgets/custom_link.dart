import 'package:flutter/material.dart';

class CustomLink extends StatelessWidget {
  const CustomLink({Key? key, required this.text, required this.callback})
      : super(key: key);
  final String text;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callback,
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xff0172C0)),
        ));
  }
}
