import 'package:flutter/material.dart';
import '../data/flashcards.dart';
import '../models/Flashcard.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  String _selectedOption = "";
  String _feedback = "";

  void _checkAnswer() {
    if (_selectedOption.isEmpty) {
      setState(() {
        _feedback = "Please select an answer.";
      });
      return;
    }

    String correctAnswer = flashcards[_currentIndex].answer;

    setState(() {
      if (_selectedOption == correctAnswer) {
        _score++;
        _feedback = "Correct!";
      } else {
        _feedback = "Incorrect! The correct answer is: $correctAnswer";
      }

      if (_currentIndex < flashcards.length - 1) {
        _currentIndex++;
        _selectedOption = "";
      } else {
        _showResults();
      }
    });
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Completed!"),
        content: Text("Your Score: $_score / ${flashcards.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Flashcard currentFlashcard = flashcards[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Mode")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentFlashcard.question,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentFlashcard.options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedOption = option;
                      _feedback = "";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedOption == option
                        ? Colors.blue.shade200
                        : Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  child: Text(option, textAlign: TextAlign.center),
                ),
              );
            }).toList(),
            const SizedBox(height: 10),
            Text(
              _feedback,
              style: TextStyle(
                fontSize: 16,
                color: _feedback == "Correct!" ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text("Submit Answer"),
            ),
          ],
        ),
      ),
    );
  }
}
