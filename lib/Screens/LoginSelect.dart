import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/HomePageCoordenador.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Screens/HomePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/LoginSenha.dart';

enum Character {coordenador,bolsista}

class SelectLogin extends StatefulWidget {
  final ValueChanged<Character?> onChanged;
  const SelectLogin({super.key,required this.onChanged});

  @override
  State<SelectLogin> createState() => SelectLoginState();

}

class SelectLoginState extends State<SelectLogin> {
  Character? _character = Character.coordenador;

  void setCharacter(Character? value){
    setState(() {
      _character = value;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          ListTile(
            
            title: const Text('Coordenador',style: TextStyle(
              fontFamily: 'ABeeZee',fontSize: 14),),
            leading: Radio<Character>(
              value: Character.coordenador,
              groupValue: _character,
              onChanged: setCharacter,
              ),
          ),
          ListTile(
             title:const Text('Bolsista',style: TextStyle(fontFamily: 'ABeeZee',fontSize: 14),),
             leading: Radio<Character>(value: Character.bolsista,
             groupValue: _character,
             onChanged: setCharacter,
             ),
          )
        ],  
      
    );
  }
}



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Character? selected;

  @override
  Widget build(BuildContext context) {
     return Material(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/Image/logo.png',height: 500,width: 500,),

            SizedBox(height: 4,),

            const Text('Selecione uma das opções abaixo: ',style: TextStyle(
              fontFamily: 'ABeeZee',fontSize: 14
            ),),

            SizedBox(height: 50,),
            Column(
              children: [
              SelectLogin(onChanged: (value){
                setState(() {
                  selected = value;
                });
              })
              ],  
            ),
           const SizedBox(height: 10),

            Column(
              children: [
               Buttonactions(text: 'Continuar',onPressed: () {
                if(selected == Character.coordenador){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LoginSenha(tipoUsuario: 'coordenador')));
                }else if(selected == Character.bolsista){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const LoginSenha(tipoUsuario: 'bolsista',)));
                }
               },size: Size(MediaQuery.of(context).size.width * 0.9,46),color: cor4,)
              ],
            )
          ],
         
        )
          
      ),
      
    );
  }
}