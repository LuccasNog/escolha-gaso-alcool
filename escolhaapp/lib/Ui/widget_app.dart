import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  //const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //GLobal key para validar o formulário
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //CONTROLAR OS DADOS QUE O USUÁRIO INFORMA
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController alcoolController = TextEditingController();
  String _infoText = "Informe o valor de cada combustivel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gasolina ou Alcool"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {})
        ],
      ),
      body: Form(
        key: _formKey,
        //GLobal key para validar o formulário
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.directions_car,
              color: Colors.orange,
              size: 60.0,
            ),
            TextFormGasolina(),
            TextFormAlcool(),
            BuildButtonSave(context),
            buildTextInfo(),
          ],
        ),
      ),
    );
  }

  //EXIBIR AS INFORMAÇÕES
  buildTextInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }

  // ignore: non_constant_identifier_names
  TextFormGasolina() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Preço da Gasolina",
          labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
      //Controlar os dados digitados pelo usuário
      controller: gasolinaController,
      //validação pra fazer
      validator: (value) {
        //SE o valor for vázio
        if (value.isEmpty || value == null) {
          return 'Informe o valor da Gasolina';
        } else {
          return null;
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  TextFormAlcool() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: "Preço da Alcool",
            labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        controller: alcoolController,
        //validação pra fazer
        validator: (value) {
          //SE o valor for vázio
          if (value.isEmpty || value == null) {
            return 'Informe o valor do alcool';
            // print(value);
          } else {
            return null;
          }
        });
  }

  //COntext é o contexto
  // ignore: non_constant_identifier_names
  BuildButtonSave(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          //validando o formulário
          if (_formKey.currentState.validate()) {
            //chamando o metodo calcular

            //colocando foco no campo quando chega o usuário
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text(
          "Calcular",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        color: Colors.orange,
      ),
    );
  }
}
