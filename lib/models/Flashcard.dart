class Flashcard {
  String question;
  String answer;
  List<String> options; // New field for multiple-choice answers

  Flashcard({
    required this.question,
    required this.answer,
    required this.options,
  });
}
