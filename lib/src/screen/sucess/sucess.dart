import 'package:flutter/material.dart';
import 'package:quiz_app/src/screen/quiz/quiz_contoller.dart';

class SuccessScreen extends StatelessWidget {
  final QuizController quiz;
  final Function(String) changeScreen;

  const SuccessScreen({
    super.key,
    required this.quiz,
    required this.changeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline, size: 150, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'You scored ${quiz.quizScore} out of ${quiz.totalQuestions()}',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  IconButton(
                    onPressed: () {
                      changeScreen('splash');
                    },
                    icon: Icon(Icons.home),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      quiz.resetQuiz();
                      changeScreen('quiz');
                    },
                    icon: Icon(Icons.replay),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      changeScreen('review');
                    },
                    icon: Icon(Icons.document_scanner),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
