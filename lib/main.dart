import 'package:flutter/material.dart';
import 'package:quiz_app/Src/screen/Splash/splash.dart';
import 'package:quiz_app/src/screen/quiz/quiz_contoller.dart';
import 'package:quiz_app/src/screen/quiz/quiz_screen.dart';
import 'package:quiz_app/src/screen/sucess/sucess.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}
class _QuizAppState extends State<QuizApp> {

  QuizController quizController = QuizController();
  String currentScreen = 'splash';
  changeScreen(String screen) {
    setState(() {
      currentScreen = screen;
    });
  } 
  Widget getCurrentScreen() {
   if (currentScreen == 'quiz') {
      return QuizScreen(quiz: quizController, changeScreen: changeScreen,type:"quiz",);
    } else if (currentScreen == 'success') {
      return SuccessScreen(quiz: quizController,changeScreen:changeScreen );
    }else if (currentScreen == 'review') {
      return QuizScreen(quiz: quizController, changeScreen: changeScreen,type:"answer",);
    }
    return SplashScreen(changeScreen: changeScreen);

  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: getCurrentScreen()
        
      );
  }
}
