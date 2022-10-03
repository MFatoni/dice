import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void changeDiceFace() {
    setState(() {
      leftDiceNumber = math.Random().nextInt(6) + 1;
      rightDiceNumber = math.Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              // set state will trigger rebuild
              // setState(() {
              //   leftDiceNumber = math.Random().nextInt(6) + 1;
              // });
              changeDiceFace();
              debugPrint("left clicked");
            },
            child: Image.asset('images/dice$leftDiceNumber.png'),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              // set state will trigger rebuild
              // setState(() {
              //   rightDiceNumber = math.Random().nextInt(6) + 1;
              // });
              changeDiceFace();
              debugPrint("right clicked");
            },
            child: Image(
              image: AssetImage('images/dice$rightDiceNumber.png'),
            ),
          ),
        ),
      ]),
    );
  }
}

// stateless widget must be used when widgets are not change dynamicly
class Dice extends StatelessWidget {
  // only created once
  int leftDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    // will be created eveytime rebuild
    // int leftDiceNumber = 1;
    return Center(
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              debugPrint("left clicked");
            },
            child: Image.asset('images/dice$leftDiceNumber.png'),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              debugPrint("right clicked");
            },
            child: Image(
              image: AssetImage('images/dice1.png'),
            ),
          ),
        ),
      ]),
    );
  }
}
