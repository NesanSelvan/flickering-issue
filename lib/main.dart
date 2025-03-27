import 'package:flutter/cupertino.dart';

import 'test_screen.dart';

void main() {
  runApp(
    const CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: GameScreen(),
    ),
  );
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Test'),
      ),
      child: Container(
        color: CupertinoColors.white,
        child: Center(
          child: CupertinoButton(
            child: const Text('Start Game'),
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => TestScreen()));
            },
          ),
        ),
      ),
    );
  }
}
