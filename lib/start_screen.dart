import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        // not recommended
        // Opacity(
        //   opacity: 0.5,
        //   child: Image.asset(
        //     "assets/images/quiz-logo.png",
        //     width: 300,
        //   ),
        // ),
        const SizedBox(
          height: 80,
        ),
        Text(
          "This a Quiz-app",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: switchScreen,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(
            Icons.arrow_right_alt_sharp,
          ),
          label: const Text(
            "Start Quiz",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    ));
  }
}
