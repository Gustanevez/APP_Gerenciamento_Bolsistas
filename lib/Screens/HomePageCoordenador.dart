
import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/button.dart';
import 'package:gerenciamento_bolsistas/Screens/RegisterProject.dart';
import 'package:gerenciamento_bolsistas/Widgets/CardHomeCoordenador.dart';

class Homepagecoordenador extends StatelessWidget {
  const Homepagecoordenador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: cor2,
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            Text('Olá,coordenador',style: TextStyle(fontFamily: ' ABeeZee',color: corLetra1,fontSize: 16))
          ],
        ),
      ),
      body: Padding(padding: const EdgeInsets.only(top: 40),
       child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              
                Button(text: 'Notificações',onPressed: () {
          },size: const Size(335,46),color:cor1,icon:Image.asset('assets/Image/notificacao.png',)),
          
        const  SizedBox(height: 15,),
          Column(
            children: [
              Button(text: 'Pendências',onPressed: () {
          },size: const Size(335,46),color:cor1,icon:Image.asset('assets/Image/pendencia.png')),
            ],
          ),
         const SizedBox(height: 25,),     

         SizedBox(
          height: 350,
          child:ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Button(text: 'teste',size: const Size(160, 176),
              ),
              SizedBox(width: 20,),
              Button(text: 'teste',size: const Size(160, 176),
              ),
              SizedBox(width: 30,),
              Button(text: 'teste',size: const Size(160, 176),
              ),
              

            ],
          ) ,
         ),  
                
          SizedBox(height:40),
        
              Button(text: 'Bolsista',onPressed: () {
          },size: const Size(283,50),color:cor1,icon: Image.asset('assets/Image/Relatorio.png')),
          
          SizedBox(height: 10,),
          
            Button(text: 'Projetos e Metas',onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => const Registerproject()));
          },size: const Size(283,50),color:cor1,icon: Image.asset('assets/Image/data-limite.png')),
        
          SizedBox(height: 15,),
         
              Button(text: 'Relatórios',onPressed: () {
          },size: const Size(283,50),color:cor1,icon: Image.asset('assets/Image/relatorio1.png')),
      
          ],
          
        ),
        ),
      
      ),
    );
  }
}