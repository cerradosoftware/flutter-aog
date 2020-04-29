import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit-form.widget.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var gasolinaController = new MoneyMaskedTextController();
  var alcoolController = new MoneyMaskedTextController();
  var busy = false;
  var completed = false;
  var resultText = "";
  Color color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1200),
          color: color,
          child: ListView(
            children: <Widget>[
              Logo(),
              completed
                  ? Success(
                      reset: reset,
                      result: resultText,
                    )
                  : SubmitForm(
                      alcoolController: alcoolController,
                      gasolinaController: gasolinaController,
                      busy: busy,
                      submitFunc: calculate,
                    )
            ],
          ),
        ));
  }

  Future calculate() {
    double alcool = double.parse(
      alcoolController.text.replaceAll(new RegExp(r'[,.]'), ''),
    );
    double gasolina = double.parse(
      gasolinaController.text.replaceAll(new RegExp(r'[,.]'), ''),
    );

    double resultado = alcool / gasolina;
    setState(() {
      color = Colors.deepPurpleAccent;
      completed = false;
      busy = true;
    });

    return new Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (resultado > 0.7) {
          resultText = "Compensa usar gasolina!";
        } else {
          resultText = "Compensa usar ALcool!";
        }
        completed = true;
        busy = false;
      });
    });
  }

  reset() {
    setState(() {
      gasolinaController = new MoneyMaskedTextController();
      alcoolController = new MoneyMaskedTextController();
      busy = false;
      completed = false;
      color = Colors.deepPurple;
    });
  }
}
