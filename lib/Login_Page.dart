import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Tela_Inicial.dart';


class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}


class FormModel{
  String user;
  String password;
  FormModel({this.user, this.password});
}




class _Login_PageState extends State<Login_Page> {
  final _formKey = GlobalKey<FormState>();

  final _emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String _senha ;


  final model = FormModel();

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

      body: Container(
        padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
        child: Container(
          child: Column(
            children: <Widget> [
              Container(
               child: Image.asset("image/logo.png"),
              ),
              Form(
                key: _formKey,
                child: Column(

                  children: <Widget> [
                    
                  MyFormTextField(
                    
                    isObscure: false,

                    decoration: InputDecoration(
                      labelText: "User E-mail",
                      hintText: "Ex. user@user.com"
                    ),
                    validator: (value){

                      if (value.isEmpty){
                        return 'Por favor, digite um email válido';
                      }else if(!_emailRegExp.hasMatch(value)){
                        return 'Email inválido!Por favor, digite um email válido ';
                      }
                      return null;
                    },

                    onSaved: (value){
                      model.user = value;
                    },
                  ),
                    MyFormTextField(

                      isObscure: true,
                      decoration: InputDecoration(

                        labelText: "Password",
                       // hintText: "Digite sua senha",
                      ),
                      validator: (value){
                        _senha=value;
                        if (value.isEmpty){
                          return 'Digite sua senha';
                        }else if (value.length <= 5){
                          return 'Senha inválida! Por favor, digite uma senha válida ';
                        }
                        return null;
                      },

                      onSaved: (value){
                        model.password= value;
                      },

                    ),
                    Padding(padding: EdgeInsets.only(top:50),),

                    FormSubmitButton(

                      onPressed: (){
                        if (_formKey.currentState.validate()){
                          _formKey.currentState.save();
                          Scaffold.of(_formKey.currentContext).showSnackBar(SnackBar(content: Text('Processing')));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Tela_Inicial(nomeUsuario:model.user.toString())));
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,

          child: Icon(Icons.attach_email),
          onPressed: (){
            _faleConosco(context);
            /*Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Tela_Inicial()));*/

            print('Redirecionando ....');
          }
      ),

    );
  }
}

class MyFormTextField extends StatelessWidget {
  Function(String) onSaved;
  InputDecoration decoration;
  Function(String) validator;
  final bool isObscure;

  MyFormTextField(
      {this.isObscure,
        this.decoration,
        this.validator,
        this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: decoration,
      validator: validator,
      onSaved: onSaved,
    );
  }
}

class FormSubmitButton extends StatelessWidget {
  final Function() onPressed;
  FormSubmitButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: RaisedButton(

          color: Colors.lightGreen,
          onPressed: onPressed,
          child: Text('Entrar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
        ),
      width: 200,
      height: 50,
        );
  }
}
