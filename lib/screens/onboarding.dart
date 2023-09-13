import 'dart:ui';

import 'package:app/components/custom_color.dart';
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
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 9,
                  top: MediaQuery.of(context).size.height / 15),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/welcomescreen/caplogo.png',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 17,
                  ),
                  Text(
                    'Food for Everyone',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                        height: 1),
                  ),
                ],
              ),
            ),
            Stack(children: [
              Padding(
                padding: EdgeInsets.only(left: mWidth * 0.5, top: mHeight / 10),
                child: Image.asset(
                  'assets/images/welcomescreen/toy1.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Image.asset(
                  'assets/images/welcomescreen/toy2.png',
                  width: mWidth * 1,
                  height: mHeight * 0.5,
                ),
              ),
              Positioned(
                bottom: 0.5,
                left: 20,
                right: 20,
                child: Container(
                    width: mWidth * 0.7,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Get started',
                            style: GoogleFonts.poppins(
                                color: CustomColor.primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w400)))),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
