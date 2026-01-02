class QuizController {
  int quizScore = 0;
  int numberOfQuestionsAnswered = 0;
  String quizTitle = "General Knowledge Quiz";

  List<Question> questions = [];
  QuizController() {
    quizScore = 0;
    numberOfQuestionsAnswered = 0;
    questions.add(
      Question(
        questionText: "What is the capital of France?",
        options: ["Berlin", "Madrid", "Paris", "Rome"],
        correctOptionIndex: 2,
      ),
    );
    questions.add(
      Question(
        questionText: "Which planet is known as the Red Planet?",
        options: ["Earth", "Mars", "Jupiter", "Saturn"],
        correctOptionIndex: 1,
      ),
    );
    questions.add(
      Question(
        questionText: "Who wrote 'To Kill a Mockingbird'?",
        options: [
          "Harper Lee",
          "Mark Twain",
          "Ernest Hemingway",
          "F. Scott Fitzgerald",
        ],
        correctOptionIndex: 0,
      ),
    );
    questions.add(
      Question(
        questionText: "What is the largest ocean on Earth?",
        options: [
          "Atlantic Ocean",
          "Indian Ocean",
          "Arctic Ocean",
          "Pacific Ocean",
        ],
        correctOptionIndex: 3,
      ),
    );
    questions.add(
      Question(
        questionText: "What is the chemical symbol for gold?",
        options: ["Au", "Ag", "Fe", "Pb"],
        correctOptionIndex: 0,
      ),
    );
  }

  void resetQuiz() {
    quizScore = 0;
    numberOfQuestionsAnswered = 0;
    for (var question in questions) {
      question.givenAnswerIndex = -1;
    }
  }

  int getScore() {
    return quizScore;
  }

  void incrementScore() {
    quizScore++;
  }

  void incrementQuestionsAnswered() {
    numberOfQuestionsAnswered++;
  }

  bool isAnswered(int questionIndex, int optionIndex) {
    return questions[questionIndex].isAnswered() &&
        questions[questionIndex].givenAnswerIndex == optionIndex;
  }

  int getQuestionsAnswered() {
    return numberOfQuestionsAnswered;
  }

  int totalQuestions() {
    return questions.length;
  }

  String getQuestionText(int questionIndex) {
    return questions[questionIndex].questionText;
  }

  List<String> getQuestionOptions(int questionIndex) {
    return questions[questionIndex].options;
  }

  void addAnswerToQuestion(int questionIndex, int answerIndex) {
    questions[questionIndex].addAnswer(answerIndex);
    if (questions[questionIndex].isCorrect(answerIndex)) {
      incrementScore();
    }
    incrementQuestionsAnswered();
  }

  bool isCorrectAnswer(int questionIndex, int optionIndex) {
    return questions[questionIndex].isCorrect(optionIndex);
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  int givenAnswerIndex = -1;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });

  bool isCorrect(int selectedIndex) {
    return selectedIndex == correctOptionIndex;
  }

  bool isAnswered() {
    return givenAnswerIndex != -1;
  }

  void addAnswer(int answerIndex) {
    givenAnswerIndex = answerIndex;
  }

  String getGivenAnswer() {
    for (int i = 0; i < options.length; i++) {
      if (i == givenAnswerIndex) {
        return options[i];
      }
    }
    return "No Answer Given";
  }
}
