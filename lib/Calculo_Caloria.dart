import 'package:flutter/material.dart';
import 'Calculo_IMC.dart';
import 'Gordura_Corporal.dart';
import 'Tela_Inicial.dart';
import 'fragment.dart';

class Calculo_Caloria extends StatefulWidget {
  @override
  _Calculo_CaloriaState createState() => _Calculo_CaloriaState();
}

class _Calculo_CaloriaState extends State<Calculo_Caloria> {
  TextEditingController _textEditingControllerAltura = TextEditingController();
  TextEditingController _textEditingControllerPeso = TextEditingController();
  TextEditingController _textEditingControllerAge = TextEditingController();
  String _retornaResultado = "";
  String _textoRetorno="";
  int _escolhaUsuario;
  int _escolhaAtv;


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

//FÓRMULA PARA CÁLCULOS FEMININOS
  void _calcFeminino(BuildContext context) {
    double calcAltura = double.tryParse(_textEditingControllerAltura.text);
    double calcPeso = double.tryParse(_textEditingControllerPeso.text);
    int calcIdade = int.tryParse(_textEditingControllerAge.text);
    double resultado;


    if( calcAltura == null || calcPeso == null || calcIdade == null){
      setState(() {

        _textoRetorno = 'Valor inválido, preencha os campos! Digite número maiores que zero e utilizando ponto (.) entre eles';
      });

    }else {
      if(calcIdade < 18 && _escolhaAtv ==1){
      resultado = (12.2*calcPeso)+746;
      resultado = resultado*1.5;
      setState(() {
        _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
      });

    } else if(calcIdade < 18 && _escolhaAtv == 2)   {
        resultado = (12.2*calcPeso)+746;
        resultado = resultado*1.6;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });
      }else if(calcIdade < 18 && _escolhaAtv == 3){
        resultado = (12.2*calcPeso)+746;
        resultado = resultado*1.8;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });

      } else if( calcIdade <= 30 && _escolhaAtv == 1){ //CÁLCULO ATIVIDADE LEVE
        resultado = (14.7*calcPeso)+496;
        resultado = resultado*1.5;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingerida deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
          //_textoRetorno = 'Sua condição atual é: Abaixo do peso';
        });
      }else if ( calcIdade <= 30 && _escolhaAtv == 2){ //CÁLCULO ATIVIDADE MODERADA
        resultado = (14.7*calcPeso)+496;
        resultado = resultado*1.6;

        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingerida deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }else if ( calcIdade <= 30 && _escolhaAtv == 3){ //CÁLCULO ATIVIDADE INTENSA
        resultado = (14.7*calcPeso)+496;
        resultado = resultado*1.8;

        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }
      else if(calcIdade >=31 && _escolhaAtv ==1){
        resultado = (8.7*calcPeso)+829;
        resultado = resultado*1.5;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }else if(calcIdade >=31 && _escolhaAtv == 2){
        resultado = (8.7*calcPeso)+829;
        resultado = resultado*1.6;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }else if(calcIdade >=31 && _escolhaAtv == 3){
        resultado = (8.7*calcPeso)+829;
        resultado = resultado*1.8;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }else if(calcIdade >=61 && _escolhaAtv == 1){
        resultado = (10.5*calcPeso)+596;
        resultado = resultado*1.5;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }else if(calcIdade >=61 && _escolhaAtv == 2){
        resultado = (10.5*calcPeso)+596;
        resultado = resultado*1.6;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }else if(calcIdade >=61 && _escolhaAtv == 3){
        resultado = (10.5*calcPeso)+596;
        resultado = resultado*1.8;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }

      //_limparCampos();

    }
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

