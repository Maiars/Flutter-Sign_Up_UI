import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginui/style/fonts.dart';
import 'package:loginui/widget/button_widget.dart';

import '../style/colors.dart';
import 'sign_up.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120.0),
                      bottomRight: Radius.circular(120.0)),
                  color: orange,
                ),
              ),
              Positioned(
                  bottom: -100 / 2,
                  left: MediaQuery.of(context).size.width / 3,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    elevation: 10,
                    child: CircleAvatar(
                        backgroundColor: dark,
                        radius: 70,
                        child: Image.asset('assets/images/homepage.png')),
                  )),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            'Planet',
            style: homepageTitle,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Are you ready to start exploring planets?',
            style: homepageSubtitle,
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20)),
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29)))),
                child: Text(
                  'Get Started For Free',
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
