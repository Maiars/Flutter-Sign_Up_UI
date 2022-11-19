import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginui/style/colors.dart';
import 'package:loginui/style/fonts.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function() onChanged;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  const TextFormWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    this.validator,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: TextFormField(
            obscureText: obscureText,
            onChanged: onChanged(),
            keyboardType: TextInputType.text,
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              labelText: labelText,
              hintText: hintText,
              labelStyle: labelTextStyle,
              hintStyle: hintTextStyle,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: darkPurple, width: 4),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: orange, width: 4),
                borderRadius: BorderRadius.circular(20),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: darkBlue, width: 4),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
