import 'package:flutter/material.dart';
import 'package:xo__game/game_bord_screeen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String player1Name = '';
  String player2Name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XO_Game'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              player1Name = value;
            },
            decoration:
                const InputDecoration(hintText: 'Enter player one name'),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
              onChanged: (value) {
                player2Name = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter player two  name',
                //    errorBorder:
                // focusedBorder:,
                // enabledBorder:
              )),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                GameBoardScreen.routeName,
                arguments: GameBoardScreenArguments(player1Name, player2Name),
                //  [player1Name, player2Name]
                // {'1': player1Name, '2': player2Name}
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}

class GameBoardScreenArguments {
  String player1Name;
  String player2Name;

  GameBoardScreenArguments(this.player1Name, this.player2Name);
}
