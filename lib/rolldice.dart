import 'package:flutter/material.dart';
import 'dart:math';

class RollDiceeState extends State<RollDicee> {
  String _randomImage1 = getRandom();
  String _randomImage2 = getRandom();

  static String getRandom() {
    return (Random().nextInt(6) + 1).toString();
  }

  void rollingDicee() {
    setState(() {
      _randomImage1 = getRandom();
      _randomImage2 = getRandom();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isIPhone = Theme.of(context).platform == TargetPlatform.iOS;
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: EdgeInsets.only(top: isPotrait ? 50.0 : 10.0),
      height: isPotrait ? height * (isIPhone ? 0.8 : 0.7) : (isIPhone ? height / 1.5 : height / 2),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: isPotrait ? 20.0 : 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Image(
                      image: AssetImage('assets/dice$_randomImage1.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Image(
                      image: AssetImage('assets/dice$_randomImage2.png'),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: isPotrait ? 70.0 : 20.0),
                child: RaisedButton(
                  child: Text('ROLL'),
                  onPressed: rollingDicee,
                  padding: EdgeInsets.all(15.0),
                  color: Colors.redAccent[700],
                  textColor: Colors.white,
                ),
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
