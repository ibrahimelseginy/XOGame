import 'package:flutter/material.dart';
import 'package:xo__game/board_button.dart';
import 'package:xo__game/login_screen.dart';

class GameBoardScreen extends StatefulWidget {
  static const String routeName = 'game_board';

  const GameBoardScreen({super.key});

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  int player1score = 0;
  int player2score = 0;
  // List<String> board = ['', '', '', '', '', '', '', '', ''];
  List<String> board = List.generate(9, (index) => '');

  @override
  Widget build(BuildContext context) {
    GameBoardScreenArguments arg =
        ModalRoute.of(context)!.settings.arguments as GameBoardScreenArguments;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              // height: (MediaQuery.of(context).size.height -
              //         MediaQuery.of(context).viewPadding.top) *0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${arg.player1Name}(X)',
                        style: const TextStyle(fontSize: 22),
                      ),
                      Text(
                        'Score: $player1score',
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${arg.player2Name} (O)',
                        style: const TextStyle(fontSize: 22),
                      ),
                      Text(
                        'Score: $player2score',
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
                ),
                itemBuilder: (context, index) => SizedBox(
                    child: BoardButton(
                  text: board[index],
                  onButtonClicked: onButtonClicked,
                  index: index,
                )),
                itemCount: board.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int round = 1;

  void onButtonClicked(int index) {
    if (board[index].isNotEmpty) {
      return;
    }
    if (round.isOdd) {
      board[index] = 'X';
    } else {
      board[index] = 'O';
    }
    round++;
    setState(() {});

    if (round < 5) {
      return;
    }

    if (checkWinner('X')) {
      player1score++;
      clearBoard();
    } else if (checkWinner('O')) {
      player2score++;
      clearBoard();
    } else if (round == 10) {
      clearBoard();
    }
  }

  bool checkWinner(String sympol) {
    if (board[0] == sympol && board[4] == sympol && board[8] == sympol) {
      return true;
    }
    if (board[2] == sympol && board[4] == sympol && board[6] == sympol) {
      return true;
    }
    for (int i = 0; i < board.length; i += 3) {
      if (board[i] == sympol &&
          board[i + 1] == sympol &&
          board[i + 2] == sympol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == sympol &&
          board[i + 3] == sympol &&
          board[i + 6] == sympol) {
        return true;
      }
    }
    return false;
  }

  void clearBoard() {
    board = List.generate(9, (index) => '');
    round = 1;
    setState(() {});
  }
}
