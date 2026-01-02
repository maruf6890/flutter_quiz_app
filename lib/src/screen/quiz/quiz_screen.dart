
import 'package:flutter/material.dart';
import 'package:quiz_app/src/screen/quiz/quiz_contoller.dart';

class QuizScreen extends StatefulWidget {
  final QuizController quiz;
  final Function(String) changeScreen;
  final String type;
  const QuizScreen({required this.quiz, required this.changeScreen, required this.type, super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}
class _QuizScreenState extends State<QuizScreen> {

  int currentQuestionIndex = 0;

  void nextQuestion() {
    if (currentQuestionIndex < widget.quiz.totalQuestions() - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }
  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }
  bool isLastQuestion() {
    return currentQuestionIndex == widget.quiz.totalQuestions() - 1;
  }

  
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
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${currentQuestionIndex + 1}. ${widget.quiz.getQuestionText(currentQuestionIndex)}",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ...widget.quiz.getQuestionOptions(currentQuestionIndex).asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                     onPressed: () {
                            if (widget.type == "quiz") {
                              widget.quiz.addAnswerToQuestion(
                                currentQuestionIndex,
                                index,
                              );
                            }
                          },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.quiz.isAnswered(currentQuestionIndex, index) 
                            ? const Color.fromARGB(255, 228, 227, 227)
                            : Colors.white,
                        foregroundColor: widget.type != "quiz" ?widget.quiz.isAnswered(currentQuestionIndex, index) 
                            ? Colors.blueAccent
                            : Colors.black
                            : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(option),
                    ),
                  );
                }),
                SizedBox(height: 20),
               Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: previousQuestion,
                      icon: Icon(Icons.arrow_back),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4
                          ),
                        ),
                      ),
                      label: Text('Previous'),
                    ),
                    ElevatedButton.icon(
                      onPressed: isLastQuestion() ? () => widget.changeScreen('success') : nextQuestion,
                      icon: Icon(Icons.arrow_forward),
                       style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      label: isLastQuestion() ? Text('Submit') : Text('Next'),
                    ),
                  ],
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}