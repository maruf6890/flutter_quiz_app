import 'package:flutter/material.dart';
import './component/start_quiz_button.dart';

class SplashScreen extends StatelessWidget {
  final Function(String) changeScreen;
  const SplashScreen({super.key, required this.changeScreen});

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
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/question.png'),
                width: 150,
                height: 150,
              ),
              Text(
                'Quiz App',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              StartQuizButton(onPressed: () {
                changeScreen('quiz');
              }),
            ],
          ),
        ),
      ),
    );
  }
}
