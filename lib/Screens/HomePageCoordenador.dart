
import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/button.dart';

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
            Column(
              children: [
                Button(text: 'Notificações',onPressed: () {
          },size: const Size(335,46),color:cor1,icon:Image.asset('assets/Image/notificacao.png',)),
              ],
            ),
          SizedBox(height: 15,),
          Column(
            children: [
              Button(text: 'Pendências',onPressed: () {
          },size: const Size(335,46),color:cor1,icon:Image.asset('assets/Image/pendencia.png')),
            ],
          ),
          SizedBox(height: 25,),        
          Column(
            children: [
              Container(
                height: 350,
                width: 186,
                color: cor1,
              )
            ],
          ),
          SizedBox(height:25),
          Column(
            children: [
              Button(text: 'Bolsista',onPressed: () {
          },size: const Size(283,50),color:cor1,icon: Image.asset('assets/Image/Relatorio.png')),
            ],
          ),
          SizedBox(height: 10,),
          Column(
          children: [  
            Button(text: 'Projetos e Metas',onPressed: () {
          },size: const Size(283,50),color:cor1,icon: Image.asset('assets/Image/data-limite.png')),
          ],
          ),
          SizedBox(height: 15,),
          Column(
            children: [
              Button(text: 'Relatórios',onPressed: () {
          },size: const Size(283,50),color:cor1,icon: Image.asset('assets/Image/relatorio1.png')),
            ],
          )
          ],
          
        ),
        ),
      
      ),
    );
  }
}