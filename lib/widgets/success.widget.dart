import 'package:flutter/material.dart';

import 'loading-button.widget.dart';

class Success extends StatelessWidget {
  var result;
  Function reset;

  Success({this.reset, this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              result,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontFamily: "Big Shoulders Display",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            LoadingButton(
              text: "Calcular Novamente",
              func: reset,
              busy: false,
              invert: true,
            ),
          ],
        ));
  }
}
