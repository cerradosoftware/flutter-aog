import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'input.widget.dart';
import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasolinaController = new MoneyMaskedTextController();
  var alcoolController = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm(
      {@required this.gasolinaController,
      @required this.alcoolController,
      @required this.busy,
      @required this.submitFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(label: "Gasolina", controller: gasolinaController),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(label: "Alcool", controller: alcoolController),
        ),
        LoadingButton(
          text: "Calcular",
          func: submitFunc,
          busy: busy,
          invert: false,
        ),
      ],
    );
  }
}
