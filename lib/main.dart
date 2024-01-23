import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
        ),
        body: TicTacToeBoard(),
      ),
    );
  }
}

class TicTacToeBoard extends StatefulWidget {
  @override
  _TicTacToeBoardState createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));

  bool isPlayerX = true; // true for 'X', false for 'O'

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isPlayerX ? 'Player X\'s turn' : 'Player O\'s turn',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Column(
            children: List.generate(3, (row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (col) {
                  return GestureDetector(
                    onTap: () {
                      if (board[row][col].isEmpty) {
                        setState(() {
                          board[row][col] = isPlayerX ? 'X' : 'O';
                          isPlayerX = !isPlayerX;
                        });
                      }
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          board[row][col],
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              resetGame();
            },
            child: Text('Reset Game'),
          ),
        ],
      ),
    );
  }

  void resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      isPlayerX = true;
    });
  }
}