//////////////////////////////////////////////////////////////////////////////////////////////////

  //FÓRMULA PARA CÁLCULOS MASCULINOS
  void _calcMasculino(BuildContext context) {
    double calcAltura = double.tryParse(_textEditingControllerAltura.text);
    double calcPeso = double.tryParse(_textEditingControllerPeso.text);
    int calcIdade = int.tryParse(_textEditingControllerAge.text);
    double resultado;



    if( calcAltura == null || calcPeso == null || calcIdade == null){
      setState(() {
        _textoRetorno = 'Valor inválido, preencha os campos! Digite número maiores que zero e utilizando ponto (.) entre eles';
      });

    }else {
      if(calcIdade < 18 && _escolhaAtv == 1){
        resultado = (17.5*calcPeso)+651;
        resultado = resultado*1.6;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
          //_textoRetorno = 'Sua condição atual é: Abaixo do peso';
        });

      }else if(calcIdade < 18 && _escolhaAtv == 2){
        resultado = (17.5*calcPeso)+651;
        resultado = resultado*1.7;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
          //_textoRetorno = 'Sua condição atual é: Abaixo do peso';
        });

      }else if(calcIdade < 18 && _escolhaAtv == 3){
        resultado = (17.5*calcPeso)+651;
        resultado = resultado*2.10;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });

      }
      else if( calcIdade  <= 30 && _escolhaAtv == 1){
        resultado = (15.3*calcPeso)+679;
        resultado = resultado * 1.6;

        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
          //_textoRetorno = 'Sua condição atual é: Abaixo do peso';
        });
      }else if (calcIdade  <= 30 && _escolhaAtv == 2){
        resultado = (15.3*calcPeso)+679;
        resultado = resultado*1.7;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      } else if (calcIdade  <= 30 && _escolhaAtv == 3){
        resultado = (15.3*calcPeso)+679;
        resultado = resultado*2.10;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';

        });
      }else if( calcIdade  >= 31 && _escolhaAtv == 1){
        resultado = (11.6*calcPeso)+879;
        resultado = resultado*1.6;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });
      }else if( calcIdade  >= 31 && _escolhaAtv == 2){
        resultado = (11.6*calcPeso)+879;
        resultado = resultado*1.7;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });

      }else if( calcIdade  >= 31 && _escolhaAtv == 3){
        resultado = (11.6*calcPeso)+879;
        resultado = resultado*2.10;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });

      }else if( calcIdade  >= 61 && _escolhaAtv == 1){
        resultado = (13.5*calcPeso)+487;
        resultado = resultado*1.6;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });

      }else if( calcIdade  >= 61 && _escolhaAtv == 2){
        resultado = (13.5*calcPeso)+487;
        resultado = resultado*1.7;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });

      }else if( calcIdade  >= 61 && _escolhaAtv == 3){
        resultado = (13.5*calcPeso)+487;
        resultado = resultado*2.10;
        setState(() {
          _retornaResultado ='Quantidade de calorias diárias ingeridas deve ser:  ' + resultado.toStringAsFixed(2) + ' calorias!';
        });

      }

      //_limparCampos();

    }
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

  //MÉTODO PARA DICAS
  void _exibeDicas(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Dicas"),
          content: new Text("Para perder 1 kg de peso corporal é preciso queimar cerca de 7000 calorias.\n"
          "É possível gastar mais calorias aumentando seu nível de atividade física.\n"
          "Certas atividades queimam mais calorias do que outras mas isso depende também do esforço que a pessoa faz para realizar a atividade na perfeição."),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(


    appBar: AppBar(
        title: Text('TMB: Taxa Metabólica Basal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),

        backgroundColor: Colors.lightGreen,

      ),
      body: Container(

          child: SingleChildScrollView  (
            padding: EdgeInsets.all(32),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
             /*   Padding(padding: EdgeInsets.all(16),
                  child: Image.asset("image/calorias.png", height: 100,),
                ),*/
               /*Padding(padding: EdgeInsets.all(16),
                  child: Text("TMB: Taxa Metabólica Basal ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                ),*/
                Column(

                  children: <Widget> [
                    Row(
                      children: <Widget> [
                        Text('Sexo', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    RadioListTile(
                      title: Text('Masculino'),

                        value: 1,
                        groupValue: _escolhaUsuario,
                        onChanged: (int escolha){
                        setState(() {

                          _escolhaUsuario = escolha;
                        });

                        }),


                    RadioListTile(
                        title: Text('Feminino'),
                        value: 2,
                        groupValue: _escolhaUsuario,
                        onChanged:  (int escolha){
                          setState(() {
                            _escolhaUsuario = escolha;
                          });


                        }),
                  ],
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ('Digite sua idade, ex: 20'),
                  ),
                  style: TextStyle(
                    fontSize: 15,

                  ),
                  controller: _textEditingControllerAge,
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
            Padding(padding: EdgeInsets.only(top:20),),
                Row(
                  children: <Widget> [
                    Text('Tipo de Atividade Física',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
               RadioListTile(
                  title: Text('Leve'),
                    subtitle: Text('Ex. Sedentário, Leve'),
                    value: 1,
                    groupValue: _escolhaAtv,
                    onChanged: (int escolhaAtividade){
                    setState(() {
                      _escolhaAtv = escolhaAtividade;
                    });

                    }),
                RadioListTile(
                    title: Text('Moderada'),
                    subtitle: Text('Ex. Corrida leve, musculação leve'),
                    value: 2,
                    groupValue: _escolhaAtv,
                    onChanged: (int escolhaAtividade){
                     setState(() {
                       _escolhaAtv = escolhaAtividade;
                     });

                    }),

                RadioListTile(
                    title: Text('Intensa'),
                    subtitle: Text('Ex. Corrida intesa, musculação '),
                    value: 3,
                    groupValue: _escolhaAtv,
                    onChanged: (int escolhaAtividade){
                      setState(() {
                        _escolhaAtv = escolhaAtividade;
                      });

                    }),


                Padding(padding: EdgeInsets.all(16),
                  child: RaisedButton(
                      child: Text("Calcular", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                      color: Colors.green,
                      padding: EdgeInsets.all(15),
                      onPressed: (){
                      if( _escolhaUsuario == 1){
                        setState(() {
                          _calcMasculino(context);
                        });
                      }else{
                        setState(() {
                          _calcFeminino(context);
                        });
                      }
                      }
                  ),
                ),
                Text(_textoRetorno),
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
                title: Text("Calcular Taxa de BF"),
                subtitle: Text("Tela de BF"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => GorduraCorporal()));
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
          child: Icon(Icons.add_alert_rounded),
          onPressed: (){
            _exibeDicas(context);
          }
      ),

/*bottomNavigationBar: BottomNavigationBar(

  items: [

    BottomNavigationBarItem(

      icon: Icon(Icons.home),
    label: ('Home'),
    ),
    BottomNavigationBarItem(

      icon: Icon(Icons.calculate_outlined),
      label: ('IMC'),
    ),
    BottomNavigationBarItem(

      icon: Icon(Icons.calculate),
      label: ('BMI'),
    ),
    BottomNavigationBarItem(

      icon: Icon(Icons.phone),
      label: ('Help'),
    ),

  ],
),*/
    );
  }
}

