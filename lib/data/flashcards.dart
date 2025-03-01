import '../models/Flashcard.dart';

List<Flashcard> flashcards = [
  Flashcard(
    question: "What is Flutter?",
    answer: "A UI toolkit for building natively compiled apps.",
    options: [
      "A programming language",
      "A UI toolkit for building natively compiled apps.",
      "An Android emulator",
      "A database management system"
    ],
  ),
  Flashcard(
    question: "What language does Flutter use?",
    answer: "Dart",
    options: [
      "Java",
      "Kotlin",
      "Dart",
      "Swift"
    ],
  ),
  Flashcard(
    question: "Who developed Flutter?",
    answer: "Google",
    options: [
      "Apple",
      "Microsoft",
      "Google",
      "Facebook"
    ],
  ),
  Flashcard(
    question: "What widget is used for creating a button?",
    answer: "ElevatedButton",
    options: [
      "Container",
      "Text",
      "ElevatedButton",
      "Column"
    ],
  ),
  Flashcard(
    question: "What command is used to create a new Flutter project?",
    answer: "flutter create project_name",
    options: [
      "flutter start",
      "flutter new",
      "flutter create project_name",
      "flutter init"
    ],
  ),
];
