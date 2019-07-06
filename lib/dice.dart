import 'package:dicee_flut/rolldice.dart';
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Container(
                  // A fixed-height child.
                  height: 180.0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Image(
                        image: AssetImage('assets/diceeLogo.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  // A flexible child that will grow to fit the viewport but
                  // still be at least as big as necessary to fit its contents.
                  flex: 1,
                  child: RollDicee(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
