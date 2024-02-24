import 'package:flutter/material.dart';
import 'package:xo__game/game_bord_screeen.dart';
import 'package:xo__game/login_screen.dart';

void main() {
  runApp(const XOGame());
}

class XOGame extends StatelessWidget {
  const XOGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        GameBoardScreen.routeName: (context) => const GameBoardScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
