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
      body:Padding(padding: const EdgeInsets.only(top: 40),
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
          },size: const Size(335,46),color:cor1,icon: Icons.notifications,),
              ],
            ),
          SizedBox(height: 40,),
          Column(
            children: [
              Button(text: 'Pendências',onPressed: () {
          },size: const Size(335,46),color:cor1,icon: Icons.pending_outlined,),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Text('Cards de Resumo',
               style:
               TextStyle(fontFamily: 'ABeeZee',color: corLetra1,))
            ],
            )
          ],
          
        ),
        ),
      
      ),
    );
  }
}