import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginui/style/colors.dart';
import 'package:loginui/style/fonts.dart';
import 'package:loginui/widget/button_widget.dart';
import 'package:loginui/widget/text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isHidden = true;

  late String _password;
  double _strength = 0;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  String _displayText = 'Please enter a password';

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = 'Please enter you password';
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = 'Your password is too short';
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = 'Your password is acceptable but not strong';
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          _displayText = 'Your password is strong';
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
          _displayText = 'Your password is great';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: FaIcon(
                        FontAwesomeIcons.compass,
                        color: orange,
                        size: 26,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Planet',
                      style: homepageTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'The final step for exploration.',
                style: homepageSubtitle,
              ),
              SizedBox(
                height: 50,
              ),
              TextFormWidget(
                  obscureText: false,
                  onChanged: () => null,
                  controller: _usernameController,
                  labelText: 'Username',
                  hintText: 'example@gmail.com'),
              TextFormWidget(
                  obscureText: true,
                  validator: (val) =>
                      val!.length < 8 ? 'Password too short.' : null,
                  onChanged: () => (value) => _checkPassword(value),
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Min. 8 characters'),
              const SizedBox(
                height: 30,
              ),
              // The strength indicator bar
              Text(
                _displayText,
                style: homepageSubtitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: LinearProgressIndicator(
                  value: _strength,
                  backgroundColor: Colors.grey[300],
                  color: _strength <= 1 / 4
                      ? Colors.red
                      : _strength == 2 / 4
                          ? Colors.yellow
                          : _strength == 3 / 4
                              ? Colors.blue
                              : Colors.green,
                  minHeight: 15,
                ),
              ),

              // The message about the strength of the entered password

              const SizedBox(
                height: 50,
              ),
              // This button will be enabled if the password strength is medium or beyond
              Spacer(),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    )),
                    elevation: MaterialStatePropertyAll(1),
                    backgroundColor: MaterialStatePropertyAll(orange),
                  ),
                  onPressed: _strength < 1 / 2 ? null : () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Text('Discover The Planets!', style: signUpButton),
                  )),
              Spacer(
                flex: 5,
              ),
              ButtonWidget(
                title: 'Sign Up With Gmail',
                color: Colors.white,
                icon: FontAwesomeIcons.google,
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                title: 'Sign Up With Apple',
                color: Colors.white,
                icon: FontAwesomeIcons.apple,
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
