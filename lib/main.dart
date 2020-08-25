import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = "";

  void _limparTexto(){
    pesoController.text = "";
    alturaController.text = "";

    setState(() {
      resultado = "Informe seu peso e altura";
    });
  }

  void _calcularIMC(){
    
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;

    double imc = peso / (altura * altura);

    setState(() {
    if(imc < 18.6){
       resultado = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 18.6 && imc < 24.9){
       resultado = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 24.9 && imc < 29.9){
       resultado = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 29.9 && imc < 34.9){
       resultado = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 34.9 && imc < 39.9){
       resultado = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 40){
       resultado = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _limparTexto)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline, size: 120.0, color: Colors.green),
          TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (kg)",
              labelStyle: TextStyle(color: Colors.green, fontSize: 25.0)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
            controller: pesoController,
          ),
          TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura",
              labelStyle: TextStyle(color: Colors.green, fontSize: 25.0)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
            controller: alturaController,
          ),
          Padding(
            padding: EdgeInsets.only(top:10.0, bottom:10.0),
            child: Container(
              height: 50.0,
              child:RaisedButton(
                onPressed: _calcularIMC,
                child: Text("Calcular", style:TextStyle(color: Colors.white, fontSize: 25.0)),
                color: Colors.green,
              )
            ),
          ),
          Text(resultado,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0), 
          ),
        ],
      ), 
      )
    );
  }
}