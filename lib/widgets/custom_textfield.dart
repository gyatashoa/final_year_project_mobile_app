import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.keyType,
      this.enabled = true,
      required this.hintText,
      required this.iconData})
      : super(key: key);
  final String hintText;
  final IconData iconData;
  final bool enabled;
  final TextInputType? keyType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xffc4c4c4)),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          children: [
            Icon(iconData, size: 18, color: Colors.black),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                readOnly: !enabled,
                // enabled: enabled,
                onTap: () {
                  !enabled
                      ? showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now())
                      : null;
                },
                keyboardType: keyType,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 18),
                decoration: InputDecoration.collapsed(
                    hintText: hintText,
                    hintStyle: TextStyle(
                        fontSize: 16, color: Colors.black.withOpacity(.5))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
