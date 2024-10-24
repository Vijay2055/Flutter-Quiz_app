import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quize_app/data/data.dart';
import 'package:quize_app/questions_summary/questions_summary.dart';

class QuizResult extends StatelessWidget {
  const QuizResult(
      {super.key, required this.chosenAnswer, required this.reStartQuiz});
  final List<String> chosenAnswer;
  final void Function() reStartQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answer[0],
        'user-answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryAnswer = getSummary();
    final numCorrectAns = questions.length;
    final numUserAns = summaryAnswer.where((data) {
      return data['correct-answer'] == data["user-answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numUserAns out of $numCorrectAns questions correctly",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummary()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: reStartQuiz,
              icon: const Icon(
                Icons.refresh,
                color: Color.fromARGB(255, 247, 216, 242),
              ),
              label: Text(
                "Refresh Quiz!",
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 247, 216, 242),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
