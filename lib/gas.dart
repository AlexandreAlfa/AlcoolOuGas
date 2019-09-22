import 'package:toast/toast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GasOrAlcool extends StatefulWidget {
  @override
  _GasOrAlcoolState createState() => _GasOrAlcoolState();
}

class _GasOrAlcoolState extends State<GasOrAlcool> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  var _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child:SingleChildScrollView(
          child: 
          Column(
            children: <Widget>[
              Image.asset('img/logo.png'),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: 
                  Text('Saiba qual a melhor opção para abastecimento do seu carro',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20),),),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child:TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'preço do Alcool, ex: 1.59'
                    ),
                  ) ,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextField(
                    controller: _controller2,
                    decoration: InputDecoration(
                      hintText: 'preço da gasolina, ex: 3.15'
                    ),
                  ),
              ),    
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child:RaisedButton(child: Text('Calcular'
                  ,style: TextStyle(color: Colors.white),),
                  color: Colors.blueAccent,
                  onPressed: (){
                    try {
                      double gas = double.parse(_controller2.text??0);
                      double alc = double.parse(_controller.text??0);
                      setState(() {
                      if(alc <= gas*0.7){
                        _result = 'É melhor álcool';
                      }
                      else{
                        _result = 'É melhor gasolina';
                      }
                    });
                    } catch (e) {
                      Toast.show('Valor digita incorreto', context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM);
                    }
                  },) ,
              ) ,
              Padding(padding: EdgeInsets.only(top: 10),
              child: Text('Resultado'),),
              Padding(padding: EdgeInsets.only(top: 10),
              child: Text(_result),),
            ],
              ),
            )
          ),
    );
  }
}