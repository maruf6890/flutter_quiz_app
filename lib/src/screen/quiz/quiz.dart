import 'package:flutter/material.dart';
class Quiz extends StatelessWidget {
  //questions
  

  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
} 

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });

  bool isCorrect(int selectedIndex) {
    return selectedIndex == correctOptionIndex;
  }
} 