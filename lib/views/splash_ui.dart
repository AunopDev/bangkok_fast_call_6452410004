// ignore_for_file: prefer_const_constructors

import 'package:bangkok_fast_call_app/views/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({super.key});

  @override
  State<SplashUI> createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  @override
  void initState() {
    Future.delayed(
        Duration(
          seconds: 5,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bk.png',
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              'สายด่วนรพ.กทม.',
              style: GoogleFonts.itim(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              'เบอร์โรงพยาบาลในสังกัดกทม.',
              style: GoogleFonts.itim(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.yellow,
              ),
            ),
            Text(
              'Emergency Hospital Call',
              style: GoogleFonts.itim(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.yellow,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              'Aunop Chinnapong 6452410004',
              style: GoogleFonts.itim(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
