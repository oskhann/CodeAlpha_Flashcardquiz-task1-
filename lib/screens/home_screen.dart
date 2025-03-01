import 'package:flutter/material.dart';
import '../data/flashcards.dart';
import '../widgets/flashcard_widget.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flashcard Quiz")),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: flashcards.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return FlashcardWidget(flashcard: flashcards[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              child: const Text("Start Quiz"),
            ),
          ),
        ],
      ),
    );
  }
}
