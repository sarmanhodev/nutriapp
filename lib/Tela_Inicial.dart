import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Calculo_Caloria.dart';
import 'package:new_app/Gordura_Corporal.dart';
import 'package:new_app/Calculo_IMC.dart';
import 'package:new_app/fragment.dart';




class Tela_Inicial extends StatefulWidget {
   String nomeUsuario;

   Tela_Inicial({this.nomeUsuario});


  @override
  _Tela_InicialState createState() => _Tela_InicialState();
}

class _Tela_InicialState extends State<Tela_Inicial> {
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;

    void _showDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Fale Conosco"),
            content: new Text("Para dúvidas, sugestões, reclamações ou elogios, envie-nos um email: suportenutri@gmail.com"),
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


    return Scaffold(



      body: Stack(



    children: <Widget> [
      //CONTAINER IMG LOGO
      Container(


        height: size.height *.7,
        child: Padding(

          padding: EdgeInsets.only(top: 66),
          //child:  Image.network('', alignment: Alignment.topCenter,),
        ),

      ),

      Column(


        children: <Widget> [
          Padding(padding: EdgeInsets.all(50),),
           Text('Seja bem-vindo\n ${widget.nomeUsuario}!', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
          Container(


            height: 64,
            margin: EdgeInsets.only(bottom: 20),

          ),
          Expanded(


            child:  GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),

              children: <Widget> [


               /* RaisedButton(
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  color: Colors.white,

                  child: Image.asset('image/imc.png') ,


                  onPressed: (){
                    print('Funcionou');

                  },
                ) ,
                RaisedButton(
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  color: Colors.white,
                  child: Image.asset('image/networking.png') ,

                  onPressed: (){

                  },
                ) ,
                RaisedButton(
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  color: Colors.white,

                  child: Image.asset('image/imc.png') ,

                  onPressed: (){
                    print('Funcionou');

                  },
                ) ,
                RaisedButton(

                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),

                  ),

                  color: Colors.white,
                  child: Image.asset('image/networking.png') ,


                  onPressed: (){

                  },
                ) ,*/
                Card(

                  margin: EdgeInsets.all(2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(


                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [

                      FlatButton(
                        
                        child:  Image.asset('image/imc.png'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),
                          );

                          print('Transição de tela funcionando'); },
                      ),
                      Text('Calcule seu IMC', style: TextStyle(fontWeight: FontWeight.bold),),
                      //SvgPicture.network('https://cdn.worldvectorlogo.com/logos/imc.svg', height: 100,) ,

                    ],
                  ),

                ),
                Card(
                  margin: EdgeInsets.all(2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      FlatButton(
                        child:  Image.asset('image/body_percentage.png', height: 142,),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GorduraCorporal()),
                          );
                          print('Transição de tela funcionando'); },
                      ),
                      Text('Taxa de Gordura Corporal', style: TextStyle(fontWeight: FontWeight.bold),),
                      //SvgPicture.network('https://cdn.worldvectorlogo.com/logos/imc.svg', height: 100,) ,

                    ],
                  ),

                ),
                Card(
                  margin: EdgeInsets.all(2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      FlatButton(
                        child:  Image.network("https://clinicher.com.br/wp-content/uploads/2020/06/nutricao.png"),
                        onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Tabela_Nutri()),
                        );
                          print('Funcionou'); },
                      ),
                      Text('Tabela Nutricional', style: TextStyle(fontWeight: FontWeight.bold),),
                      //SvgPicture.network('https://cdn.worldvectorlogo.com/logos/imc.svg', height: 100,) ,

                    ],
                  ),

                ),
                Card(
                  margin: EdgeInsets.all(2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      FlatButton(
                        child:  Image.asset('image/calorias.png'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Calculo_Caloria()),
                          );

                          print('Transição de tela funcionando'); },
                      ),
                      Text('Calorias Diárias', style: TextStyle(fontWeight: FontWeight.bold),),
                      //SvgPicture.network('https://cdn.worldvectorlogo.com/logos/imc.svg', height: 100,) ,

                    ],
                  ),

                ),
                //FALE CONOSCO
              /*  Card(
                  margin: EdgeInsets.all(2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      FlatButton(
                        child:  Image.asset('image/fale.png'),
                        onPressed: (){
                          _showDialog(context);
                        },
                      ),
                      Text('Fale Conosco', style: TextStyle(fontWeight: FontWeight.bold),),
                      //SvgPicture.network('https://cdn.worldvectorlogo.com/logos/imc.svg', height: 100,) ,

                    ],
                  ),

                ),*/


               /* Card(
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      SvgPicture.network('https://cdn.worldvectorlogo.com/logos/imc.svg', height: 128,) ,
                      Text('Calcule seu IMC'),
                      FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () { /* ... */ },
                          ),
                    ],
                  ),

                ),
                Card(
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      SvgPicture.network('https://www.flaticon.com/svg/vstatic/svg/3373/3373118.svg?token=exp=1620492542~hmac=e3a9d7de9f0d0813c214634054ed5790', height: 115,) ,
                      Text('Calcule seu BMI'),
                    ],
                  ),

                ),
                Card(margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      SvgPicture.network('https://www.flaticon.com/svg/vstatic/svg/1787/1787151.svg?token=exp=1620491888~hmac=d660ed225b6e387a5673b776f5e128f5', height: 115,) ,
                      Text('Tabela Nutricional'),
                    ],
                  ),

                ),
                Card(
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation:4 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      SvgPicture.asset('image/networking.png', height: 120,) ,
                      Text('Outras Opções'),
                    ],
                  ),

                ),*/
    ],
    ),)

        ],
      ),
    ],
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add_call),
          onPressed: (){
            _showDialog(context);
            /*Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Tela_Inicial()));*/

            print('Redirecionando ....');
          }
      ),
    );

  }
}
