import 'dart:ui';

import 'package:app/components/customcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 220),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/welcomescreen/caplogo.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 50, bottom: 20),
            child: Text(
              'Food for Everyone',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white,
                  height: 1),
            ),
          ),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 175, top: 50),
              child: Image.asset('assets/images/welcomescreen/toy1.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Image.asset('assets/images/welcomescreen/toy2.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 300),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Get started',
                            style: GoogleFonts.poppins(
                                color: CustomColor.primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w400)))),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
