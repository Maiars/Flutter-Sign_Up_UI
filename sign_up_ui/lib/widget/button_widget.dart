import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginui/screens/sign_up.dart';

import '../style/fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final IconData? icon;
  final Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              ))),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: FaIcon(
                  icon,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  title,
                  style: homepageButton,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
