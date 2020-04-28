import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button.widget.dart';
import 'package:aog/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  var _gasolinaController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Container(
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
                    "COMPENSA USAR ALCOOL",
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
                    func: () {},
                    busy: false,
                    invert: true,
                  ),
                ],
              )),
          Input(label: "Gasolina", controller: _gasolinaController),
          Input(label: "Alcool", controller: _alcoolController),
          LoadingButton(
            text: "Calcular",
            func: () {},
            busy: false,
            invert: false,
          ),
        ],
      ),
    );
  }
}
