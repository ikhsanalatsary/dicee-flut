import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Welcome to Las Vegas',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Image(
                    image: AssetImage('assets/diceeLogo.png'),
                  ),
                ),
              ),
              RollDicee(),
            ],
          ),
        ),
      ),
    );
  }
}

class RollDiceeState extends State<RollDicee> {
  String randomImage1 = getRandom();
  String randomImage2 = getRandom();

  static String getRandom() {
    return (Random().nextInt(6) + 1).toString();
  }

  void rollingDicee() {
    setState(() {
      randomImage1 = getRandom();
      randomImage2 = getRandom();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isIPhone = Theme.of(context).platform == TargetPlatform.iOS;
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(
                  left: isIPhone ? 70.0 : 60.0,
                  right: isIPhone ? 70.0 : 60.0,
                  top: isIPhone ? 80.0 : 40.0,
                  bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Image(
                      image: AssetImage('assets/dice' + randomImage1 + '.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Image(
                      image: AssetImage('assets/dice' + randomImage2 + '.png'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: RaisedButton(
                child: Text('ROLL'),
                onPressed: rollingDicee,
                padding: EdgeInsets.all(15.0),
                color: Colors.redAccent[700],
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RollDicee extends StatefulWidget {
  @override
  RollDiceeState createState() => new RollDiceeState();
}
