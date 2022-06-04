import 'package:flutter/material.dart';

import 'Tela_Inicial.dart';

class Tabela_Nutri extends StatefulWidget {
  @override
  _Tabela_NutriState createState() => _Tabela_NutriState();
}

class _Tabela_NutriState extends State<Tabela_Nutri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Container(
      child: Column(
        children: <Widget> [
        Image.asset('image/pag.png'),
         Text('Página em manutenção!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, ),),
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(

          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.home),
          onPressed: (){

            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Tela_Inicial()));
          }
      ),
    );
  }
}

