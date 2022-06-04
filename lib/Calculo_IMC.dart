import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Calculo_Caloria.dart';
import 'package:new_app/Gordura_Corporal.dart';
import 'package:new_app/fragment.dart';

import 'Tela_Inicial.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingControllerAltura = TextEditingController();
  TextEditingController _textEditingControllerPeso = TextEditingController();
  String _retornaResultado = "";
  String _textoResult="";



  void _limparCampos(){
    _textEditingControllerAltura.text ="";
    _textEditingControllerPeso.text = "";
    _retornaResultado="";
    _textoResult = "";
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


  void _showDialog(BuildContext context) {
    double calcAltura = double.tryParse(_textEditingControllerAltura.text);
    double calcPeso = double.tryParse(_textEditingControllerPeso.text);
    double resultado = (calcPeso)/(calcAltura*calcAltura);


    if( calcAltura == null || calcPeso == null){
      setState(() {
        _textoResult = 'Valor inválido, preencha os campos! Digite número maiores que zero e utilizando ponto (.) entre eles';
      });

    }else {
      if( resultado < 18.5){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toStringAsFixed(2);
          _textoResult = 'Sua condição atual é: Abaixo do peso';
        });
      }else if (resultado < 24.9){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toStringAsFixed(2);
          _textoResult = 'Sua condição atual é: Peso normal';
        });
      }else if (resultado < 29.9){

        setState(() {
          _retornaResultado ='Seu IMC é: ' + resultado.toStringAsFixed(2);
          _textoResult = 'Sua condição atual é: Sobre peso!';
        });
      } else if (resultado < 34.9){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toStringAsFixed(2);
          _textoResult = 'Sua condição atual é: Obesidade Grau 1!';
        });

      } else if (resultado < 39.9){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toStringAsFixed(2);
          _textoResult = 'Sua condição atual é: Obesidade Grau 2';
        });
      }else if (resultado > 40){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toStringAsFixed(2);
          _textoResult = 'Sua condição atual é: Obesidade Grau 3';
        });
      }

      //_limparCampos();

    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: new Text("Resultado", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          content: new Text( _retornaResultado + "\n" +  _textoResult),

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


  void _calcular(){
    double calcAltura = double.tryParse(_textEditingControllerAltura.text);
    double calcPeso = double.tryParse(_textEditingControllerPeso.text);
    double resultado = (calcPeso)/(calcAltura*calcAltura);


    if( calcAltura == null || calcPeso == null){
  setState(() {
    _textoResult = 'Valor inválido, preencha os campos! Digite número maiores que zero e utilizando ponto (.) entre eles';
  });

    }else {
      if( resultado < 18.5){
        setState(() {
            _retornaResultado ='Seu IMC é:  ' + resultado.toString();
          _textoResult = 'Sua condição atual é: Abaixo do peso';
        });
      }else if (resultado < 24.9){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toString();
          _textoResult = 'Sua condição atual é: Peso normal';
        });
      }else if (resultado < 29.9){

        setState(() {
          _retornaResultado ='Seu IMC é: ' + resultado.toString();
          _textoResult = 'Sua condição atual é: Sobre peso!';
        });
      } else if (resultado < 34.9){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toString();
          _textoResult = 'Sua condição atual é: Obesidade Grau 1!';
        });

      } else if (resultado < 39.9){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toString();
          _textoResult = 'Sua condição atual é: Obesidade Grau 2';
        });
      }else if (resultado > 40){
        setState(() {
          _retornaResultado ='Seu IMC é:  ' + resultado.toString();
          _textoResult = 'Sua condição atual é: Obesidade Grau 3';
        });
      }

     //_limparCampos();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Cácular IMC', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),

        backgroundColor: Colors.lightGreen,

      ),
      body: Container(

        child: SingleChildScrollView  (
            padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Padding(padding: EdgeInsets.all(16),
              child: Image.asset("image/imc.png", height: 170,),
                ),
              Padding(padding: EdgeInsets.all(16),
                child: Text("Faça o cálculo do seu IMC", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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

              Padding(padding: EdgeInsets.all(16),
                child: RaisedButton(
                  child: Text("Calcular", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  color: Colors.green,
                  padding: EdgeInsets.all(15),
                  onPressed: (){
                    _showDialog(context);
                  }
                ),
              ),
             // Text( _retornaResultado),

             /* Padding(

                padding: EdgeInsets.only(top: 20),
                child: Text(_textoResult),
              )*/



            ],

          ),

        )

      ),
    drawer: Drawer(
      child: ListView(
        children: <Widget> [
          Image.asset('image/logo.jpg'),
         /* DrawerHeader(child: Text('Menu', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),

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
              title: Text("Calcular Taxa de BF"),
              subtitle: Text("Tela de BF"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GorduraCorporal()));
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


    );
  }
}
