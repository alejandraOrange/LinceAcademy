import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

enum GameState { playing, won, lost }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: Center(child: GameManager())),
    );
  }
}

class GameManager extends StatefulWidget {
  const GameManager({super.key});

  @override
  State<GameManager> createState() => GameManagerState();
}

class GameManagerState extends State<GameManager> {
  GameState _gameState = GameState.playing;
  int _wins = 0;
  int _losses = 0;

  final Random _random = Random();
  int _correctButton = 0;
  int _attempts = 0;

  void _handleGuess(int guess) {
    setState(() {
      if (guess == _correctButton) {
        _wins++;
        _gameState = GameState.won;
      } else {
        _attempts++;
        if (_attempts >= 2) {
          _losses++;
          _gameState = GameState.lost;
        }
      }
    });
  }

  void _startNewGame() {
    setState(() {
      _correctButton = _random.nextInt(3);
      _attempts = 0;
      _gameState = GameState.playing;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_gameState) {
      case GameState.playing:
        return GameScreen(onGuess: _handleGuess, wins: _wins, losses: _losses);
      case GameState.won:
        return EndScreen(
          message: 'Você ganhou!',
          color: Colors.green,
          onRestart: _startNewGame,
          wins: _wins,
          losses: _losses,
        );
      case GameState.lost:
        return EndScreen(
          message: 'Você perdeu!',
          color: Colors.red,
          onRestart: _startNewGame,
          wins: _wins,
          losses: _losses,
        );
    }
  }
}

class GameScreen extends StatelessWidget {
  final void Function(int) onGuess;
  final int wins;
  final int losses;

  const GameScreen({
    super.key,
    required this.onGuess,
    required this.wins,
    required this.losses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Escolha a opção correta:',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('A', 0),
            const SizedBox(width: 20),
            _buildButton('B', 1),
            const SizedBox(width: 20),
            _buildButton('C', 2),
          ],
        ),
        const SizedBox(height: 30),
        Text('Vitórias: $wins | Derrotas: $losses'),
      ],
    );
  }

  Widget _buildButton(String label, int index) {
    return ElevatedButton(
      onPressed: () => onGuess(index),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}

class EndScreen extends StatelessWidget {
  final String message;
  final Color color;
  final VoidCallback onRestart;
  final int wins;
  final int losses;

  const EndScreen({
    super.key,
    required this.message,
    required this.color,
    required this.onRestart,
    required this.wins,
    required this.losses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRestart,
            child: const Text('Jogar novamente'),
          ),
          const SizedBox(height: 20),
          Text('Vitórias: $wins | Derrotas: $losses'),
        ],
      ),
    );
  }
}
