import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Calculo_Caloria.dart';
import 'package:new_app/Calculo_IMC.dart';
import 'package:new_app/Tela_Inicial.dart';

import 'fragment.dart';



class GorduraCorporal extends StatefulWidget {
  @override
  _GorduraCorporalState createState() => _GorduraCorporalState();
}

class _GorduraCorporalState extends State<GorduraCorporal> {
  TextEditingController _textEditingControllerAltura = TextEditingController();
  TextEditingController _textEditingControllerPeso = TextEditingController();
  TextEditingController _textEditingControllerNeck = TextEditingController();
  TextEditingController _textEditingControllerCintura = TextEditingController();
  TextEditingController _textEditingControllerQuadril = TextEditingController();
  String _retornaResultado = "";

  int _escolhaUsuario;
  String _textoResult="";



  void _calculaPercentual(){
    double calcAltura = double.tryParse(_textEditingControllerAltura.text);
    double calcPeso = double.tryParse(_textEditingControllerPeso.text);
    double calcNeck = double.tryParse(_textEditingControllerNeck.text);
    double calcCintura = double.tryParse(_textEditingControllerCintura.text);
    double calcQuadril = double.tryParse(_textEditingControllerQuadril.text);





    double resultado=  86.010*log(calcCintura - calcNeck) - 70.041*log(calcAltura) + 30.30 ;

    setState(() {
      _retornaResultado = " Resultado:  " + resultado.toString();
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: new Text("Resultado", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          content: new Text( _retornaResultado),

          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }

  void _faleConosco(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Fale Conosco"),
          content: new Text("Para dúvidas, sugestões, reclamações ou elogios, envie-nos um email: suportenutri@example.com"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text('Calcular Gordura Corporal', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),

        backgroundColor: Colors.lightGreen,

      ),
      body: Container(

          child: SingleChildScrollView  (
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [

                Padding(padding: EdgeInsets.all(16),
                  child: Image.asset('image/body_percentage.png', height: 200,),
                ),
               /*   Row(
                      children: <Widget> [
                        RadioListTile(
                            title: Text('Masculino'),
                            subtitle: Text('Sexo Masculino'),
                            value: 1,
                            groupValue: _escolhaUsuario,
                            onChanged: (int escolha){
                              setState(() {
                                _escolhaUsuario = escolha;
                              });


                            }),

                        RadioListTile(
                            title: Text('Feminino'),
                            subtitle: Text('Sexo Feminino'),
                            value: 2,
                            groupValue: _escolhaUsuario,
                            onChanged: (int escolha){
                              setState(() {
                                _escolhaUsuario = escolha;
                              });


                            }),




            ],

            ),*/
                Padding(padding: EdgeInsets.all(16),
                  child: Text("Faça o cálculo do seu percentual de gordura corporal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                
                Row(
                  
                ),

                TextField( //TEXTFIELD PARA PESO
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ('Insira seu peso, ex: 69.5'),
                  ),
                  style: TextStyle(
                    fontSize: 15,

                  ),
                  controller: _textEditingControllerPeso,

                ),

                TextField(//TEXTFIELD PARA ALTURA
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ('Insira sua altura, ex: 1.90'),
                  ),
                  style: TextStyle(
                    fontSize: 15,

                  ),
                  controller: _textEditingControllerAltura,

                ),
                TextField(//TEXTFIELD PARA PESCOÇO
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ('Insira a medida do seu pescoço, ex: 20cm'),
                  ),
                  style: TextStyle(
                    fontSize: 15,

                  ),
                  controller: _textEditingControllerNeck,

                ),
                TextField(//TEXTFIELD PARA CINTURA
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ('Insira a medida da sua cintura em cm, ex: 40'),
                  ),
                  style: TextStyle(
                    fontSize: 15,

                  ),
                  controller: _textEditingControllerCintura,

                ),
                TextField(//TEXTFIELD PARA QUADRIL
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ('Insira a medida do seu quadril em cm, ex: 50'),
                  ),
                  style: TextStyle(
                    fontSize: 15,

                  ),
                  controller: _textEditingControllerQuadril,

                ),

                Padding(padding: EdgeInsets.all(16),
                  child: RaisedButton(
                      child: Text("Calcular", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                      color: Colors.green,
                      padding: EdgeInsets.all(15),
                      onPressed: _calculaPercentual,
                  ),
                ),
                Text('' ),

                Padding(

                  padding: EdgeInsets.only(top: 20),
                  child: Text(_retornaResultado),
                )



              ],

            ),

          )

      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget> [
            Image.asset('image/logo.jpg'),

            /*DrawerHeader(child: Text('Menu', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
            ),*/
            ListTile(
                leading: Icon(Icons.home),
                title: Text("Página Principal"),
                subtitle: Text("Menu Principal"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Tela_Inicial()));
                  debugPrint('Redirecionando para página inicial');
                }
            ),
            ListTile(
                leading: Icon(Icons.calculate),
                title: Text("Calcular IMC"),
                subtitle: Text("Tela de IMC"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Home()));
                  debugPrint('Redirecionando para página de cálculo de BMI');
                }
            ),
            ListTile(
                leading: Icon(Icons.calculate),
                title: Text("Calorias Diárias"),
                subtitle: Text("Calcular Calorias Diárias"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Calculo_Caloria()));
                  debugPrint('Redirecionando para página de Cálculo de Calorias Diárias');
                }
            ),
            ListTile(
                leading: Icon(Icons.list_alt),
                title: Text("Dicas de Nutrição"),
                subtitle: Text("Dicas de Nutrição"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Tabela_Nutri()));
                  debugPrint('Redirecionando para página de dicas');
                }
            ),
            ListTile(
              leading: Icon(Icons.attach_email),
              title: Text("Fale Conosco"),
              subtitle: Text("Suporte por email"),
              trailing: Icon(Icons.arrow_forward),

              onTap:() {
                _faleConosco(context);
                print('Funcionou'); },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.home),
          onPressed: (){

            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Tela_Inicial()));

            print('Redirecionando para página principal....');
          }
      ),
     /* floatingActionButton: FloatingActionButton(

          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.wifi_protected_setup),
          onPressed: (){
            this.setState(() {
              _textEditingControllerAltura.clear();
              _textEditingControllerPeso.clear();

            });
          }
      ),*/


    );;
  }
}

